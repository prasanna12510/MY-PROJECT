VERSION 5.00
Begin VB.Form modifyClient 
   Caption         =   "Modify Client"
   ClientHeight    =   7860
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9000
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   ScaleHeight     =   7860
   ScaleWidth      =   9000
   Begin VB.Frame Frame1 
      Caption         =   "Modify Membership"
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
      Left            =   480
      TabIndex        =   0
      Top             =   720
      Width           =   7335
      Begin VB.ComboBox Combo2 
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
         Top             =   3840
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
         Left            =   4920
         TabIndex        =   6
         Top             =   4800
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
         Left            =   3240
         TabIndex        =   3
         Top             =   2280
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
         TabIndex        =   2
         Top             =   1560
         Width           =   3255
      End
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
         ItemData        =   "modifyClient.frx":0000
         Left            =   3240
         List            =   "modifyClient.frx":000D
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   840
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
         Left            =   3240
         TabIndex        =   4
         Top             =   3000
         Width           =   3255
      End
      Begin VB.Label Label5 
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
         TabIndex        =   11
         Top             =   3840
         Width           =   2175
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
         TabIndex        =   9
         Top             =   3120
         Width           =   2775
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
         TabIndex        =   8
         Top             =   2400
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
         Left            =   360
         TabIndex        =   7
         Top             =   1680
         Width           =   2175
      End
      Begin VB.Label Label4 
         Caption         =   "Select Client"
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
         TabIndex        =   5
         Top             =   840
         Width           =   2175
      End
   End
End
Attribute VB_Name = "modifyClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Dim i As Integer

Private Sub Combo1_Click()
    Dim x As String
    x = "cid=" & Combo1.List(Combo1.ListIndex)
    
    rs.MoveFirst
    rs.Find x
    
    For i = Text1.LBound To Text1.UBound
        Text1(i).Text = rs.Fields(i + 1)
    Next
    Dim memid As String
    
    memid = rs.Fields(i + 1)
    
    For i = 0 To Combo2.ListCount - 1
         If Trim(Left(Combo2.List(i), 2)) = memid Then
            Combo2.ListIndex = i
            Exit For
         End If
    Next
    
End Sub

Private Sub Command1_Click()
    
    For i = Text1.LBound To Text1.UBound
        rs.Fields(i + 1) = Text1(i).Text
    Next
    
    Dim memid As String
    
    memid = Combo2.List(Combo2.ListIndex)
    memid = Trim(Left(memid, 2))
    
    
    rs.Fields(i + 1) = memid

    
    rs.Update
    MsgBox "Client Modified"
    
    
End Sub

Private Sub Form_Load()
    rs.Open "select * from Client", conn, adOpenDynamic, adLockOptimistic
    populateCombo2
    populateCombo
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
    
End Sub

Private Sub populateCombo()
    Combo1.Clear
    
    rs.MoveFirst
    Do While Not rs.EOF
        Combo1.AddItem rs.Fields(0)
        rs.MoveNext
    Loop
    
    Combo1.ListIndex = 0
End Sub



Private Sub populateCombo2()
    Dim rs1 As New ADODB.Recordset
        
    rs1.Open "select * from Membership", conn, adOpenStatic, adLockReadOnly
    
    Combo2.Clear
    
    rs1.MoveFirst
    
    Do While Not rs1.EOF
        Combo2.AddItem rs1.Fields(0) & "  " & rs1.Fields(1)
        rs1.MoveNext
    Loop
    
    Combo2.ListIndex = 0
    
    rs1.Close
    Set rs1 = Nothing
End Sub


