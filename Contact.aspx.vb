Imports System.Windows
Imports MySql.Data
Imports MySql.Data.MySqlClient

Public Class Contact
    Inherits Page
    Dim myConnectionString As String
    Protected Property startlat As Double
    Protected Property startlng As Double
    Protected Property endlat As Double
    Protected Property endlng As Double
    Protected Property wayPointLat1 As Double
    Protected Property wayPointLng1 As Double


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles JeepneyRoutesDropDown.SelectedIndexChanged

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim con As New MySqlConnection
        Dim cmd As New MySqlCommand
        myConnectionString = "server=localhost;" _
            & "uid=root;" _
            & "pwd=15264859;" _
            & "database=manilajeepneyroutes"
        Try
            con.ConnectionString = myConnectionString

            Dim objcon As MySqlConnection
            Dim objcmd As MySqlCommand

            objcon = New MySqlConnection(myConnectionString)
            objcon.Open()
            Dim stmt As String = "select * from jeepneyroutes where routename = '" & JeepneyRoutesDropDown.Text & "'"
            objcmd = New MySqlCommand(stmt, objcon)

            Dim reader As MySqlDataReader = objcmd.ExecuteReader

            If (reader.Read) Then
                startlat = reader.GetDouble("startWaypointLat")
                startlng = reader.GetDouble("startWaypointLng")
                endlat = reader.GetDouble("endWaypointLat")
                endlng = reader.GetDouble("endWaypointLng")
                startlat = reader.GetDouble("startWaypointLat")
                startlng = reader.GetDouble("startWaypointLng")
                endlat = reader.GetDouble("endWaypointLat")
                endlng = reader.GetDouble("endWaypointLng")
                startlat = reader.GetDouble("startWaypointLat")
                startlng = reader.GetDouble("startWaypointLng")
                endlat = reader.GetDouble("endWaypointLat")
                endlng = reader.GetDouble("endWaypointLng")
                wayPointLat1 = reader.GetDouble("wayPointLat1")
                wayPointLng1 = reader.GetDouble("wayPointLng1")
            End If

        Catch ex As MySql.Data.MySqlClient.MySqlException
            MessageBox.Show(ex.Message)
        End Try

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("Contact.aspx")
    End Sub
End Class