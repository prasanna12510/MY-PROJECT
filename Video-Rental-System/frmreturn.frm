VERSION 5.00
Begin VB.Form frmreturn 
   Caption         =   "Return"
   ClientHeight    =   6735
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8910
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   ScaleHeight     =   6735
   ScaleWidth      =   8910
   Begin VB.Frame Frame1 
      Caption         =   "Issue"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5415
      Left            =   480
      TabIndex        =   0
      Top             =   360
      Width           =   8415
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
         Height          =   495
         Left            =   2160
         TabIndex        =   8
         Text            =   "RETURNED"
         Top             =   3120
         Width           =   5175
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
         ItemData        =   "frmreturn.frx":0000
         Left            =   2160
         List            =   "frmreturn.frx":0010
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   2400
         Width           =   5175
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
         ItemData        =   "frmreturn.frx":0046
         Left            =   2160
         List            =   "frmreturn.frx":0056
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   1680
         Width           =   5175
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Return"
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
         Left            =   5640
         TabIndex        =   4
         Top             =   4080
         Width           =   1695
      End
      Begin VB.Label Label4 
         Caption         =   "Remark"
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
         Left            =   240
         TabIndex        =   7
         Top             =   3120
         Width           =   1335
      End
      Begin VB.Label Label2 
         Caption         =   "Arrange"
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
         Left            =   240
         TabIndex        =   6
         Top             =   1680
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "Transaction"
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
         Left            =   240
         TabIndex        =   5
         Top             =   2400
         Width           =   1695
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   855
         Left            =   3600
         TabIndex        =   3
         Top             =   480
         Width           =   3735
      End
   End
End
Attribute VB_Name = "frmreturn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Dim orderBy As String
Dim x As String

Dim sql As String

Private Sub Combo1_Click()
    Select Case Combo1.ListIndex
        Case 0
        'transaction
            orderBy = "tid"
        Case 1
        'client
            orderBy = "cname"
        Case 2
        'movie
            orderBy = "mvname"
        Case 3
        'media
            orderBy = "mtype"
        
    End Select
    populateCombo
    
End Sub

Private Sub Command1_Click()
    'return
On Error GoTo transError
    Text1.Text = Trim(Text1.Text)
    
    If Len(Text1.Text) = 0 Then
        MsgBox "REMARK MISSING"
        Exit Sub
    End If
    
    x = Mid(Combo2.List(Combo2.ListIndex), 1, InStr(1, Combo2.List(Combo2.ListIndex), " ") - 1)
    
    sql = "update Transactions set returnDate = '" & Date & "', remark = '" & Text1.Text & "' where tid = " & x
    
    conn.Execute sql
        
    MsgBox " Transaction Closed"
    populateCombo
Exit Sub
transError:
    MsgBox Err.Description
    
    
End Sub

Private Sub Form_Load()
        Combo1.ListIndex = 0
        Label3.Caption = Now
End Sub

Private Sub populateCombo()
    rs.Open "select tid, cname, mvname, mtype, issueDate from ((((Client inner join Transactions on Client.cid = Transactions.cid ) inner join MovieMedia on Transactions.mmid = MovieMedia.mmid) inner join Movie on MovieMedia.mvid = Movie.mvid ) inner join Media on Media.mid = MovieMedia.mid) where returnDate is null and remark = 'ISSUED' order by " & orderBy, conn, adOpenStatic, adLockReadOnly
    Combo2.Clear
    rs.MoveFirst
    
    
    Do While Not rs.EOF
        Combo2.AddItem rs.Fields(0) & " " & rs.Fields(1) & " " & rs.Fields(2) & " " & rs.Fields(3) & " " & rs.Fields(4)
        rs.MoveNext
    Loop
    Combo2.ListIndex = 0
    rs.Close
End Sub

