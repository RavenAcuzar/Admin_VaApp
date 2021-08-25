<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Admin_VaApp.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-body bk-primary text-light">
                            <div class="stat-panel text-center">
                                <div class="stat-panel-number h1 ">
                                    <asp:Label ID="lblAmbassador" runat="server" Text="100"></asp:Label></div>
                                <div class="stat-panel-title text-uppercase">The-V Ambassadors</div>
                            </div>
                        </div>
                        <a href="Ambassador.aspx" class="block-anchor panel-footer text-center">See All &nbsp; <i class="fa fa-arrow-right"></i></a>
                     </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-body bk-primary text-light">
                            <div class="stat-panel text-center">
                                <div class="stat-panel-number h1 ">
                                    <asp:Label ID="lblCorp" runat="server" Text="100"></asp:Label></div>
                                <div class="stat-panel-title text-uppercase">Corporate Staff</div>
                            </div>
                        </div>
                        <a href="Corporate.aspx" class="block-anchor panel-footer text-center">See All &nbsp; <i class="fa fa-arrow-right"></i></a>
                     </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-body bk-primary text-light">
                            <div class="stat-panel text-center">
                                <div class="stat-panel-number h1 ">
                                    <asp:Label ID="lblGbd" runat="server" Text="100"></asp:Label></div>
                                <div class="stat-panel-title text-uppercase">GBD</div>
                            </div>
                        </div>
                        <a href="Gbd.aspx" class="block-anchor panel-footer text-center">See All &nbsp; <i class="fa fa-arrow-right"></i></a>
                     </div>
                </div>
            </div>

            <div class="jumbotron">
                <h1>Welcome <asp:Label ID="lblName" runat="server"></asp:Label></h1>
                This is the administrator page for Va App
            </div>
        </div>
    </div>
</asp:Content>
