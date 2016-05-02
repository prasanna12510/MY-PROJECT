VERSION 5.00
Begin VB.Form addActor 
   ClientHeight    =   5970
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   10140
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5970
   ScaleWidth      =   10140
   Begin VB.Frame Frame1 
      Caption         =   "Add Actor"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   3975
      Left            =   1080
      TabIndex        =   0
      Top             =   840
      Width           =   7815
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
         Height          =   735
         Left            =   4920
         TabIndex        =   4
         Top             =   2280
         Width           =   1695
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
         Height          =   735
         Left            =   3000
         TabIndex        =   3
         Top             =   2280
         Width           =   1695
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
         Height          =   615
         Left            =   3360
         TabIndex        =   2
         Top             =   960
         Width           =   3255
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
         TabIndex        =   1
         Top             =   1080
         Width           =   2175
      End
   End
End
Attribute VB_Name = "addActor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Dim aname As String
Dim aid As Integer

Private Sub Command1_Click()
    aname = Text1.Text
    aname = Trim(aname)
    
    If Len(aname) > 0 Then
        aid = getNextId("aid", "Actor")
        
        rs.AddNew
        rs.Fields(0) = aid
        rs.Fields(1) = aname
        rs.Update
        
        MsgBox "Actor Addded"
        Text1.Text = ""
        Text1.SetFocus
    Else
        MsgBox "Name Missing"
        Text1.SetFocus
    End If
    
End Sub

Private Sub Command2_Click()
    Text1.Text = ""
    Text1.SetFocus
End Sub

Private Sub Form_Load()
    rs.Open "select * from Actor", conn, adOpenDynamic, adLockOptimistic
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
End Sub
