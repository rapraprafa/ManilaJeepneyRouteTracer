Imports System.Web.Script.Serialization
Imports System.Windows
Imports MySql.Data.MySqlClient

Public Class UpdateRoutes
    Inherits System.Web.UI.Page

    Protected i As Int32 = 100
    Protected serializer = New JavaScriptSerializer()
    Protected wayPointLat(i) As Double
    Protected wayPointLng(i) As Double
    Protected Property numberofwaypointsadded As Int32

    Dim myConnectionString As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

    End Sub

    Protected Sub JeepneyRouteToUpdate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles JeepneyRouteToUpdate.SelectedIndexChanged
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
            Dim stmt As String = "select * from jeepneyroutes where routename = '" & JeepneyRouteToUpdate.Text & "'"
            objcmd = New MySqlCommand(stmt, objcon)

            Dim reader As MySqlDataReader = objcmd.ExecuteReader

            If (reader.Read) Then
                Dim lat As String = reader.GetString("wayPointLat")
                Dim lng As String = reader.GetString("wayPointLng")
                Dim latarray() As String = lat.Split(New Char() {","c})
                Dim lngarray() As String = lng.Split(New Char() {","c})
                numberofwaypointsadded = reader.GetInt32("numberofwaypointsadded")
                i = 0
                Do
                    wayPointLat(i) = Double.Parse(latarray(i))
                    wayPointLng(i) = Double.Parse(lngarray(i))
                    i = i + 1
                Loop Until i = numberofwaypointsadded

            End If

        Catch ex As MySql.Data.MySqlClient.MySqlException
            MessageBox.Show(ex.Message)
        End Try
    End Sub
End Class