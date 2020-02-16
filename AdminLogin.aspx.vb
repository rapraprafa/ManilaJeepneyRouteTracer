Imports System.Data.SqlClient
Imports System.Windows
Imports MySql.Data.MySqlClient
Imports System.Web

Public Class WebForm1
    Inherits System.Web.UI.Page
    Dim myConnectionString As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LoginAdmin_Click(sender As Object, e As EventArgs) Handles LoginAdmin.Click

        Dim usernamead As String = username.Text
        Dim passwordad As String = password.Text

        myConnectionString = "server=localhost;" _
            & "uid=root;" _
            & "pwd=15264859;" _
            & "database=manilajeepneyroutes"

        Try

            Dim objcon As MySqlConnection
            Dim objcmd As MySqlCommand

            objcon = New MySqlConnection(myConnectionString)
            objcon.Open()
            Dim stmt As String = "select * from adminaccounts where username = '" & usernamead & "' AND password = '" & passwordad & "'"
            objcmd = New MySqlCommand(stmt, objcon)

            Dim reader As MySqlDataReader = objcmd.ExecuteReader

            If (reader.Read) Then
                FormsAuthentication.RedirectFromLoginPage(usernamead, True)
                Response.Redirect("Default.aspx")
            Else
                MessageBox.Show("Username and password does not match.")
            End If

        Catch ex As MySql.Data.MySqlClient.MySqlException
            MessageBox.Show(ex.Message)
        End Try





    End Sub
End Class