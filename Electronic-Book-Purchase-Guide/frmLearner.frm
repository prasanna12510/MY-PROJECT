VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmLearner 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Form1"
   ClientHeight    =   9090
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   14130
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9090
   ScaleWidth      =   14130
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Report"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   8880
      TabIndex        =   6
      Top             =   3360
      Width           =   1935
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Expertwise"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4080
      TabIndex        =   5
      Top             =   2400
      Width           =   2655
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Subjectwise"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   1080
      TabIndex        =   4
      Top             =   2400
      Width           =   2775
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
      Height          =   3495
      Left            =   1080
      TabIndex        =   3
      Top             =   4560
      Width           =   9735
      _ExtentX        =   17171
      _ExtentY        =   6165
      _Version        =   393216
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Guide Me"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   6600
      TabIndex        =   2
      Top             =   3360
      Width           =   1935
   End
   Begin VB.ComboBox Combo1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   6840
      TabIndex        =   1
      Top             =   2400
      Width           =   3975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Electronic Book Purchase Guide"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2880
      TabIndex        =   0
      Top             =   360
      Width           =   6015
   End
End
Attribute VB_Name = "frmLearner"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Function getId() As Integer
 Dim x As String
 Dim indx As Integer
 x = Combo1.Text '1 ( C )
 'search space
 indx = InStr(1, x, " ", vbTextCompare)
 'id on left of the space
 getId = Mid(x, 1, indx - 1)
 
End Function

Private Function getName() As String
 Dim x As String
 Dim indx1 As Integer
 Dim indx2 As Integer
 
 x = Combo1.Text '1 ( C )
 'search (
 indx1 = InStr(1, x, "(", vbTextCompare)
 indx2 = InStr(1, x, ")", vbTextCompare)
 
 'data between indx1 and indx2
 getName = Mid(x, indx1 + 1, (indx2 - indx1 - 1))
 
End Function


Private Sub loadSubjectIdsAndNames()
On Error GoTo loaderr
    Dim rs As New ADODB.Recordset
    rs.Open "select sid , sname from subject order by sid", conn, adOpenDynamic, adLockOptimistic
    
    Combo1.Clear
    rs.MoveFirst
    Do Until (rs.EOF)
        Combo1.AddItem rs.Fields(0) & " ( " & rs.Fields(1) & " )"
        rs.MoveNext
    Loop
    rs.Close
    
    Combo1.ListIndex = 0 ' first value to be selected
        
    Exit Sub
loaderr:
        rs.Close
        MsgBox "Add Records First"
        Unload Me
    
End Sub

Private Sub loadExpertIdsAndNames()
On Error GoTo loaderr
    Dim rs As New ADODB.Recordset
    rs.Open "select eid , ename from expert order by eid", conn, adOpenDynamic, adLockOptimistic
    
    Combo1.Clear
    rs.MoveFirst
    Do Until (rs.EOF)
        Combo1.AddItem rs.Fields(0) & " ( " & rs.Fields(1) & " )"
        rs.MoveNext
    Loop
    rs.Close
    
    Combo1.ListIndex = 0 ' first value to be selected
        
    Exit Sub
loaderr:
        rs.Close
        MsgBox "Add Records First"
        Unload Me
    
End Sub


Private Sub autoRecommend()
    Dim sql As String
    Dim var As Integer
    var = getId
    If Option1.Value = True Then 'subjectwise
        sql = "select btitle, bauthor, bpublication, remark, rating from book inner join recommendation on book.bid = recommendation.bid where recommendation.bid  in ( select bid from book where sid =  " & var & " ) order by rating desc"
    ElseIf Option2.Value = True Then 'expertwise
        sql = "select btitle, bauthor, bpublication, remark, rating  from book inner join recommendation on book.bid = recommendation.bid where recommendation.eid  =  " & var & " order by rating desc"
    End If
    
    Dim rs As New ADODB.Recordset
    rs.Open sql, conn, adOpenDynamic, adLockOptimistic
    
    Set MSHFlexGrid1.DataSource = rs
    
    rs.Close
    
End Sub


Private Sub Command1_Click()
  autoRecommend

End Sub


Private Sub Command2_Click()
'report
    Dim var As Integer
    Dim name As String
    var = getId
    name = getName
    
    If Option1.Value = True Then
        Load DataEnvironment1
        DataEnvironment1.Command1 var
        DataReport1.Sections(1).Controls(2).Caption = name
       
        DataReport1.Refresh
        
        DataReport1.Show
        Unload DataEnvironment1
        
    ElseIf Option2.Value = True Then
        Load DataEnvironment1
        DataEnvironment1.Command2 var
        DataReport2.Sections(1).Controls(2).Caption = name
        DataReport2.Refresh
        DataReport2.Show
        Unload DataEnvironment1
    End If
    
    
End Sub

Private Sub Form_Load()
    Option1.Value = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
    closeConnection
End Sub

Private Sub Option1_Click() 'subjectwise
    loadSubjectIdsAndNames
End Sub

Private Sub Option2_Click() 'expertwise
    loadExpertIdsAndNames
End Sub
