<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="test.Contact" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"/>
        <link rel="stylesheet" href="leaflet-routing-machine.css"/>
        <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
        <script src="leaflet-routing-machine.js"></script>
        <style>
            #mapid { height: 500px; }
        </style>
    </head>
    <body>
    
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

        L.Routing.control({
            waypoints: [
                L.latLng(<%=startlat%>, <%=startlng%>),
                L.latLng(<%=wayPointLat1%>, <%=wayPointLng1%>),
                L.latLng(<%=endlat%>, <%=endlng%>)
            ],
        routeWhileDragging: true
        }).addTo(mymap);

  </script>
    <h2><%: Title %></h2>
    <p>.<asp:DropDownList ID="JeepneyRoutesDropDown" runat="server" Height="21px" Width="217px" DataSourceID="manilajeepneyroutessource" DataTextField="routename" DataValueField="routename">
        </asp:DropDownList>
        <asp:SqlDataSource ID="manilajeepneyroutessource" runat="server" ConnectionString="<%$ ConnectionStrings:manilajeepneyroutesConnectionString2 %>" ProviderName="<%$ ConnectionStrings:manilajeepneyroutesConnectionString2.ProviderName %>" SelectCommand="select routename from jeepneyroutes"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Generate Jeepney Route" Width="194px" />
        <asp:Button ID="Button2" runat="server" Text="Reset" Width="115px" />
        </p>

    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
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
