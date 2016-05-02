VERSION 5.00
Begin VB.Form addMovie 
   Caption         =   "Add Movie"
   ClientHeight    =   7725
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9330
   LinkTopic       =   "Form5"
   MDIChild        =   -1  'True
   ScaleHeight     =   7725
   ScaleWidth      =   9330
   Begin VB.Frame Frame1 
      Caption         =   "Add Movie"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   5775
      Left            =   1080
      TabIndex        =   0
      Top             =   960
      Width           =   6855
      Begin VB.ListBox List1 
         Height          =   1410
         ItemData        =   "addMovie.frx":0000
         Left            =   3240
         List            =   "addMovie.frx":0002
         Style           =   1  'Checkbox
         TabIndex        =   4
         Top             =   2760
         Width           =   3255
      End
      Begin VB.TextBox Text1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Index           =   0
         Left            =   3240
         TabIndex        =   1
         Top             =   600
         Width           =   3255
      End
      Begin VB.TextBox Text1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Index           =   1
         Left            =   3240
         TabIndex        =   2
         Top             =   1320
         Width           =   3255
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Add"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   3240
         TabIndex        =   5
         Top             =   4560
         Width           =   1575
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Clear"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   4800
         TabIndex        =   7
         Top             =   4560
         Width           =   1575
      End
      Begin VB.TextBox Text1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Index           =   2
         Left            =   3240
         TabIndex        =   3
         Top             =   2040
         Width           =   3255
      End
      Begin VB.Label Label4 
         Caption         =   "Actors"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   360
         TabIndex        =   10
         Top             =   2760
         Width           =   1575
      End
      Begin VB.Label Label1 
         Caption         =   "Name"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   360
         TabIndex        =   9
         Top             =   600
         Width           =   2175
      End
      Begin VB.Label Label2 
         Caption         =   "Year"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   360
         TabIndex        =   8
         Top             =   1320
         Width           =   2775
      End
      Begin VB.Label Label3 
         Caption         =   "Type"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   360
         TabIndex        =   6
         Top             =   2040
         Width           =   2775
      End
   End
End
Attribute VB_Name = "addMovie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Dim rs1 As New ADODB.Recordset
Dim rs2 As New ADODB.Recordset

Dim id As Integer
Dim id1 As Integer

Dim i As Integer
Dim x As String
    
    
Private Sub populateList()
    rs1.MoveFirst
    List1.Clear
    
    Do While Not rs1.EOF
        List1.AddItem rs1.Fields(0) & " " & rs1.Fields(1)
        
        rs1.MoveNext
    Loop
End Sub

Private Sub Command1_Click()
On Error GoTo addErr
    
    For i = Text1.LBound To Text1.UBound
        Text1(i).Text = Trim(Text1(i).Text)
        If Len(Text1(i).Text) = 0 Then
            MsgBox "Data Missing"
            Exit Sub
        End If
        
    Next
    
    If List1.SelCount = 0 Then
        MsgBox "Select Actors"
        Exit Sub
    End If
    
    id = getNextId("mvid", "Movie")
    
    rs.AddNew
    rs.Fields(0) = id
    
    For i = Text1.LBound To Text1.UBound
        rs.Fields(i + 1) = Text1(i).Text
    Next
    
    rs.Update
    
    
    For i = 0 To List1.ListCount - 1
        If List1.Selected(i) Then
            x = List1.List(i)
            x = Mid(x, 1, InStr(1, x, " ") - 1)
                
            id1 = getNextId("maid", "MovieActor")
            rs2.AddNew
            rs2.Fields(0) = id1
            rs2.Fields(1) = id
            rs2.Fields(2) = x
            
            rs2.Update
        
        End If
    
    Next
    
    
    MsgBox "Movie and Actors Added"
    
    For i = Text1.LBound To Text1.UBound
        Text1(i).Text = ""
    Next
    
    For i = 0 To List1.ListCount - 1
        List1.Selected(i) = False
    Next
    
    Text1(0).SetFocus
    
    Exit Sub
addErr:
    MsgBox Err.Description
    
End Sub

Private Sub Command2_Click()
'clear
    For i = Text1.LBound To Text1.UBound
        Text1(i).Text = ""
    Next
    
    For i = 0 To List1.ListCount - 1
        List1.Selected(i) = False
    Next
    
    Text1(0).SetFocus
    
End Sub

Private Sub Form_Load()
    rs.Open "select * from Movie", conn, adOpenDynamic, adLockOptimistic
    rs1.Open "select * from Actor", conn, adOpenDynamic, adLockOptimistic
    rs2.Open "select * from MovieActor", conn, adOpenDynamic, adLockOptimistic
    
    populateList
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
    rs1.Close
    rs2.Close
End Sub

