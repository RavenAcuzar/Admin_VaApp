<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="NewAmbassador.aspx.cs" Inherits="Admin_VaApp.NewAmbassador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">

            <h2 class="page-title">New  Ambassador</h2>

            <div class="row" id="divNotification" runat="server" visible="false">
                <div class="col-md-12">
                    <div class="col-md-8">
                    </div>
                    <div class="col-md-4">
                        <div class="alert alert-dismissible alert-danger" id="isError" runat="server" visible="false">
                            <button type="button" class="close" data-dismiss="alert"><i class="fa fa-remove"></i></button>
                            <strong>Error!</strong>
                            Something went wrong. Please refresh the page.
                        </div>
                        <div class="alert alert-dismissible alert-success" id="isSuccess" runat="server" visible="false">
                            <button type="button" class="close" data-dismiss="alert"><i class="fa fa-remove"></i></button>
                            <strong>Success!</strong>
                            New ambassador added.
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">The-V Ambassador Information</div>
                        <div class="panel-body">
                            <div class="col-md-6">
                                <div class="panel panel-info">
                                    <div class="panel-heading">Basic Information</div>
                                    <div class="panel-body">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">IR ID</label>
                                                <div class="col-sm-10">
                                                    <div class="row">
                                                        <div class="col-xs-7">
                                                            <asp:TextBox ID="txtIRID" runat="server" CssClass="form-control" placeholder="IR ID"></asp:TextBox>

                                                        </div>
                                                        <div class="col-xs-2">
                                                            <label class="col-sm-2 control-label">Title</label>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <asp:DropDownList ID="cbxTitle" runat="server" CssClass="form-control">
                                                                <asp:ListItem Selected="True" Value="VF">VF</asp:ListItem>
                                                                <asp:ListItem Value="VP">VP</asp:ListItem>
                                                                <asp:ListItem Value="AVP">AVP</asp:ListItem>
                                                                <asp:ListItem Value="VC">VC</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Name</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Company Title</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtCompanyTitle" runat="server" CssClass="form-control" placeholder="Company Title"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="hr-dashed"></div>--%>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Description</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="10" CssClass="form-control" placeholder="Description..." Style="margin: 0px -0.671875px 0px 0px; height: 243px; width: 613px;"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="panel panel-info">
                                    <div class="panel-heading">Account Information</div>
                                    <div class="panel-body">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Corporate Staff</label>
                                                <div class="col-sm-10">
                                                    <asp:DropDownList ID="cbxCorpStaff" runat="server" CssClass="form-control" AppendDataBoundItems="True"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Email</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Password</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Confirm Password</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtCPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm Password"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="hr-dashed"></div>--%>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Contact Number</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control" placeholder="Contact Number"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Image</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtImage" runat="server" CssClass="form-control" placeholder="Image"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Team</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtTeam" runat="server" CssClass="form-control" placeholder="Team"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-10">
                                </div>
                                <div class="col-md-2">
                                    <asp:LinkButton ID="lnkBtnCreate" runat="server" CssClass="btn btn-block btn-social btn-vimeo" OnClick="lnkBtnCreate_Click"><span class="fa fa-user-plus"></span>Add V Ambassador</asp:LinkButton>
                                    <div class="hr-dashed"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
