VERSION 5.00
Begin VB.Form frmExpertAdd 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Add Expert"
   ClientHeight    =   9180
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   12780
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   9180
   ScaleWidth      =   12780
   Begin VB.Frame Frame1 
      Height          =   7695
      Left            =   960
      TabIndex        =   0
      Top             =   720
      Width           =   9855
      Begin VB.TextBox Text2 
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
         IMEMode         =   3  'DISABLE
         Index           =   2
         Left            =   3840
         PasswordChar    =   "#"
         TabIndex        =   13
         Top             =   4560
         Width           =   3135
      End
      Begin VB.TextBox Text2 
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
         IMEMode         =   3  'DISABLE
         Index           =   1
         Left            =   3840
         PasswordChar    =   "#"
         TabIndex        =   12
         Top             =   3720
         Width           =   3135
      End
      Begin VB.TextBox Text2 
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
         TabIndex        =   11
         Top             =   2880
         Width           =   3135
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
         Left            =   4920
         TabIndex        =   7
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
         Left            =   3000
         TabIndex        =   6
         Top             =   6120
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
         Left            =   1080
         TabIndex        =   5
         Top             =   6120
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
         Index           =   1
         Left            =   3840
         TabIndex        =   4
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
         Index           =   0
         Left            =   3840
         TabIndex        =   3
         Top             =   600
         Width           =   3135
      End
      Begin VB.Label Label1 
         Caption         =   "Re Password"
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
         TabIndex        =   10
         Top             =   4800
         Width           =   2415
      End
      Begin VB.Label Label1 
         Caption         =   "Password"
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
         TabIndex        =   9
         Top             =   3960
         Width           =   2415
      End
      Begin VB.Label Label1 
         Caption         =   "UserName"
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
         Top             =   3120
         Width           =   2415
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
         Left            =   480
         TabIndex        =   2
         Top             =   1680
         Width           =   2415
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
         Left            =   480
         TabIndex        =   1
         Top             =   720
         Width           =   1815
      End
   End
End
Attribute VB_Name = "frmExpertAdd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim i As Integer

Private Sub clearData()
    For i = 0 To Text1.Count - 1
        Text1(i).Text = ""
    Next
    For i = 0 To Text2.Count - 1
        Text2(i).Text = ""
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
    
    For i = 0 To Text2.Count - 1
        If Trim(Text2(i).Text) = "" Then
           flag = True
           Exit For
        End If
    Next
    
    
    emptyFieldFound = flag
    
End Function

Private Function findUnwantedChars() As Boolean
    Dim i As Integer
    Dim flag As Boolean 'default false
    
    For i = 0 To Text1.Count - 1
      
        If InStr(1, Text1(i), "'", vbTextCompare) = 0 Then
           flag = True
           Exit For
        End If
    Next
    
    emptyFieldFound = flag
    
End Function


Private Sub addRecord()
If emptyFieldFound Then
    MsgBox "Fill ALL the FIELDS"
    Exit Sub
End If

If Text2(1).Text <> Text2(2).Text Then
    MsgBox "Password and RePassword Mismatch", vbCritical
    Exit Sub
End If

On Error GoTo addRecordErr

    Dim rs As New ADODB.Recordset
    rs.Open "select * from expert where eid = -1", conn, adOpenDynamic, adLockOptimistic
    
    rs.AddNew 'add a new row in the recordset
    
    'data in the recordset
    rs.Fields(0) = getNextId("eid", "expert")
    For i = 0 To Text1.Count - 1
         rs.Fields(i + 1) = Text1(i).Text
    Next
    
    rs.Update 'update changes in table
    rs.Close
    
    rs.Open "select * from login where userid = -1", conn, adOpenDynamic, adLockOptimistic
    
    rs.AddNew 'add a new row in the recordset
    
    'data in the recordset
    rs.Fields(0) = getNextId("userid", "login")
    For i = 0 To Text2.Count - 2
         rs.Fields(i + 1) = Text2(i).Text
    Next
    rs.Fields(i + 1) = "Expert" 'usertype
    
    rs.Update 'update changes in table
    rs.Close
    MsgBox "Expert Added" & vbCrLf & "UserId : " & Text2(0).Text & vbCrLf & "Password : " & Text2(1).Text, vbInformation
    
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


