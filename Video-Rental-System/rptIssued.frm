VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form rptIssued 
   Caption         =   "Issued"
   ClientHeight    =   6360
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8565
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6360
   ScaleWidth      =   8565
   Begin VB.Frame Frame1 
      Caption         =   "Issued"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5055
      Left            =   600
      TabIndex        =   0
      Top             =   600
      Width           =   6735
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
         ItemData        =   "rptIssued.frx":0000
         Left            =   1920
         List            =   "rptIssued.frx":0010
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   480
         Width           =   4215
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3255
         Left            =   480
         TabIndex        =   1
         Top             =   1320
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   5741
         _Version        =   393216
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
      Begin VB.Label Label1 
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
         Height          =   495
         Left            =   480
         TabIndex        =   3
         Top             =   480
         Width           =   1215
      End
   End
End
Attribute VB_Name = "rptIssued"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Dim orderBy As String

Private Sub Combo1_Click()
    Select Case Combo1.ListIndex
        Case 0
        'client
            orderBy = "cname"
        Case 1
        'movie
            orderBy = "mvname"
        Case 2
        'media
            orderBy = "mtype"
        Case 3
        'issuedate
            orderBy = "issueDate"
    End Select
    populateGrid
    
End Sub

Private Sub Form_Load()
        Combo1.ListIndex = 0
  
End Sub

Private Sub populateGrid()
    rs.Open "select cname, mvname, mtype, issueDate from ((((Client inner join Transactions on Client.cid = Transactions.cid ) inner join MovieMedia on Transactions.mmid = MovieMedia.mmid) inner join Movie on MovieMedia.mvid = Movie.mvid ) inner join Media on Media.mid = MovieMedia.mid) where returnDate is null and remark = 'ISSUED' order by " & orderBy, conn, adOpenStatic, adLockReadOnly
    Set MSHFlexGrid1.DataSource = rs
    rs.Close
End Sub
