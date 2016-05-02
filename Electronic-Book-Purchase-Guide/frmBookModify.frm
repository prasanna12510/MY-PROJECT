VERSION 5.00
Begin VB.Form frmBookModify 
   Caption         =   "Form2"
   ClientHeight    =   8700
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   11925
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   ScaleHeight     =   8700
   ScaleWidth      =   11925
   Begin VB.Frame Frame1 
      Height          =   7215
      Left            =   960
      TabIndex        =   0
      Top             =   720
      Width           =   8055
      Begin VB.ComboBox Combo2 
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
         Left            =   3960
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Top             =   4560
         Width           =   3015
      End
      Begin VB.TextBox Text1 
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
         Index           =   2
         Left            =   3960
         TabIndex        =   11
         Top             =   3600
         Width           =   3135
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
         Left            =   3960
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   600
         Width           =   3135
      End
      Begin VB.TextBox Text1 
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
         Index           =   0
         Left            =   3960
         TabIndex        =   5
         Top             =   1560
         Width           =   3135
      End
      Begin VB.TextBox Text1 
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
         Index           =   1
         Left            =   3960
         TabIndex        =   4
         Top             =   2520
         Width           =   3135
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Modify"
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
         Index           =   0
         Left            =   1560
         TabIndex        =   3
         Top             =   6120
         Width           =   1935
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Clear"
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
         Index           =   1
         Left            =   3480
         TabIndex        =   2
         Top             =   6120
         Width           =   1935
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
         Height          =   615
         Index           =   2
         Left            =   5400
         TabIndex        =   1
         Top             =   6120
         Width           =   1935
      End
      Begin VB.Label Label1 
         Caption         =   "Subject"
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
         Index           =   4
         Left            =   600
         TabIndex        =   12
         Top             =   4560
         Width           =   2415
      End
      Begin VB.Label Label1 
         Caption         =   "Publication"
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
         Index           =   3
         Left            =   600
         TabIndex        =   10
         Top             =   3720
         Width           =   2415
      End
      Begin VB.Label Label1 
         Caption         =   "Select"
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
         Index           =   2
         Left            =   600
         TabIndex        =   9
         Top             =   600
         Width           =   1815
      End
      Begin VB.Label Label1 
         Caption         =   "Title"
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
         Index           =   0
         Left            =   600
         TabIndex        =   8
         Top             =   1680
         Width           =   1815
      End
      Begin VB.Label Label1 
         Caption         =   "Author"
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
         Index           =   1
         Left            =   600
         TabIndex        =   7
         Top             =   2640
         Width           =   2415
      End
   End
End
Attribute VB_Name = "frmBookModify"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim sql As String



Private Sub loadSubjectIdsAndNames()
On Error GoTo loaderr
    Dim rs As New ADODB.Recordset
    rs.Open "select sid , sname from subject order by sid", conn, adOpenDynamic, adLockOptimistic
    
    Combo2.Clear
    rs.MoveFirst
    Do Until (rs.EOF)
        Combo2.AddItem rs.Fields(0) & " ( " & rs.Fields(1) & " )"
        rs.MoveNext
    Loop
    rs.Close
    
    Combo2.ListIndex = 0 ' first value to be selected
        
    Exit Sub
loaderr:
        rs.Close
        MsgBox "Add Records First"
        Unload Me
    
End Sub

Private Sub loadBids()
On Error GoTo loaderr
    Dim rs As New ADODB.Recordset
    rs.Open "select bid from book order by bid", conn, adOpenDynamic, adLockOptimistic
    
    Combo1.Clear
    rs.MoveFirst
    Do Until (rs.EOF)
        Combo1.AddItem rs.Fields(0)
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


Private Sub Form_Load()
    loadSubjectIdsAndNames
    loadBids
End Sub

Private Function getSubjectId(x As String) As Integer
 Dim indx As Integer
 'search space
 indx = InStr(1, x, " ", vbTextCompare)
 'sid on left of the space
 getSubjectId = Mid(x, 1, indx - 1)
 
End Function


Private Sub Combo1_Click()
    Dim sid As Integer
    Dim sid1 As Integer
    
    Dim id As Integer
    Dim i As Integer
    Dim rs As New ADODB.Recordset
    Dim x As String
    
    id = CInt(Combo1.Text)
    rs.Open "select btitle, bauthor, bpublication, sid from book where bid = " & id, conn, adOpenDynamic, adLockOptimistic

    rs.MoveFirst
    
    For i = 0 To rs.Fields.Count - 2
        Text1(i).Text = rs.Fields(i)
    Next
    
    sid = rs.Fields(rs.Fields.Count - 1) 'sid
    
    'select the entry in combo2 that has id = sid
    For i = 0 To Combo2.ListCount
        x = Combo2.List(i)
        sid1 = getSubjectId(x)
        If sid = sid1 Then
        'we have a match
            Combo2.ListIndex = i  'select it to be shown
            Exit For
        End If
    Next
    
    rs.Close
End Sub

Private Sub modifyRecord()

If emptyFieldFound Then
    MsgBox "Fill ALL the FIELDS"
    Exit Sub
End If

On Error GoTo modErr
    Dim rs As New ADODB.Recordset
    Dim sid As Integer
    
    id = CInt(Combo1.Text)
    rs.Open "select btitle, bauthor, bpublication, sid from book where bid = " & id, conn, adOpenDynamic, adLockOptimistic


    rs.MoveFirst
    
    For i = 0 To rs.Fields.Count - 2
        rs.Fields(i) = Text1(i).Text
    Next
    sid = getSubjectId(Combo2.Text)
    
    rs.Fields(rs.Fields.Count - 1) = sid
    
    rs.Update
    
    rs.Close
   MsgBox "Record Updated"
   Exit Sub
   
modErr:
   MsgBox "Modify Record Failed"
  

End Sub

Private Sub clearData()
    For i = 0 To Text1.Count - 1
        Text1(i).Text = ""
    Next
End Sub

Private Function emptyFieldFound() As Boolean
    Dim i As Integer
    Dim flag As Boolean 'default false
    
    For i = 0 To Text1.Count - 1
        If Trim(Text1(i).Text) = "" Then
           flag = True
           Exit For
        End If
    Next
    
    emptyFieldFound = flag
    
End Function

Private Sub Command1_Click(Index As Integer)
Select Case Index
    Case 0 'modify
        modifyRecord
    Case 1 ' clear
        clearData
    Case 2 ' close
        Unload Me
End Select

End Sub


