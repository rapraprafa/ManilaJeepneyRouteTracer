Imports System.Windows
Imports System.Web.Script.Serialization
Imports MySql.Data.MySqlClient
Imports System.Web.Services
Imports System.Web.Script.Services

Public Class RoutesManager
    Inherits Page
    Protected Property i As Integer = 100
    Dim myConnectionString As String
    Protected lati(i) As Double
    Protected lngi(i) As Double
    Protected latitudevb(i) As Double
    Protected longitudevb(i) As Double
    Protected serializer = New JavaScriptSerializer()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub




    <WebMethod()>
    <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function latitu(ByVal latitudes As Double) As Double
        Return latitudes
    End Function

    <WebMethod()>
    <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function longitu(ByVal longitudes As Double) As Double
        Return longitudes
    End Function


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        myConnectionString = "server=localhost;" _
            & "uid=root;" _
            & "pwd=15264859;" _
            & "database=manilajeepneyroutes"




        Try

            Dim objcon As MySqlConnection
            Dim objcmd As MySqlCommand

            objcon = New MySqlConnection(myConnectionString)
            objcon.Open()
            Dim stmt As String = "insert into jeepneyroutes (routename, numberofwaypointsadded) values ('" & TextBox2.Text & "', '" & WaypointCount.Value & "')"
            objcmd = New MySqlCommand(stmt, objcon)
            objcmd.ExecuteNonQuery()

            Dim lat As String = Latitude.Value
            Dim latarray() As String = lat.Split(New Char() {","c})
            Dim lng As String = Longitude.Value
            Dim lngarray() As String = lng.Split(New Char() {","c})
            i = 0
            Do
                MessageBox.Show(latarray(i))
                MessageBox.Show(lngarray(i))
                Dim stmt2 As String = "update jeepneyroutes set wayPointLat" + i.ToString + " = " & Double.Parse(latarray(i)) & ", wayPointLng" + i.ToString + " = " & Double.Parse(lngarray(i)) & " where routename = '" & TextBox2.Text & "'"
                objcmd = New MySqlCommand(stmt2, objcon)
                objcmd.ExecuteNonQuery()
                i = i + 1
            Loop Until i = WaypointCount.Value

            objcon.Close()

        Catch ex As MySql.Data.MySqlClient.MySqlException
            MessageBox.Show(ex.Message)
        End Try


    End Sub
End Class