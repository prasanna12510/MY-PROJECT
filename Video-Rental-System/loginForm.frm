VERSION 5.00
Begin VB.Form loginForm 
   Caption         =   "Form1"
   ClientHeight    =   4350
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9135
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   Picture         =   "loginForm.frx":0000
   ScaleHeight     =   4350
   ScaleWidth      =   9135
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Login"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   3375
      Left            =   960
      TabIndex        =   0
      Top             =   240
      Width           =   6495
      Begin VB.CommandButton Command2 
         Caption         =   "Exit"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   3360
         TabIndex        =   6
         Top             =   2400
         Width           =   2175
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Login"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   720
         TabIndex        =   5
         Top             =   2400
         Width           =   1935
      End
      Begin VB.TextBox Text2 
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   14.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         IMEMode         =   3  'DISABLE
         Left            =   2520
         PasswordChar    =   "*"
         TabIndex        =   4
         Text            =   "111"
         Top             =   1440
         Width           =   3255
      End
      Begin VB.TextBox Text1 
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2520
         TabIndex        =   2
         Text            =   "aaa"
         Top             =   480
         Width           =   3255
      End
      Begin VB.Label Label2 
         Caption         =   "Password"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   360
         TabIndex        =   3
         Top             =   1560
         Width           =   2655
      End
      Begin VB.Label Label1 
         Caption         =   "UserId"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   360
         TabIndex        =   1
         Top             =   720
         Width           =   1935
      End
   End
End
Attribute VB_Name = "loginForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim loginCnt  As Integer
Dim flag As Integer


Private Sub Command1_Click()
'login click
    uid = "pras"
    pass = "mobile"
    
    
    If Len(uid) = 0 Then
        MsgBox "UID Missing"
        Text1.SetFocus
    ElseIf Len(pass) = 0 Then
        MsgBox "PASSWORD Missing"
        Text2.SetFocus
    Else
        validate
    End If
End Sub

Private Sub validate()
    If loginCnt = 0 Then
        connect
    ElseIf loginCnt = 3 Then
        disconnect
        End 'terminate the vb application
    End If
    
    
    Dim sql As String
    Dim rs As New ADODB.Recordset
    
    sql = "select utype from Users where uid = '" & uid & "' and upass = '" & pass & "'"
    Set rs = conn.Execute(sql)
    On Error GoTo loginFailed
    
        rs.MoveFirst
        utype = rs.Fields(0)
        Set rs = Nothing
        MDIForm1.Show
        flag = 1
        Unload Me 'unload current form
    Exit Sub
    
loginFailed:
        MsgBox "Invalid Login"
        Text1.Text = ""
        Text2.Text = ""
        Text1.SetFocus
        loginCnt = loginCnt + 1
    
End Sub

Private Sub Command2_Click()
End
End Sub

Private Sub Form_Load()
    loginCnt = 0
    flag = 0
End Sub



Private Sub Form_Unload(Cancel As Integer)
    If flag = 0 Then
            disconnect
    End If
End Sub
