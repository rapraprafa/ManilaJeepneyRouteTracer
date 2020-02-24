<%@ Page Title="Update Routes" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateRoutes.aspx.vb" Inherits="test.UpdateRoutes" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>

    <html>
    <head>
        <title>Update Routes</title>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.css" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css" />
        <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
        <script src="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>
        <style>
            #mapid { height: 500px; }
        </style>
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
            accessToken: 'pk.eyJ1IjoicmFwcmFwcmFmYSIsImEiOiJjazY2YWZmMWUxMG9xM2Zsd2p0MnZvNW14In0.TQx3x3onTsOJ_l_A5NO-_Q',
            tileSize: 512,
            zoomOffset: -1
        }).addTo(mymap);
        L.Control.geocoder().addTo(mymap);

        var _jsArrLat = <%= serializer.Serialize(wayPointLat) %>;
        var _jsArrLng = <%= serializer.Serialize(wayPointLng) %>;
        _jsArrLat.push(<%=serializer.Serialize(wayPointLat)%>);
        _jsArrLng.push(<%=serializer.Serialize(wayPointLat)%>);


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

        function createButton(label, container) {
            var btn = L.DomUtil.create('button', '', container);
            btn.setAttribute('type', 'button');
            btn.innerHTML = label;
            return btn;
        }


        mymap.on('click', function (e) {
            var container = L.DomUtil.create('div'),
                startBtn = createButton('Start from this location', container),
                destBtn = createButton('Go to this location', container);

            L.popup()
                .setContent(container)
                .setLatLng(e.latlng)
                .openOn(mymap);

            L.DomEvent.on(startBtn, 'click', function () {
                control.spliceWaypoints(0, 1, e.latlng);
                mymap.closePopup();
            });

            L.DomEvent.on(destBtn, 'click', function () {
                control.spliceWaypoints(control.getWaypoints().length - 1, 1, e.latlng);
                mymap.closePopup();
            });


            L.popup().setContent(container).setLatLng(e.latlng).openOn(mymap);
        });

</script>

        <asp:DropDownList ID="JeepneyRouteToUpdate" runat="server" AutoPostBack="true" DataSourceID="RouteToUpdate" DataTextField="routename" DataValueField="routename" Width="173px"></asp:DropDownList>
        <asp:SqlDataSource ID="RouteToUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:manilajeepneyroutesConnectionStringDropDown %>" ProviderName="<%$ ConnectionStrings:manilajeepneyroutesConnectionStringDropDown.ProviderName %>" SelectCommand="select routename from jeepneyroutes"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Save" Width="167px" />
    </body>
    </html>
</asp:Content>
