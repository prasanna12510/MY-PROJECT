VERSION 5.00
Begin VB.Form addMedia 
   Caption         =   "Add Media"
   ClientHeight    =   4770
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9075
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4770
   ScaleWidth      =   9075
   Begin VB.Frame Frame1 
      Caption         =   "Add Media"
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
      Height          =   3255
      Left            =   720
      TabIndex        =   0
      Top             =   720
      Width           =   7335
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
         Left            =   3360
         TabIndex        =   3
         Top             =   2160
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
         Left            =   4920
         TabIndex        =   4
         Top             =   2160
         Width           =   1575
      End
      Begin VB.Label Label1 
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
         Top             =   600
         Width           =   2175
      End
      Begin VB.Label Label2 
         Caption         =   "Rent"
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
         Top             =   1320
         Width           =   2775
      End
   End
End
Attribute VB_Name = "addMedia"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Dim id As Integer
Dim i As Integer

Private Sub Command1_Click()
On Error GoTo addErr
    
    For i = Text1.LBound To Text1.UBound
        Text1(i).Text = Trim(Text1(i).Text)
        If Len(Text1(i).Text) = 0 Then
            MsgBox "Data Missing"
            Exit Sub
        End If
        
    Next
    
    id = getNextId("mid", "Media")
    
    rs.AddNew
    rs.Fields(0) = id
    
    For i = Text1.LBound To Text1.UBound
        rs.Fields(i + 1) = Text1(i).Text
    Next
    
    rs.Update
    
    MsgBox "Media Added"
    
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
    
    Text1(0).SetFocus
    
End Sub

Private Sub Form_Load()
    rs.Open "select * from Media", conn, adOpenDynamic, adLockOptimistic
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
End Sub

