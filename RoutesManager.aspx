<%@ Page Title="Routes Manager" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoutesManager.aspx.vb" Inherits="test.RoutesManager" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"/>
        <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.css" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css" />
        <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
        <script src="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>
        <script>

        </script>
<%--        <script>
            $(document).ready(function () {
                $("#Button1").click(function () {
                    var routeArray = new Array();
                    var lat;
                    var lng;
                    var xmlhttp = new XMLHttpRequest();
                    for (i = 0; i < control.getWaypoints().length; i++) {
                        lat = routeArray[i].latLng.lat;
                        lng = routeArray[i].latLng.lng;
                        alert(lat);
                        alert(lng);
                        $.ajax({
                            type: "POST",
                            contentType: "application/json",
                            url: "RoutesManager.aspx/InsertRoutes",
                            data: "{'lat':'" + lat + "','lng':'" + lng + "'}",
                            dataType: "json",
                            success: function (data) {
                                alert("Submitted Successfully");
                            }
                        });
                    }
                });
            });

        </script>--%>
        <style>
            #mapid { height: 500px; }
        </style>

    </head>
    <body>
    <asp:HiddenField ID="Latitude" runat="server" />
    <asp:HiddenField ID="Longitude" runat="server" />
    <asp:HiddenField ID="WaypointCount" runat="server" />
    <asp:HiddenField ID="lat" runat="server" />
    <asp:HiddenField ID="lng" runat="server" />
    <div id="mapid"></div>


    <script>

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

        function createButton(label, container) {
            var btn = L.DomUtil.create('button', '', container);
            btn.setAttribute('type', 'button');
            btn.innerHTML = label;
            return btn;
        }

        var waypoints = [null];
        var control = L.Routing.control({
            waypoints: waypoints,
            //         waypoints: [           L.latLng(44.91221, 7.671685),           L.latLng(44.907852, 7.673789)         ],
            routeWhileDragging: true,
            show: true,
            language: 'en',
            geocoder: L.Control.Geocoder.nominatim(),
            autoRoute: true
        }).addTo(mymap);
        

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

            
            routeArray = control.getWaypoints();

            document.getElementById('<%= WaypointCount.ClientID %>').value = control.getWaypoints().length;

            
                //alert(routeArray[i].latLng.lat);
                //alert(routeArray[i].latLng.lng);
                <%--document.getElementById('<%= Latitude.ClientID %>').value = routeArray[i].latLng.lat;
                document.getElementById('<%= Longitude.ClientID %>').value = routeArray[i].latLng.lng;--%>

                //$.ajax({
                //    type: "POST",
                //    url: "submitlat",
                //    data: routeArray[i].latLng.lat,
                //    success: function (html) {
                //        alert("Submitted Lat");
                //    }
                //});

                //$.ajax({
                //    type: "POST",
                //    url: "submitlng",
                //    data: routeArray[i].latLng.lng,
                //    success: function (html) {
                //        alert("Submitted Lng");
                //    }
                //});



            L.popup().setContent(container).setLatLng(e.latlng).openOn(mymap);
        });

        var routeArray = new Array();
        var xmlhttp = new XMLHttpRequest();
        var yourArrayLat = [];
        var yourArrayLng = [];
        var url = window.location.pathname + '?lt=' + routeArray[i].latLng.lat + '&ln=' + routeArray[i].latLng.lng;
        function sendwaypoints() {
            for (var i = 0; i < control.getWaypoints().length; i++) {
                //alert(routeArray[i].latLng.lat);
                //alert(routeArray[i].latLng.lng);
<%--                document.getElementById('<%= Latitude.ClientID %>').value = ;
                document.getElementById('<%= Longitude.ClientID %>').value = ;--%>
                //lat = routeArray[i].latLng.lat;
                //lng = routeArray[i].latLng.lng;
                yourArrayLat.push(routeArray[i].latLng.lat);
                yourArrayLng.push(routeArray[i].latLng.lng);
                //waypointslength = control.getWaypoints().length;
                xmlhttp.open("GET", url, true);
                xmlhttp.send(null);
                alert(xmlhttp);

                //$.ajax({
                //    url: "/RoutesManager.aspx/latitu",
                //    type: "GET",
                //    data: JSON.stringify({ latitudes: yourArrayLat }),
                //    cache: false,
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (data) {
                //        alert("yay1" + data);
                //    }
                //});

                //$.ajax({
                //    url: "/RoutesManager.aspx/longitu",
                //    type: "GET",
                //    data: JSON.stringify({ longitudes: yourArrayLng }),
                //    cache: false,
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (data) {
                //        alert("yay2" + data);
                //    }
                //});

            }
            document.getElementById('<%= Latitude.ClientID %>').value = yourArrayLat;
            document.getElementById('<%= Longitude.ClientID %>').value = yourArrayLng;
            alert(document.getElementById('<%= Latitude.ClientID %>').value);
            alert(document.getElementById('<%= Longitude.ClientID %>').value);

        }
    </script>

        
        
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399
        <asp:Button ID="Button1" runat="server" Text="Add Route" OnClientClick="sendwaypoints();"/>
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Route Name"></asp:TextBox>
        <br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong><a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong><a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
    </body>
    </html>
</asp:Content>
