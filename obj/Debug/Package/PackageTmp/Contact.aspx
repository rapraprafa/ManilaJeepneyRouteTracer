<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="test.Contact" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"/>
         <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
        <style>
            #mapid { height: 500px; }
        </style>
    </head>
    <body>
    
    <div id="mapid"></div>
    <script>

  // initialize the map
        var mymap = L.map('mapid').setView([42.35, -71.08], 13);

  // load a tile layer
        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
            maxZoom: 18,
            id: 'mapbox/streets-v11',
            accessToken: 'pk.eyJ1IjoicmFwcmFwcmFmYSIsImEiOiJjazY2YWZmMWUxMG9xM2Zsd2p0MnZvNW14In0.TQx3x3onTsOJ_l_A5NO-_Q'
        }).addTo(mymap);

  </script>
    <h2><%: Title %></h2>
    <p>Your contact page.<asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="236px">
        <asp:ListItem>vuvu</asp:ListItem>
        <asp:ListItem>vovo</asp:ListItem>
        <asp:ListItem>gogo</asp:ListItem>
        </asp:DropDownList>
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
