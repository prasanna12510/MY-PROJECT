VERSION 5.00
Begin VB.MDIForm MDIForm1 
   BackColor       =   &H8000000C&
   Caption         =   "Video Library System"
   ClientHeight    =   7665
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   12240
   LinkTopic       =   "MDIForm1"
   Picture         =   "MDIForm1.frx":0000
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Menu mnuMaster 
      Caption         =   "&Master"
      Begin VB.Menu masterActor 
         Caption         =   "Actor"
         Begin VB.Menu actorAdd 
            Caption         =   "Add"
         End
         Begin VB.Menu actorModify 
            Caption         =   "Modify"
         End
         Begin VB.Menu actorDelete 
            Caption         =   "Delete"
         End
         Begin VB.Menu actorView 
            Caption         =   "View"
         End
      End
      Begin VB.Menu masterMovie 
         Caption         =   "Movie"
         Begin VB.Menu movieAdd 
            Caption         =   "Add"
         End
         Begin VB.Menu movieModify 
            Caption         =   "Modify"
         End
         Begin VB.Menu movieDelete 
            Caption         =   "Delete"
         End
         Begin VB.Menu movieView 
            Caption         =   "View"
         End
      End
      Begin VB.Menu masterClient 
         Caption         =   "Client"
         Begin VB.Menu clientAdd 
            Caption         =   "Add"
         End
         Begin VB.Menu clientModify 
            Caption         =   "Modify"
         End
         Begin VB.Menu clientDelete 
            Caption         =   "Delete"
         End
         Begin VB.Menu clientView 
            Caption         =   "View"
         End
      End
      Begin VB.Menu masterMembership 
         Caption         =   "MemberShip"
         Begin VB.Menu membershipAdd 
            Caption         =   "Add"
         End
         Begin VB.Menu membershipModify 
            Caption         =   "Modify"
         End
         Begin VB.Menu membershipDelete 
            Caption         =   "Delete"
         End
         Begin VB.Menu membershipView 
            Caption         =   "View"
         End
      End
      Begin VB.Menu mnuMedia 
         Caption         =   "Media"
         Begin VB.Menu mediaAdd 
            Caption         =   "Add"
         End
         Begin VB.Menu mediaModify 
            Caption         =   "Modify"
         End
         Begin VB.Menu mediaDelete 
            Caption         =   "Delete"
         End
         Begin VB.Menu mediaView 
            Caption         =   "View"
         End
      End
      Begin VB.Menu mnuMM 
         Caption         =   "MovieMedia"
         Begin VB.Menu mmAdd 
            Caption         =   "Add"
         End
         Begin VB.Menu mmDelete 
            Caption         =   "Delete"
         End
      End
   End
   Begin VB.Menu mnuTransactions 
      Caption         =   "Transactions"
      Begin VB.Menu transIssue 
         Caption         =   "Issue"
      End
      Begin VB.Menu transReturn 
         Caption         =   "Return"
      End
   End
   Begin VB.Menu mnuReport 
      Caption         =   "Report"
      Begin VB.Menu reportIssued 
         Caption         =   "Issued"
      End
   End
   Begin VB.Menu mnuWndow 
      Caption         =   "Window"
      WindowList      =   -1  'True
      Begin VB.Menu mnuarrange 
         Caption         =   "Arrange"
         Begin VB.Menu arrhorizontal 
            Caption         =   "Horizontal"
         End
         Begin VB.Menu arrvertical 
            Caption         =   "Vertical"
         End
         Begin VB.Menu arrcascade 
            Caption         =   "Cascade"
         End
      End
   End
   Begin VB.Menu mnuabout 
      Caption         =   "About"
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub actorAdd_Click()
    addActor.Show
End Sub

Private Sub actorDelete_Click()
    deleteActor.Show
End Sub

Private Sub actorModify_Click()
    modifyActor.Show
End Sub

Private Sub actorView_Click()
    viewActors.Show
End Sub

Private Sub arrcascade_Click()
MDIForm1.Arrange vbCascade
End Sub

Private Sub arrhorizontal_Click()
MDIForm1.Arrange vbHorizontal

End Sub

Private Sub arrvertical_Click()
MDIForm1.Arrange vbVertical

End Sub

Private Sub clientAdd_Click()
    addClient.Show
End Sub

Private Sub clientDelete_Click()
    deleteClient.Show
End Sub

Private Sub clientModify_Click()
    modifyClient.Show
End Sub

Private Sub clientView_Click()
    viewClient.Show
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
    disconnect
End Sub

Private Sub mediaAdd_Click()
    addMedia.Show
End Sub

Private Sub mediaDelete_Click()
    deleteMedia.Show
End Sub

Private Sub mediaModify_Click()
    modifyMedia.Show
End Sub

Private Sub mediaView_Click()
    viewMedia.Show
End Sub

Private Sub membershipAdd_Click()
    addMembership.Show
    
End Sub

Private Sub membershipDelete_Click()
    deleteMembership.Show
End Sub

Private Sub membershipModify_Click()
    modifyMembership.Show
End Sub

Private Sub membershipView_Click()
    viewMembership.Show
End Sub

Private Sub mmAdd_Click()
    addMovieMedia.Show
End Sub

Private Sub mmDelete_Click()
    deleteMovieMedia.Show
End Sub




Private Sub movieAdd_Click()
    addMovie.Show
End Sub

Private Sub movieDelete_Click()
    deleteMovie.Show
End Sub

Private Sub movieModify_Click()
    modifyMovie.Show
    
End Sub

Private Sub movieView_Click()
    viewMovie.Show
End Sub

Private Sub reportIssued_Click()
    rptIssued.Show
End Sub

Private Sub transIssue_Click()
    frmissue.Show
End Sub

Private Sub transReturn_Click()
    frmreturn.Show
    
End Sub
