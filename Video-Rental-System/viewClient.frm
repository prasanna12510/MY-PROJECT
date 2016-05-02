VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form viewClient 
   Caption         =   "View Client"
   ClientHeight    =   5910
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8730
   LinkTopic       =   "Form4"
   MDIChild        =   -1  'True
   ScaleHeight     =   5910
   ScaleWidth      =   8730
   Begin VB.Frame Frame1 
      Caption         =   "Clients"
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
      Height          =   4935
      Left            =   480
      TabIndex        =   0
      Top             =   480
      Width           =   7455
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3735
         Left            =   480
         TabIndex        =   1
         Top             =   600
         Width           =   6375
         _ExtentX        =   11245
         _ExtentY        =   6588
         _Version        =   393216
         FixedCols       =   0
         Appearance      =   0
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
End
Attribute VB_Name = "viewClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset

Private Sub populateGrid()
    Set MSHFlexGrid1.DataSource = rs
End Sub

Private Sub Form_Load()
    rs.Open "select * from Client", conn, adOpenDynamic, adLockOptimistic
    populateGrid
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
End Sub

