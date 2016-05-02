VERSION 5.00
Begin VB.Form frmExpertModify 
   Caption         =   "Modify Expert"
   ClientHeight    =   7110
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   11145
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   ScaleHeight     =   7110
   ScaleWidth      =   11145
   Begin VB.Frame Frame1 
      Height          =   5055
      Left            =   1560
      TabIndex        =   0
      Top             =   840
      Width           =   7935
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
         TabIndex        =   9
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
         Left            =   1320
         TabIndex        =   3
         Top             =   3840
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
         Left            =   3240
         TabIndex        =   2
         Top             =   3840
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
         Left            =   5160
         TabIndex        =   1
         Top             =   3840
         Width           =   1935
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
         TabIndex        =   8
         Top             =   600
         Width           =   1815
      End
      Begin VB.Label Label1 
         Caption         =   "Name"
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
         TabIndex        =   7
         Top             =   1680
         Width           =   1815
      End
      Begin VB.Label Label1 
         Caption         =   "Qualification"
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
         TabIndex        =   6
         Top             =   2640
         Width           =   2415
      End
   End
End
Attribute VB_Name = "frmExpertModify"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim sql As String
Private Sub loadExpertIds()
On Error GoTo loaderr
    Dim rs As New ADODB.Recordset
    rs.Open "select eid from expert order by eid", conn, adOpenDynamic, adLockOptimistic
    
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

Private Sub Combo1_Click()
    Dim id As Integer
    Dim i As Integer
    Dim rs As New ADODB.Recordset
    
    id = CInt(Combo1.Text)
    rs.Open "select ename, equalification from expert where eid = " & id, conn, adOpenDynamic, adLockOptimistic

    rs.MoveFirst
    
    For i = 0 To rs.Fields.Count - 1
        Text1(i).Text = rs.Fields(i)
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
    
    id = CInt(Combo1.Text)
    rs.Open "select ename, equalification from expert where eid = " & id, conn, adOpenDynamic, adLockOptimistic

    rs.MoveFirst
    
    For i = 0 To rs.Fields.Count - 1
        rs.Fields(i) = Text1(i).Text
    Next
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

Private Sub Form_Load()
    loadExpertIds
End Sub
