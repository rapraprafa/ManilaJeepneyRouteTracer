<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="test._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
       <asp:LoginView ID="LoginView1" runat="server">
       <AnonymousTemplate>
          <h1>Welcome Guest!</h1>
       </AnonymousTemplate>
       <LoggedInTemplate>                        
          <h1>Welcome Admin!</h1>
       </LoggedInTemplate>
       </asp:LoginView>
        
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting Started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <asp:LoginView ID="LoginView2" runat="server">
                    <AnonymousTemplate>
                        feafaefeafeafajopfejaopfjaeopfjoeapf
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        loggedin
                    </LoggedInTemplate>
                </asp:LoginView>
        </div>
    </div>

</asp:Content>
