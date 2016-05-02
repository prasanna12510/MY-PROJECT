VERSION 5.00
Begin VB.Form modifyMovie 
   Caption         =   "Modify Movie"
   ClientHeight    =   7845
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9690
   LinkTopic       =   "Form6"
   MDIChild        =   -1  'True
   ScaleHeight     =   7845
   ScaleWidth      =   9690
   Begin VB.Frame Frame1 
      Caption         =   "Modify Movie"
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
      Height          =   6495
      Left            =   1080
      TabIndex        =   0
      Top             =   480
      Width           =   7455
      Begin VB.ComboBox Combo1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   3600
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   720
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
         Index           =   2
         Left            =   3600
         TabIndex        =   4
         Top             =   2880
         Width           =   3255
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Update"
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
         Left            =   5280
         TabIndex        =   6
         Top             =   5400
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
         Index           =   1
         Left            =   3600
         TabIndex        =   3
         Top             =   2160
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
         Left            =   3600
         TabIndex        =   2
         Top             =   1440
         Width           =   3255
      End
      Begin VB.ListBox List1 
         Height          =   1410
         ItemData        =   "modifyMovie.frx":0000
         Left            =   3600
         List            =   "modifyMovie.frx":0002
         Style           =   1  'Checkbox
         TabIndex        =   5
         Top             =   3600
         Width           =   3255
      End
      Begin VB.Label Label5 
         Caption         =   "Movie Id"
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
         Left            =   720
         TabIndex        =   11
         Top             =   720
         Width           =   1455
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
         Left            =   720
         TabIndex        =   10
         Top             =   2880
         Width           =   2775
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
         Left            =   720
         TabIndex        =   9
         Top             =   2160
         Width           =   2775
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
         Left            =   720
         TabIndex        =   8
         Top             =   1440
         Width           =   2175
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
         Left            =   720
         TabIndex        =   7
         Top             =   3600
         Width           =   1575
      End
   End
End
Attribute VB_Name = "modifyMovie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Dim rs1 As New ADODB.Recordset
Dim rs2 As New ADODB.Recordset
Dim rs3 As New ADODB.Recordset

Dim id As Integer
Dim i As Integer
Dim x As String
Dim y As String
Dim z As String

Private Sub populateCombo()
    Combo1.Clear
    rs.MoveFirst
    
    Do While Not rs.EOF
        Combo1.AddItem rs.Fields(0)
        rs.MoveNext
    Loop
    Combo1.ListIndex = 0
End Sub

    
Private Sub populateList()
    rs1.MoveFirst
    List1.Clear
    
    Do While Not rs1.EOF
        List1.AddItem rs1.Fields(0) & " " & rs1.Fields(1)
        
        rs1.MoveNext
    Loop
End Sub

Private Sub Combo1_Click()
    x = Combo1.List(Combo1.ListIndex)
    y = "mvid=" & x
    
    rs.MoveFirst
    rs.Find y
    
    For i = Text1.LBound To Text1.UBound
        Text1(i).Text = rs.Fields(i + 1)
    Next
    
    For i = 0 To List1.ListCount - 1
        List1.Selected(i) = False
    Next
   
    rs3.Open "select aid from MovieActor where mvid =" & x, conn, adOpenDynamic, adLockBatchOptimistic
    
    For i = 0 To List1.ListCount - 1
        z = List1.List(i)
        z = Mid(z, 1, InStr(1, z, " ") - 1)
        
        rs3.MoveFirst
        
        Do While Not rs3.EOF
                
            If rs3.Fields(0) = z Then
                List1.Selected(i) = True
                Exit Do
            End If
            
            rs3.MoveNext
        Loop
    Next
    
    rs3.Close
    
End Sub

Private Sub Command1_Click()

    If List1.SelCount = 0 Then
        MsgBox "Select Actors"
        Exit Sub
    End If

    
    For i = Text1.LBound To Text1.UBound
        rs.Fields(i + 1) = Text1(i).Text
    Next
    
    rs.Update
    
    x = Combo1.List(Combo1.ListIndex)
    conn.Execute "delete from MovieActor where mvid = " & x
    
    rs2.Open "select * from MovieActor", conn, adOpenDynamic, adLockOptimistic
    
    
   For i = 0 To List1.ListCount - 1
        If List1.Selected(i) Then
            y = List1.List(i)
            y = Mid(y, 1, InStr(1, y, " ") - 1)
                
            id = getNextId("maid", "MovieActor")
            rs2.AddNew
            rs2.Fields(0) = id
            rs2.Fields(1) = x
            rs2.Fields(2) = y
            
            rs2.Update
        
        End If
    
    Next
    rs2.Close
    
    MsgBox "Movie and Actors Updated"
    
End Sub


Private Sub Form_Load()
    rs.Open "select * from Movie", conn, adOpenDynamic, adLockOptimistic
    rs1.Open "select * from Actor", conn, adOpenDynamic, adLockOptimistic
    
    populateList
    populateCombo
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
    rs1.Close
    
End Sub


