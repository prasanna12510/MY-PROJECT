VERSION 5.00
Begin VB.Form addMovieMedia 
   Caption         =   "Add Movie Media"
   ClientHeight    =   4935
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8220
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4935
   ScaleWidth      =   8220
   Begin VB.Frame Frame1 
      Caption         =   "Add Movie Media"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3255
      Left            =   840
      TabIndex        =   0
      Top             =   720
      Width           =   5895
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
         Left            =   3600
         TabIndex        =   5
         Top             =   1920
         Width           =   1695
      End
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
         Left            =   2280
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Top             =   1080
         Width           =   3015
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
         Left            =   2280
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   480
         Width           =   3015
      End
      Begin VB.Label Label2 
         Caption         =   "Media"
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
         TabIndex        =   2
         Top             =   1080
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "Movie"
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
         TabIndex        =   1
         Top             =   480
         Width           =   1695
      End
   End
End
Attribute VB_Name = "addMovieMedia"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Dim rs1 As New ADODB.Recordset

Dim x As String
Dim y As String
Dim a As String
Dim b As String
Dim id As Integer

Private Sub Command1_Click()
    On Error GoTo addError
    
    x = Mid(Combo1.List(Combo1.ListIndex), 1, InStr(1, Combo1.List(Combo1.ListIndex), " ") - 1)
    y = Mid(Combo1.List(Combo1.ListIndex), InStr(1, Combo1.List(Combo1.ListIndex), " ") + 1)
    
    
    a = Mid(Combo2.List(Combo2.ListIndex), 1, InStr(1, Combo2.List(Combo2.ListIndex), " ") - 1)
    b = Mid(Combo2.List(Combo2.ListIndex), InStr(1, Combo2.List(Combo2.ListIndex), " ") + 1)
    
    id = getNextId("mmid", "MovieMedia")
    
    conn.Execute "insert into MovieMedia values (" & id & "," & x & "," & a & ")"
    
    MsgBox y & "  " & b & " added in Library"
    
    Exit Sub
addError:
    MsgBox Err.Description
End Sub

Private Sub Form_Load()
    rs.Open "select mvid, mvname from Movie", conn, adOpenDynamic, adLockOptimistic
    rs1.Open "select mid, mtype from Media", conn, adOpenDynamic, adLockOptimistic
    populateCombo1
    populateCombo2
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
    rs1.Close
End Sub


Private Sub populateCombo1()
    Combo1.Clear
    
    rs.MoveFirst
    
    Do While Not rs.EOF
        Combo1.AddItem rs.Fields(0) & " " & rs.Fields(1)
        rs.MoveNext
    Loop
    Combo1.ListIndex = 0
End Sub

Private Sub populateCombo2()
    Combo2.Clear
    
    rs1.MoveFirst
    
    Do While Not rs1.EOF
        Combo2.AddItem rs1.Fields(0) & " " & rs1.Fields(1)
        rs1.MoveNext
    Loop
    Combo2.ListIndex = 0
End Sub
