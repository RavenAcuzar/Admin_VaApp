<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="EditCorpStaff.aspx.cs" Inherits="Admin_VaApp.EditCorpStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">

            <h2 class="page-title">Edit Corporate Staff</h2>

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
                            Changes to corpstaff saved.
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">The-V Corporate Information</div>
                        <div class="panel-body">
                            <div class="col-md-6">
                                <div class="panel panel-info">
                                    <div class="panel-heading">Basic Information</div>
                                    <div class="panel-body">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Search ID</label>
                                                <div class="col-sm-10">
                                                    <div class="row">
                                                        <div class="col-xs-7">
                                                            <div class="input-group">
                                                                <asp:TextBox ID="txtSearchID" runat="server" CssClass="form-control" placeholder="Search ID"></asp:TextBox>
                                                                <span class="input-group-btn">
                                                                    <asp:LinkButton ID="lnkSearch" runat="server" CssClass="btn btn-info" OnClick="lnkSearch_Click"><i class="fa fa-search"></i></asp:LinkButton>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-2">
                                                            <label class="col-sm-2 control-label">Type</label>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <asp:DropDownList ID="cbxType" runat="server" CssClass="form-control">
                                                                <asp:ListItem Selected="True" Value="Poweruser">Poweruser</asp:ListItem>
                                                                <asp:ListItem Value="Normal">Normal</asp:ListItem>
                                                                <asp:ListItem Value="Denied">Denied</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Title</label>
                                                <div class="col-sm-10">
                                                    <div class="row">
                                                        <div class="col-xs-2">
                                                            <asp:DropDownList ID="cbxTitle" runat="server" CssClass="form-control">
                                                                <asp:ListItem Selected="True" Value="Mr.">Mr</asp:ListItem>
                                                                <asp:ListItem Value="Ms.">Ms</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <label class="col-sm-2 control-label">Name</label>
                                                        <div class="col-xs-8">
                                                            <div class="form-group">
                                                                <div class="col-sm-12">
                                                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Company Title</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtCompanyTitle" runat="server" CssClass="form-control" placeholder="Company Title"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Department</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control" placeholder="Department"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Region</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtRegion" runat="server" CssClass="form-control" placeholder="Region"></asp:TextBox>
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
                                     
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Contact Number</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control" placeholder="Contact Number"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Image</label>
                                                <div class="col-sm-10">
                                                    <asp:FileUpload ID="fuCorpPhoto" runat="server" CssClass="form-control" />
                                                    <asp:Image ID="imgCorp" runat="server" Style="width: 150px;"/>                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="col-sm-2 control-label">Corporate Rank</label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtCorpRank" runat="server" CssClass="form-control" placeholder="Corporate Ranking"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8">
                                </div>
                                <div class="col-md-2">
                                    <asp:LinkButton ID="lnkBtnDisable" runat="server" CssClass="btn btn-block btn-social btn-pinterest" OnClick="lnkBtnDisable_Click" data-toggle="modal" data-target="#myModal"><span class="fa fa-pinterest"></span>Delete Corporate</asp:LinkButton>
                                    <div class="hr-dashed"></div>
                                </div>
                                <div class="col-md-2">
                                    <asp:LinkButton ID="lnkBtnSave" runat="server" CssClass="btn btn-block btn-social btn-vimeo" OnClick="lnkBtnSave_Click"><span class="fa fa-save"></span>Save Changes</asp:LinkButton>
                                    <div class="hr-dashed"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                    <h4 class="modal-title" id="myModalLabel">Are you sure you want to delete?</h4>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-block btn-social btn-pinterest" OnClick="lnkBtnDisable_Click" UseSubmitBehavior="false"><span class="fa fa-check"></span>Confirm Delete</asp:LinkButton>

                            </div>
                            <div class="col-md-6">
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-block btn-social btn-reddit"><span class="fa fa-times"></span>Cancel</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
