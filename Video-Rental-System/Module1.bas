Attribute VB_Name = "Module1"
Public uid As String
Public pass As String
Public utype As String


Public conn As New ADODB.Connection

Public Sub connect()
'create database connection
    If conn.State = adStateClosed Then
        conn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\vb\mini pro\videoLibrary.mdb;Mode=ReadWrite|Share Deny None;Persist Security Info=False"
        conn.Open
    End If

End Sub

Public Sub disconnect()
'close database connection
    If conn.State = adStateOpen Then
        conn.Close
    End If
End Sub


Public Function getNextId(colName As String, tableName As String) As Integer
    Dim sql As String
    Dim rs As New ADODB.Recordset
    Dim temp As Integer
    
    On Error GoTo nextIDError
    
    sql = "select max(" & colName & ") from " & tableName
    Set rs = conn.Execute(sql)
    rs.MoveFirst
    temp = rs.Fields(0)
    temp = temp + 1
    
    getNextId = temp
    
    Exit Function
    
nextIDError:
    getNextId = 1
End Function
