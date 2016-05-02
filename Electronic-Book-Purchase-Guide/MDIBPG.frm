VERSION 5.00
Begin VB.MDIForm MDIBPG 
   BackColor       =   &H8000000C&
   Caption         =   "Book Purchase Guide"
   ClientHeight    =   8850
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   12870
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnuExpet 
      Caption         =   "Expert"
      Begin VB.Menu miExpertAdd 
         Caption         =   "Add"
      End
      Begin VB.Menu miExpertModify 
         Caption         =   "Modify"
      End
      Begin VB.Menu miExpertDelete 
         Caption         =   "Delete"
      End
      Begin VB.Menu miExpertView 
         Caption         =   "View"
      End
   End
   Begin VB.Menu mnuSubject 
      Caption         =   "Subject"
      Begin VB.Menu miSubjectAdd 
         Caption         =   "Add"
      End
      Begin VB.Menu miSubjectModify 
         Caption         =   "Modify"
      End
      Begin VB.Menu miSubjectDelete 
         Caption         =   "Delete"
      End
      Begin VB.Menu miSubjectView 
         Caption         =   "View"
      End
   End
   Begin VB.Menu mnuBook 
      Caption         =   "Book"
      Begin VB.Menu miBookAdd 
         Caption         =   "Add"
      End
      Begin VB.Menu miBookModify 
         Caption         =   "Modify"
      End
      Begin VB.Menu miBookDelete 
         Caption         =   "Delete"
      End
      Begin VB.Menu miBookView 
         Caption         =   "View"
      End
   End
   Begin VB.Menu mnuRecommendation 
      Caption         =   "Recommendation"
      Begin VB.Menu miRecommendationAdd 
         Caption         =   "Add"
      End
      Begin VB.Menu miRecommendationDelete 
         Caption         =   "Delete"
      End
      Begin VB.Menu miRecommendationView 
         Caption         =   "View"
      End
      Begin VB.Menu miRecommendationViewAll 
         Caption         =   "View ALL"
      End
   End
   Begin VB.Menu mnuWindow 
      Caption         =   "Window"
      WindowList      =   -1  'True
      Begin VB.Menu miWindowArrange 
         Caption         =   "Arrange"
         Begin VB.Menu miWATH 
            Caption         =   "Tile Horizontal"
         End
         Begin VB.Menu miWATV 
            Caption         =   "Tile Vertical"
         End
         Begin VB.Menu miWAC 
            Caption         =   "Cascade"
         End
      End
   End
End
Attribute VB_Name = "MDIBPG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub MDIForm_Load()
    If utype = "Admin" Then
        mnuExpet.Visible = True
        mnuSubject.Visible = True
        mnuBook.Visible = True
        mnuWindow.Visible = True
        mnuRecommendation.Visible = False
    ElseIf utype = "Expert" Then
        mnuExpet.Visible = False
        mnuSubject.Visible = False
        mnuBook.Visible = False
        mnuWindow.Visible = True
        mnuRecommendation.Visible = True
    
    Else
        MsgBox "Invalid User"
        Unload Me
    End If
    
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
    closeConnection
End Sub

Private Sub miBookAdd_Click()
 frmBookAdd.Show
End Sub

Private Sub miBookDelete_Click()
    frmBookDelete.Show
End Sub

Private Sub miBookModify_Click()
    frmBookModify.Show
End Sub

Private Sub miBookView_Click()
    frmBookView.Show
End Sub

Private Sub miExpertAdd_Click()
    frmExpertAdd.Show
End Sub

Private Sub miExpertDelete_Click()
    frmExpertDelete.Show
End Sub

Private Sub miExpertModify_Click()
On Error Resume Next
    frmExpertModify.Show
End Sub

Private Sub miExpertView_Click()
    frmExpertView.Show
End Sub

Private Sub miRecommendationAdd_Click()
    frmRcmdAdd.Show
End Sub

Private Sub miRecommendationDelete_Click()
    frmRcmdDelete.Show
End Sub

Private Sub miRecommendationView_Click()
    frmRcmdView.Show
End Sub

Private Sub miRecommendationViewAll_Click()
    frmRcmdViewALL.Show
End Sub

Private Sub miSubjectAdd_Click()
    frmSubjectAdd.Show
End Sub

Private Sub miSubjectDelete_Click()
    frmSubjectDelete.Show
End Sub

Private Sub miSubjectModify_Click()
    frmSubjectModify.Show
End Sub

Private Sub miSubjectView_Click()
    frmSubjectView.Show
End Sub

Private Sub miWAC_Click()
    MDIBPG.Arrange vbCascade
End Sub

Private Sub miWATH_Click()
    MDIBPG.Arrange vbTileHorizontal
End Sub

Private Sub miWATV_Click()
    MDIBPG.Arrange vbTileVertical
End Sub
