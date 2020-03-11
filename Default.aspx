<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="test._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="/Content/bootstrap.min.css">
	<script src="jquery.min.js"></script>
	<script src="popper.min.js"></script>
	<script src="bootstrap.min.js"></script>
	<script src="all.js"></script>
	<link href="style.css" rel="stylesheet">
        
<!--- Image Slider -->
<div id="slides" class="carousel slide" data-ride="carousel">
    <ul class="carousel-indicators">
        <li data-target="#slides" data-slide-to="0" class="active"></li>
        <li data-target="#slides" data-slide-to="1"></li>
        <li data-target="#slides" data-slide-to="2"></li>
    </ul>
<div class="carousel-inner col-12">
    <div class="carousel-item active">
        <img src="img/slider5.png" />
        <div class="carousel-caption">
            <h1 class="display-2"><font="Allura">Manila Jeepney Route Tracer</font></h1>
            <h3>Know your Manila Routes</h3>
            <a runat="server" href="~/RouteTracer"><button type="button" class="btn btn-primary btn-lg" href="~/RouteTracer">Route Tracer</button></a>
        </div>
    </div>
    <div class="carousel-item">
        <img src="img/slider2.jpg" />
    </div>
    <div class="carousel-item">
        <img src="img/slider3.jpg" />
    </div>
</div>
</div>

<!--- Jumbotron -->
<div class="container-fluid">
    <div class="row jumbotron">
        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-10">
            <p class="lead">Manila Jeepney Route Tracer guides your Manila travels whenever you want.</p>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xl-2">
            <a runat="server" href="~/RouteTracer"><button type="button" class="btn btn-outline-secondary btn-lg">Route Tracer</button></a>
        </div>
    </div>
</div>

<!--- Welcome Section -->
<div class="container-fluid padding">
    <div class="row welcome text-center">
        <div class="col-12">
            <h1 class="display-4">Ready for you.</h1>
        </div>
        <hr class="my-4">
        <div class="col-12">
            <p class="lead">Welcome to Manila Jeepney Route Tracer.</p>
        </div>
    </div>
</div>

<!--- Three Column Section -->
<div class="container-fluid padding">
    <div class="row text-center padding">
        <div class="col-xs-12 col-sm-6 col-md-4">
             <img src="img/conveniency.png" height="100" width="100">
            <h3>Conveniency</h3>
            <p>Access our web application anywhere you want.</p>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4">
             <img src="img/responsiveness.png" height="100" width="100">
            <h3>Responsiveness</h3>
            <p>You can use our web application even through smartphones.</p>
        </div>
        <div class="col-sm-12 col-md-4">
            <img src="img/availability.png" height="100" width="100">
            <h3>Availability</h3>
            <p>We are always up for you to not get lost.</p>
        </div>
    </div>
    <hr class="my-4">
</div>

<!--- Two Column Section -->
<!--- 
<div class="container-fluid padding">
    <div class="row padding">
        <div class="col-lg-6">
            <h2>If you join us...</h2>
            <p>You can get freebies.</p>
            <p>You can get free house.</p>
            <p>You can get free money.</p>
            <br />
            <a href="#" class="btn btn-primary">Learn more</a>
        </div>
        <div class="col-lg-6">
            <img src="img/desk.png" class="img-fluid" />
        </div>
    </div>
</div>

<hr class="my-4"/>
<!--- Fixed background -->
<!--<figure>
    <div class="fixed-wrap">
        <div id="fixed">

        </div>
    </div>
</figure> 

<!--- Emoji Section -->
<!--- <button class="fun" data-toggle="collapse" data-target="#emoji">
    Click for fun
</button>
<div id="emoji" class="collapse">
    <div class="container-fluid padding">
        <div class="row text-center">
            <div class="col-xs-12 col-sm-6 col-md-3">
                <img class="gif" src="img/gif/panda.gif" />
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <img class="gif" src="img/gif/chicken.gif" />
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <img class="gif" src="img/gif/poo.gif" />
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <img class="gif" src="img/gif/unicorn.gif" />
            </div>
        </div>
    </div>
</div>   -->
<!--- Meet the team -->
<div class="container-fluid padding">
    <div class="row welcome text-center">
        <div class="col-12">
            <h1 class="display-4">Our Mission</h1>
        </div>
        <hr />
    </div>
</div>


<!--- Two Column Section -->
<div class="container-fluid padding">
    <div class="row padding">
        <div class="col-l2">
            <p>It is our goal to make travels in Manila worth your time. Manila is the nation's capital city and we are here to provide you the most precise and trustworthy jeepney routes with a user-friendly maps API.</p>
            <br />
        </div>
    </div>
    <hr class="my-4" />
</div>

<!--- Connect -->
<div class="container-fluid padding">
    <div class="row text-center padding">
        <div class="col-12">
            <h2>Connect with us</h2>
        </div>
        <div class="col-12 social padding">
            <a href="http://www.facebook.com/manilajeepneyroutes"><i class="fab fa-facebook"></i></a> 
            <a href="http://www.twitter.com/manilajeepneyroutes"><i class="fab fa-twitter"></i></a>
        </div>
    </div>
</div>

<!--- Footer -->
<footer>
    <div class="container-fluid padding">
        <div class="row text-center">
		   <div class="col-12">
		   <div class="footernote">
                <hr class="light" />
                <p>02 954-4062</p>
                <p>manilajeepneyroutes@gmail.com</p>
                <p>234 Onyx Street</p>
                <p>San Andres Bukid, Manila</p></div>
            </div>
            <div class="col-12">
                <hr class="light-100">
				<div class="footernote">
                <h5>&copy; Copyright 2020 Sa Susunod Na Habang Buhay. All Rights Reserved.</h5>
				<h5><br>I ♥ Electives 3</h5></div>
            </div>
        </div>
	</div>
</footer>

</asp:Content>
