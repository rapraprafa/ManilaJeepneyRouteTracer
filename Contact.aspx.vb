Imports System.Web.Script.Serialization
Imports System.Web.Script.Serialization.JavaScriptSerializer
Imports System.Web.Services
Imports System.Windows
Imports MySql.Data
Imports MySql.Data.MySqlClient

Public Class Contact
    Inherits Page
    Protected i As Int32 = 100

    Protected serializer = New JavaScriptSerializer()

    Dim myConnectionString As String

    Protected wayPointLat(i) As Double
    Protected wayPointLng(i) As Double
    Protected Property numberofwaypointsadded As Int32

    Public Function getJsonLat() As String
        Dim waypointLati = New List(Of Object) From {
            wayPointLat(i)
    }
        Return (New JavaScriptSerializer()).Serialize(waypointLati)
    End Function

    Public Function getJsonLng() As String
        Dim waypointLngi = New List(Of Object) From {
            wayPointLng(i)
    }
        Return (New JavaScriptSerializer()).Serialize(waypointLngi)
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    <WebMethod()>
    Public Shared Function SendLat(ByVal latitude As Double) As Double
        'Dim ID = Request.Form("id")
        'Response.Write(ID)
        'Instead of the above, you can put a breakpoint on the next line to see value of ID
        'Also returning ID so it is display, in your case sent to console.log
        Return latitude
    End Function

    <WebMethod()>
    Public Shared Function SendLng(ByVal longitude As Double) As Double
        'Dim ID = Request.Form("id")
        'Response.Write(ID)
        'Instead of the above, you can put a breakpoint on the next line to see value of ID
        'Also returning ID so it is display, in your case sent to console.log
        Return longitude
    End Function

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


    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("Contact.aspx")
    End Sub

    Protected Sub Button2_Click1(sender As Object, e As EventArgs)

    End Sub
End Class