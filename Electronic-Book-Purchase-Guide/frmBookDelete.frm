VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmBookDelete 
   Caption         =   "Form3"
   ClientHeight    =   6510
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9180
   LinkTopic       =   "Form3"
   MDIChild        =   -1  'True
   ScaleHeight     =   6510
   ScaleWidth      =   9180
   Begin VB.Frame Frame1 
      Height          =   4455
      Left            =   840
      TabIndex        =   0
      Top             =   720
      Width           =   7215
      Begin VB.CommandButton Command1 
         Caption         =   "Delete"
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
         Left            =   3120
         TabIndex        =   3
         Top             =   3480
         Width           =   1815
      End
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
         Index           =   1
         Left            =   5040
         TabIndex        =   2
         Top             =   3480
         Width           =   1815
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid FlexGrid1 
         Height          =   2655
         Left            =   240
         TabIndex        =   1
         Top             =   480
         Width           =   6135
         _ExtentX        =   10821
         _ExtentY        =   4683
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
Attribute VB_Name = "frmBookDelete"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub deleteRecord()
    Dim sql As String
    Dim id As Integer
    Dim res As VbMsgBoxResult
    
    res = MsgBox("Delete the current Record", vbQuestion + vbYesNo)
    
    If res = vbYes Then
        'FlexGrid1.RowSel gives the selected row
        FlexGrid1.Row = FlexGrid1.RowSel
        FlexGrid1.Col = 1
        id = CInt(FlexGrid1.Text)
        
        sql = "delete from book where bid = " & id
        
        conn.Execute sql
    
        MsgBox "Book Deleted"
        FlexGrid1.Clear
        loadRecordsInFlexGrid
    End If
End Sub

Private Sub Command1_Click(Index As Integer)
    Select Case Index
        Case 0
            deleteRecord
        
        Case 1 'close
            Unload Me
    
    End Select
End Sub
Private Sub loadRecordsInFlexGrid()
    Dim rs As New ADODB.Recordset
    rs.Open "select * from book", conn, adOpenDynamic, adLockOptimistic
    Set FlexGrid1.DataSource = rs
    rs.Close
End Sub


Private Sub Form_Load()
    loadRecordsInFlexGrid
End Sub

