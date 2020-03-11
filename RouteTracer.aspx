<%@ Page Title="Route Tracer" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RouteTracer.aspx.vb" Inherits="test.RouteTracer" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>Route Tracer</title>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"/>
        <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.css" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css" />
        <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
        <script src="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>
        <script type = "text/javascript">
             function GetLat() {
                 $.ajax({
                     type: "POST",
                     url: "RouteTracer.aspx/SendLat",
                     data: '{latitude: "' + $("#<%= serializer.Serialize(wayPointLat) %>") + '" }',
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: OnSuccess1,
                     failure: function (response) {
                    }
                    });
                    }
             function OnSuccess1(response) {
             }
             function GetLng() {
                 $.ajax({
                     type: "POST",
                     url: "RouteTracer.aspx/SendLng",
                     data: '{longitude: "' + $("#<%= serializer.Serialize(wayPointLng) %>") + '" }',
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: OnSuccess2,
                     failure: function (response) {
                     }
                 });
             }
             function OnSuccess2(response) {
             }
        </script>

        <style>
            #mapid { height: 500px; }
        </style>
        <link rel="stylesheet" href="/Content/bootstrap.min.css">
	    <script src="popper.min.js"></script>
	    <script src="bootstrap.min.js"></script>
	    <script src="all.js"></script>
	    <link href="style.css" rel="stylesheet">
    </head>
    <body>
    
    <div id="mapid"></div>

    <script>

        var numberofwaypointsadded = <%=numberofwaypointsadded%>
  // initialize the map
        var mymap = L.map('mapid').setView([14.60156, 121.00459], 13);

  // load a tile layer
        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
            maxZoom: 30,
            id: 'mapbox/streets-v11',
            accessToken: 'pk.eyJ1IjoicmFwcmFwcmFmYSIsImEiOiJjazdtemRwczAwbGxkM2xwaWU2cTdtb2U1In0.IuwMdFOeKEzy5jPMlwFZDw',
            tileSize: 512,
            zoomOffset: -1
        }).addTo(mymap);
        L.Control.geocoder().addTo(mymap);

        var _jsArrLat = <%= serializer.Serialize(wayPointLat) %>;
        var _jsArrLng = <%= serializer.Serialize(wayPointLng) %>;
        _jsArrLat.push(<%=serializer.Serialize(wayPointLat)%>);
        _jsArrLng.push(<%=serializer.Serialize(wayPointLng)%>);



        var printwaypoint = false;


            var waypoints = [];
            for (var j = 0; j < numberofwaypointsadded; j++) {
                waypoints.push(L.latLng(_jsArrLat[j], _jsArrLng[j]));
            }


            var control = L.Routing.control({
                waypoints:
                    waypoints
                ,
                routeWhileDragging: true,
                show: true,
                language: 'en',
                geocoder: L.Control.Geocoder.nominatim(),
                autoRoute: true
            }).addTo(mymap);

        
        
            //    L.Routing.control({
            //        waypoints:
            //        waypoints,
            //        routeWhileDragging: true
            //    }).addTo(mymap);
            //}


        

        
        

<%--        For (Int() i = 0; i == <%=numberofwaypointsadded%>; i++) {
            L.latLng(<%= wayPointLat% > .toString() + i.ToString(), <%=wayPointLng%>.toString() + i.toString())
        },--%>

          </script>


    <h2><%: Title %></h2>
    <p><asp:DropDownList ID="JeepneyRoutesDropDown" runat="server" Height="21px" Width="217px" DataSourceID="manilajeepneyroutessource" DataTextField="routename" DataValueField="routename">
        </asp:DropDownList>
        </p>
        <p>
        <asp:SqlDataSource ID="manilajeepneyroutessource" runat="server" ConnectionString="<%$ ConnectionStrings:manilajeepneyroutesConnectionString2 %>" ProviderName="<%$ ConnectionStrings:manilajeepneyroutesConnectionString2.ProviderName %>" SelectCommand="select routename from jeepneyroutes"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-lg" Text="Generate Jeepney Route" Width="300px" OnClientClick="GetLat();GetLng();"/>
        <asp:Button ID="Button2" runat="server" class="btn btn-outline-secondary btn-lg" Text="Reset" Width="115px"/>
        </p>
    </body>
    </html>
</asp:Content>
