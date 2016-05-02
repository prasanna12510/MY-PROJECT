VERSION 5.00
Begin VB.Form frmSubjectAdd 
   Caption         =   "Add Subject"
   ClientHeight    =   5805
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   10260
   LinkTopic       =   "Form5"
   MDIChild        =   -1  'True
   ScaleHeight     =   5805
   ScaleWidth      =   10260
   Begin VB.Frame Frame1 
      Height          =   3975
      Left            =   1080
      TabIndex        =   0
      Top             =   720
      Width           =   7935
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
         TabIndex        =   4
         Top             =   960
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
         Top             =   2880
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
         Top             =   2880
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
         Top             =   2880
         Width           =   1935
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
         TabIndex        =   5
         Top             =   1080
         Width           =   1815
      End
   End
End
Attribute VB_Name = "frmSubjectAdd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim i As Integer

Private Sub clearData()
    For i = 0 To Text1.Count - 1
        Text1(i).Text = ""
    Next
End Sub

Private Sub addRecord()
On Error GoTo addRecordErr
   Dim sql As String
   sql = "insert into subject values ( "
   sql = sql & getNextId("sid", "subject")
   sql = sql & ", '" & Text1(0).Text & "' )"
   
   conn.Execute sql
    
   MsgBox "Subject Added"
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

