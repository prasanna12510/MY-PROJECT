VERSION 5.00
Begin VB.Form FrmConnectionErr 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Connection Failed"
   ClientHeight    =   4320
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   7980
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4320
   ScaleWidth      =   7980
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Book Purchase Guide"
      ForeColor       =   &H00FF0000&
      Height          =   2775
      Left            =   840
      TabIndex        =   0
      Top             =   720
      Width           =   6135
      Begin VB.CommandButton Command1 
         Caption         =   "QUIT"
         Height          =   495
         Left            =   3600
         TabIndex        =   2
         Top             =   1560
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Error : Cannot Find The Project Database"
         Height          =   735
         Left            =   1920
         TabIndex        =   1
         Top             =   840
         Width           =   3135
      End
      Begin VB.Image Image1 
         Height          =   840
         Left            =   480
         Picture         =   "FrmConnectionErr.frx":0000
         Stretch         =   -1  'True
         Top             =   720
         Width           =   960
      End
   End
End
Attribute VB_Name = "FrmConnectionErr"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    End 'exit(0) of C
End Sub
