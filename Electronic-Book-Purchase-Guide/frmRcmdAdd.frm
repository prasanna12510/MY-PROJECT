VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRcmdAdd 
   Caption         =   "Form1"
   ClientHeight    =   7050
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   11655
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7050
   ScaleWidth      =   11655
   Begin VB.Frame Frame1 
      Height          =   5295
      Left            =   840
      TabIndex        =   0
      Top             =   480
      Width           =   10095
      Begin MSComctlLib.Slider Slider1 
         Height          =   675
         Left            =   3840
         TabIndex        =   9
         Top             =   2520
         Width           =   4935
         _ExtentX        =   8705
         _ExtentY        =   1191
         _Version        =   393216
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
         Left            =   6720
         TabIndex        =   5
         Top             =   4080
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
         Left            =   4800
         TabIndex        =   4
         Top             =   4080
         Width           =   1935
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
         Left            =   2880
         TabIndex        =   3
         Top             =   4080
         Width           =   1935
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
         Left            =   3840
         TabIndex        =   2
         Top             =   1560
         Width           =   5175
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
         Left            =   3840
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   600
         Width           =   5175
      End
      Begin VB.Label Label1 
         Caption         =   "Remark"
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
         TabIndex        =   8
         Top             =   1680
         Width           =   2415
      End
      Begin VB.Label Label1 
         Caption         =   "Book"
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
         Caption         =   "Rating"
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
         TabIndex        =   6
         Top             =   2640
         Width           =   2415
      End
   End
End
Attribute VB_Name = "frmRcmdAdd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Function getBookId() As Integer
 Dim x As String
 Dim indx As Integer
 x = Combo1.Text '1 C Programming
 'search space
 indx = InStr(1, x, " ", vbTextCompare)
 'sid on left of the space
 getBookId = Mid(x, 1, indx - 1)
 
End Function


Private Sub loadBookIdsAndNames()
On Error GoTo loaderr
    Dim rs As New ADODB.Recordset
    rs.Open "select bid , btitle from book order by bid", conn, adOpenDynamic, adLockOptimistic
    
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
 loadBookIdsAndNames
End Sub

Private Sub clearData()
        Text1.Text = ""
        Slider1.Value = 0
        Combo1.ListIndex = 0
End Sub

Private Function emptyFieldFound() As Boolean
    Dim flag As Boolean 'default false
    
        If Trim(Text1.Text) = "" Then
           flag = True
        End If
       emptyFieldFound = flag
    
End Function


Private Sub addRecord()
If emptyFieldFound Then
    MsgBox "Fill ALL the FIELDS"
    Exit Sub
End If


On Error GoTo addRecordErr
    Dim bid As Integer
    Dim rs As New ADODB.Recordset
    rs.Open "select * from recommendation where rid = -1", conn, adOpenDynamic, adLockOptimistic
    
    rs.AddNew 'add a new row in the recordset
    bid = getBookId
    
    'data in the recordset
    rs.Fields(0) = getNextId("rid", "recommendation")
    rs.Fields(1) = Text1.Text 'remark
    rs.Fields(2) = Slider1.Value 'rating
    rs.Fields(3) = bid
    rs.Fields(4) = eid 'set at login time
    
    rs.Update 'update changes in table
    rs.Close
    MsgBox "Recommendation Added"
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


