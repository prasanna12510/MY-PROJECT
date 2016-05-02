VERSION 5.00
Begin VB.Form frmBookAdd 
   Caption         =   "Book Add"
   ClientHeight    =   8040
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   11715
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8040
   ScaleWidth      =   11715
   Begin VB.Frame Frame1 
      Height          =   6255
      Left            =   1440
      TabIndex        =   0
      Top             =   720
      Width           =   8535
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
         Left            =   3840
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   3480
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
         Index           =   2
         Left            =   3840
         TabIndex        =   10
         Top             =   2520
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
         Left            =   3840
         TabIndex        =   5
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
         Index           =   1
         Left            =   3840
         TabIndex        =   4
         Top             =   1560
         Width           =   3135
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Add"
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
         Left            =   1200
         TabIndex        =   3
         Top             =   4920
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
         Left            =   3120
         TabIndex        =   2
         Top             =   4920
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
         Left            =   5040
         TabIndex        =   1
         Top             =   4920
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
         Index           =   3
         Left            =   480
         TabIndex        =   9
         Top             =   3480
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
         Index           =   2
         Left            =   480
         TabIndex        =   8
         Top             =   2640
         Width           =   2415
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
         Left            =   480
         TabIndex        =   7
         Top             =   720
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
         Left            =   480
         TabIndex        =   6
         Top             =   1680
         Width           =   2415
      End
   End
End
Attribute VB_Name = "frmBookAdd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim i As Integer

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


Private Sub Form_Load()
    loadSubjectIdsAndNames
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

Private Function getSubjectId() As Integer
 Dim x As String
 Dim indx As Integer
 x = Combo1.Text '1 C
 'search space
 indx = InStr(1, x, " ", vbTextCompare)
 'sid on left of the space
 getSubjectId = Mid(x, 1, indx - 1)
 
End Function

Private Sub addRecord()
If emptyFieldFound Then
    MsgBox "Fill ALL the FIELDS"
    Exit Sub
End If


On Error GoTo addRecordErr

    Dim rs As New ADODB.Recordset
    Dim sid As Integer
    
    rs.Open "select * from book where bid = -1", conn, adOpenDynamic, adLockOptimistic
    
    rs.AddNew 'add a new row in the recordset
    
    'data in the recordset
    rs.Fields(0) = getNextId("bid", "book") 'auto gen
    
    For i = 0 To Text1.Count - 1 'from text box
         rs.Fields(i + 1) = Text1(i).Text
    Next
    
    sid = getSubjectId
    rs.Fields(rs.Fields.Count - 1) = sid
    
    rs.Update 'update changes in table
    rs.Close
    MsgBox "Book Added"
    clearData
    
Exit Sub
addRecordErr:
    MsgBox Err.Description
End Sub

Private Sub Command1_Click(Index As Integer)
Select Case Index
    Case 0 'add
        addRecord
    Case 1 ' clear
        clearData
    Case 2 ' close
        Unload Me

End Select
End Sub


