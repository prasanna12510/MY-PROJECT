VERSION 5.00
Begin VB.Form frmSplash 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3735
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6810
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   3735
   ScaleWidth      =   6810
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   10000
      Left            =   720
      Top             =   4920
   End
   Begin VB.Image Image1 
      Height          =   4245
      Left            =   0
      Picture         =   "frmSplash.frx":0000
      Stretch         =   -1  'True
      Top             =   0
      Width           =   6810
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_KeyPress(KeyAscii As Integer)
  Unload Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
 loginForm.Show
End Sub

Private Sub Image1_Click()
  Unload Me
End Sub

Private Sub Timer1_Timer()
  Unload Me
End Sub
