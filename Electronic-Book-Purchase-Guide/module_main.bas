Attribute VB_Name = "module_main"
Public conn As New ADODB.Connection
Dim sql As String
Dim x As Integer
Public utype As String
Public eid As Integer

Public Sub main() 'entry point into project
On Error GoTo ConnErr
    
    conn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\vb\project\BPG.mdb;Mode=ReadWrite|Share Deny None;Persist Security Info=False"
    conn.Open
    
    frmLogin.Show 'activate login form
    Exit Sub
    
ConnErr:
    FrmConnectionErr.Show
End Sub

Public Function getNextId(colName As String, tblName As String) As Integer
    
    Dim rs As New ADODB.Recordset
    sql = "select max(" & colName & ") from " & tblName
    
    Set rs = conn.Execute(sql)
        
On Error GoTo fetchErr
    rs.MoveFirst
    x = rs.Fields(0)
    x = x + 1
    rs.Close
    getNextId = x

    Exit Function
fetchErr:
    If rs.State = adStateOpen Then
        rs.Close
    End If
    
    getNextId = 1
End Function

Public Sub closeConnection()
    If conn.State = adStateOpen Then
        conn.Close
    End If
End Sub
