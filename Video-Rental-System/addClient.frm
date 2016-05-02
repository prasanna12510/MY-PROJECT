VERSION 5.00
Begin VB.Form addClient 
   Caption         =   "Add Client"
   ClientHeight    =   6600
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8430
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6600
   ScaleWidth      =   8430
   Begin VB.Frame Frame1 
      Caption         =   "Add Client"
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
      Height          =   5175
      Left            =   600
      TabIndex        =   0
      Top             =   600
      Width           =   6975
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
         Left            =   3240
         Style           =   2  'Dropdown List
         TabIndex        =   10
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
         TabIndex        =   4
         Top             =   3960
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
         TabIndex        =   5
         Top             =   3960
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
         Caption         =   "Membership Type"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   360
         TabIndex        =   9
         Top             =   2760
         Width           =   2175
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
         TabIndex        =   8
         Top             =   600
         Width           =   2175
      End
      Begin VB.Label Label2 
         Caption         =   "Address"
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
         TabIndex        =   7
         Top             =   1320
         Width           =   2775
      End
      Begin VB.Label Label3 
         Caption         =   "Phone"
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
Attribute VB_Name = "addClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset

Dim id As Integer
Dim i As Integer

Private Sub Command1_Click() 'add click
On Error GoTo addErr
    
    For i = Text1.LBound To Text1.UBound
    
        Text1(i).Text = Trim(Text1(i).Text)
        If Len(Text1(i).Text) = 0 Then
            MsgBox "Data Missing"
            Exit Sub
        End If
        
    Next
    
    id = getNextId("cid", "Client")
    
    rs.AddNew
    rs.Fields(0) = id
    
    For i = Text1.LBound To Text1.UBound
        rs.Fields(i + 1) = Text1(i).Text
    Next
    
    Dim memid As String
    
    memid = Combo1.List(Combo1.ListIndex)
    memid = Trim(Left(memid, 2))
    
    
    rs.Fields(i + 1) = memid
    
    rs.Update
    
    MsgBox "Client Added"
    
    For i = Text1.LBound To Text1.UBound
        Text1(i).Text = ""
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
    Combo1.ListIndex = 0
    
    Text1(0).SetFocus
    
End Sub

Private Sub Form_Load()
    rs.Open "select * from Client", conn, adOpenDynamic, adLockOptimistic
    populateCombo
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
End Sub

Private Sub populateCombo()
    Dim rs1 As New ADODB.Recordset
        
    rs1.Open "select * from Membership", conn, adOpenStatic, adLockReadOnly
    
    Combo1.Clear
    
    rs1.MoveFirst
    
    Do While Not rs1.EOF
        Combo1.AddItem rs1.Fields(0) & "  " & rs1.Fields(1)
        rs1.MoveNext
    Loop
    
    Combo1.ListIndex = 0
    
    rs1.Close
    Set rs1 = Nothing
End Sub

