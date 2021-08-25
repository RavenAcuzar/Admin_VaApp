<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Admin_VaApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - VA Administrator</title>

    <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Nunito:400,300,700' />
    <link href="Login/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-container flip">
                <div class="login-form">
                    <h3 class="title">VA Administrator</h3>
                    <div class="form-group">
                        <%--<input runat="server" class="form-input" tooltip-class="username-tooltip" placeholder="Username" id="email" />--%>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" tooltip-class="username-tooltip" placeholder="Username"></asp:TextBox>
                        <span id="username-tool" class="tooltip username-tooltip">Email used on VA App</span>
                    </div>
                    <div class="form-group">
                        <%--<input runat="server" id="txtpassword" type="password" class="form-input" tooltip-class="password-tooltip" placeholder="Password"></input>--%>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" tooltip-class="password-tooltip" placeholder="Password"></asp:TextBox>
                        <span class="tooltip password-tooltip">Password on VA App</span>
                    </div>
                    <div class="form-group">
                        <%--<button onclick="clickListener();" runat="server" id="btnLogin" onserverclick="btnLogin_ServerClick" class="login-button">Login</button>--%>
                        <asp:Button ID="btnLogin" OnClick="btnLogin_Click" runat="server" CssClass="btn btn-primary" Text="Login" />
                        <input class="remember-checkbox" type="checkbox" />
                        <p class="remember-p">Remember me</p>
                    </div>
                </div>
                <div class="loading">
                    <div class="loading-spinner-large" style="display: none;"></div>
                    <div class="loading-spinner-small" style="display: none;"></div>
                </div>
            </div>
        </div>
    </form>


    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js'></script>
    <script src='https://code.jquery.com/jquery-2.1.4.min.js'></script>
    <script src="Login/js/index.js"></script>
</body>
</html>
