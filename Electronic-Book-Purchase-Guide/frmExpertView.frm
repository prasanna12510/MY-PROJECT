VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmExpertView 
   Caption         =   "View Expert"
   ClientHeight    =   7050
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   10620
   LinkTopic       =   "Form4"
   MDIChild        =   -1  'True
   ScaleHeight     =   7050
   ScaleWidth      =   10620
   Begin VB.Frame Frame1 
      Height          =   6015
      Left            =   480
      TabIndex        =   0
      Top             =   360
      Width           =   9135
      Begin VB.CommandButton Command1 
         Caption         =   "Close"
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
         Left            =   7080
         TabIndex        =   2
         Top             =   5040
         Width           =   1815
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid FlexGrid1 
         Height          =   4215
         Left            =   240
         TabIndex        =   1
         Top             =   480
         Width           =   8415
         _ExtentX        =   14843
         _ExtentY        =   7435
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
End
Attribute VB_Name = "frmExpertView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click(Index As Integer)
    Select Case Index
        Case 0 'close
            Unload Me
    
    End Select
End Sub
Private Sub loadRecordsInFlexGrid()
    Dim rs As New ADODB.Recordset
    rs.Open "select * from expert", conn, adOpenDynamic, adLockOptimistic
    Set FlexGrid1.DataSource = rs
    rs.Close
End Sub


Private Sub Form_Load()
    loadRecordsInFlexGrid
End Sub

