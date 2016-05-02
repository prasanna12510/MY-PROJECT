VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form viewMovie 
   Caption         =   "View Movie"
   ClientHeight    =   6855
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9525
   LinkTopic       =   "Form8"
   MDIChild        =   -1  'True
   ScaleHeight     =   6855
   ScaleWidth      =   9525
   Begin VB.Frame Frame1 
      Caption         =   "Movies"
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
      Height          =   4695
      Left            =   600
      TabIndex        =   0
      Top             =   360
      Width           =   7215
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3375
         Left            =   600
         TabIndex        =   1
         Top             =   720
         Width           =   6015
         _ExtentX        =   10610
         _ExtentY        =   5953
         _Version        =   393216
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
End
Attribute VB_Name = "viewMovie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset

Private Sub populateGrid()
    Set MSHFlexGrid1.DataSource = rs
End Sub

Private Sub Form_Load()
    rs.Open "select * from Movie", conn, adOpenDynamic, adLockOptimistic
    populateGrid
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
End Sub

