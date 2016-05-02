VERSION 5.00
Begin VB.Form deleteMovieMedia 
   Caption         =   "Delete Movie Media"
   ClientHeight    =   4920
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8880
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   ScaleHeight     =   4920
   ScaleWidth      =   8880
   Begin VB.Frame Frame1 
      Caption         =   "Delete Movie Media"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2535
      Left            =   840
      TabIndex        =   0
      Top             =   960
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
         Left            =   2280
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   480
         Width           =   4695
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Delete"
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
         TabIndex        =   1
         Top             =   1440
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "Movie Media"
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
         TabIndex        =   3
         Top             =   480
         Width           =   1695
      End
   End
End
Attribute VB_Name = "deleteMovieMedia"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Dim x As String
Dim y As String

Private Sub Command1_Click()
    x = Mid(Combo1.List(Combo1.ListIndex), 1, InStr(1, Combo1.List(Combo1.ListIndex), " ") - 1)
    y = Mid(Combo1.List(Combo1.ListIndex), InStr(1, Combo1.List(Combo1.ListIndex), " ") + 1)

    conn.Execute "delete from MovieMedia where mmid = " & x
    
    MsgBox y & " deleted"
    populateCombo
End Sub

Private Sub Form_Load()
    populateCombo
End Sub

Private Sub populateCombo()
    rs.Open "select mmid, mvname, mtype from(( moviemedia inner join movie on moviemedia.mvid = movie.mvid) inner join media on moviemedia.mid = media.mid)", conn, adOpenForwardOnly, adLockReadOnly
    
    Combo1.Clear
    
    rs.MoveFirst
    
    Do While Not rs.EOF
        Combo1.AddItem rs.Fields(0) & " " & rs.Fields(1) & " " & rs.Fields(2)
        rs.MoveNext
    Loop
    Combo1.ListIndex = 0
    
    rs.Close
End Sub
