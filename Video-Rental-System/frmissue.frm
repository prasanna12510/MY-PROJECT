VERSION 5.00
Begin VB.Form frmissue 
   Caption         =   "Issue"
   ClientHeight    =   7710
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   11085
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7710
   ScaleWidth      =   11085
   Begin VB.ComboBox Combo2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   3840
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   3840
      Width           =   4695
   End
   Begin VB.Frame Frame1 
      Caption         =   "Issue"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5415
      Left            =   1080
      TabIndex        =   0
      Top             =   1080
      Width           =   8415
      Begin VB.CommandButton Command1 
         Caption         =   "Issue"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   5760
         TabIndex        =   3
         Top             =   3720
         Width           =   1695
      End
      Begin VB.ComboBox Combo1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   2760
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   1920
         Width           =   4695
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   855
         Left            =   3600
         TabIndex        =   6
         Top             =   480
         Width           =   3735
      End
      Begin VB.Label Label2 
         Caption         =   "Movie Media"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   600
         TabIndex        =   5
         Top             =   2760
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "Client"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   600
         TabIndex        =   4
         Top             =   1920
         Width           =   1695
      End
   End
End
Attribute VB_Name = "frmissue"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Dim rs1 As New ADODB.Recordset
Dim id As Integer

Dim x As String
Dim y As String
Dim sql As String


Private Sub Command1_Click()
On Error GoTo transError
Dim rs77 As New ADODB.Recordset
Dim cnt As Integer
Dim max As Integer


    x = Mid(Combo1.List(Combo1.ListIndex), 1, InStr(1, Combo1.List(Combo1.ListIndex), " ") - 1)
    y = Mid(Combo2.List(Combo2.ListIndex), 1, InStr(1, Combo2.List(Combo2.ListIndex), " ") - 1)
        
    rs77.Open "select count(tid) from Transactions where cid = " & x & " and returnDate is NULL and remark = 'ISSUED'", conn, adOpenStatic, adLockReadOnly
    rs77.MoveFirst
    cnt = rs77.Fields(0)
    rs77.Close
    
    rs77.Open "select memMaxIssueCount from Membership where memid in ( select memid from Client where cid = " & x & ")", conn, adOpenStatic, adLockReadOnly
    rs77.MoveFirst
    max = rs77.Fields(0)
    rs77.Close
    
    If cnt < max Then
        id = getNextId("tid", "Transactions")
        sql = "insert into Transactions values(" & id & "," & x & "," & y & ",'" & Date & "', null , 'ISSUED')"
    
        conn.Execute sql
        
        MsgBox " Transaction Recorded"
        populateCombo2
        
    Else
        MsgBox "Cannot issuse more then " & max & " movies "
    End If
    
Exit Sub
transError:
    MsgBox Err.Description
End Sub

Private Sub Form_Load()
    Label3.Caption = Now

    rs.Open "select * from Client", conn, adOpenDynamic, adLockOptimistic
    populateCombo1
    populateCombo2
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
    
End Sub

Private Sub populateCombo1()
    Combo1.Clear
    
    rs.MoveFirst
    Do While Not rs.EOF
        Combo1.AddItem rs.Fields(0) & " " & rs.Fields(1)
        rs.MoveNext
    Loop
    
    Combo1.ListIndex = 0
End Sub


Private Sub populateCombo2()
    rs1.Open "select mmid, mvname, mtype from(( moviemedia inner join movie on moviemedia.mvid = movie.mvid) inner join media on moviemedia.mid = media.mid) where moviemedia.mmid not in(select mmid from transactions where returnDate is null and remark = 'ISSUED' )", conn, adOpenForwardOnly, adLockReadOnly
    
    Combo2.Clear
    
    rs1.MoveFirst
    
    Do While Not rs1.EOF
        Combo2.AddItem rs1.Fields(0) & " " & rs1.Fields(1) & " " & rs1.Fields(2)
        rs1.MoveNext
    Loop
    Combo2.ListIndex = 0
    
    rs1.Close
End Sub

