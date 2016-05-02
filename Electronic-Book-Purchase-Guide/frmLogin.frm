VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Login"
   ClientHeight    =   6000
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   9570
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6000
   ScaleWidth      =   9570
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Login"
      Height          =   4695
      Left            =   600
      TabIndex        =   0
      Top             =   480
      Width           =   8055
      Begin VB.CommandButton Command1 
         Caption         =   "Exit"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   1
         Left            =   5400
         TabIndex        =   8
         Top             =   3360
         Width           =   2295
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Login"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   0
         Left            =   3120
         TabIndex        =   7
         Top             =   3360
         Width           =   2295
      End
      Begin VB.ComboBox Combo1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   555
         ItemData        =   "frmLogin.frx":0000
         Left            =   4920
         List            =   "frmLogin.frx":000D
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   2520
         Width           =   2775
      End
      Begin VB.TextBox Text1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         IMEMode         =   3  'DISABLE
         Index           =   1
         Left            =   4920
         PasswordChar    =   "#"
         TabIndex        =   5
         Top             =   1440
         Width           =   2775
      End
      Begin VB.TextBox Text1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Index           =   0
         Left            =   4920
         TabIndex        =   4
         Top             =   480
         Width           =   2775
      End
      Begin VB.Image Image1 
         Height          =   960
         Left            =   480
         Picture         =   "frmLogin.frx":0029
         Stretch         =   -1  'True
         Top             =   720
         Width           =   960
      End
      Begin VB.Label Label1 
         Caption         =   "UserType"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   2
         Left            =   2520
         TabIndex        =   3
         Top             =   2520
         Width           =   2175
      End
      Begin VB.Label Label1 
         Caption         =   "Password"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   1
         Left            =   2520
         TabIndex        =   2
         Top             =   1560
         Width           =   2175
      End
      Begin VB.Label Label1 
         Caption         =   "UserName"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   0
         Left            =   2520
         TabIndex        =   1
         Top             =   600
         Width           =   2175
      End
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim i As Integer
Dim cnt As Integer

Private Sub userlogin(x As Boolean)
    For i = 0 To Text1.Count - 1
        Text1(i).Enabled = x
        
        If x = False Then
            Text1(i).BackColor = RGB(192, 192, 192)
        Else
            Text1(i).BackColor = vbWhite
        End If
    Next
End Sub

Private Sub Combo1_Click()
    If Combo1.ListIndex = 0 Then
        userlogin (False)
    Else
        userlogin (True)
    End If
End Sub

Private Function validate(u As String, p As String, t As String) As Boolean
On Error GoTo loginerr
   
   Dim sql As String
   Dim rs As New ADODB.Recordset
   sql = "select userid from login where username = '" & u & "' and userpass = '" & p & "' and usertype = '" & t & "'"
   rs.Open sql, conn, adOpenDynamic, adLockOptimistic

   rs.MoveFirst
   eid = rs.Fields(0)
   rs.Close
   validate = True
   
   Exit Function
   
loginerr:
    validate = False
    rs.Close
End Function
Private Sub Command1_Click(Index As Integer)
Dim upass As String
Dim uname As String

If Index = 0 Then 'login click

    If Combo1.ListIndex = 0 Then
        'show Learner Form
        frmLearner.Show
        Unload Me
    Else
        'show expert/admin form
        utype = Combo1.Text
        uname = Text1(0).Text
        upass = Text1(1).Text
        
        If validate(uname, upass, utype) Then
            MDIBPG.Show
            Unload Me
        Else
            cnt = cnt + 1
            MsgBox "login failed"
            If cnt = 3 Then
                Command1(0).Enabled = False
            End If
        End If
    End If

ElseIf Index = 1 Then 'exit click
    closeConnection
    Unload Me
End If

End Sub

Private Sub Form_Load()
Combo1.ListIndex = 0
End Sub

