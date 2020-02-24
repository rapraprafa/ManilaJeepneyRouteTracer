<%@ Page Title="Admin Login" Language="vb" AutoEventWireup="false" CodeBehind="AdminLogin.aspx.vb" Inherits="test.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap-css.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
    <div class="container login-container">
        <div class="row align-items-center justify-content-center">
            <div class="col-md-6 login-form-1">
                <h3>Admin Login</h3>
                <form id="adminlogin" runat="server">
                    <div class="form-group">
                        <asp:TextBox ID="username" TextMode="SingleLine" placeholder="Username" class="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="password" TextMode="Password" placeholder="Password" class="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="LoginAdmin" runat="server" Text="Login" class="btnSubmit" />
                    </div>
                    <div class="form-group">
                        <a href="#" class="ForgetPwd">Forget Password?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
