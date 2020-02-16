Imports System.Web
Public Class SiteMaster
    Inherits MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
    End Sub


    Protected Sub logout_Click(sender As Object, e As EventArgs)
        FormsAuthentication.SignOut()
        Response.Redirect("AdminLogin.aspx")
    End Sub
End Class