VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form viewActors 
   Caption         =   "View Actors"
   ClientHeight    =   6285
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8865
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6285
   ScaleWidth      =   8865
   Begin VB.Frame Frame1 
      Caption         =   "Actors"
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
      Height          =   4455
      Left            =   960
      TabIndex        =   0
      Top             =   600
      Width           =   7095
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3015
         Left            =   720
         TabIndex        =   1
         Top             =   720
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   5318
         _Version        =   393216
         FixedCols       =   0
         Appearance      =   0
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
End
Attribute VB_Name = "viewActors"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset

Private Sub populateGrid()
    Set MSHFlexGrid1.DataSource = rs
End Sub

Private Sub Form_Load()
    rs.Open "select * from Actor", conn, adOpenDynamic, adLockOptimistic
    populateGrid
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
End Sub
