<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="EditTravel.aspx.cs" Inherits="Admin_VaApp.EditTravel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">

            <h2 class="page-title">Edit Travel Request</h2>

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
                            Changes to Ambassador saved.
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Travel Request Information</div>
                        <div class="panel-body">
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                                <label class="col-sm-2 control-label">Search ID</label>
                                                <div class="col-sm-10">
                                                    <div class="row">
                                                        <div class="col-xs-4">
                                                            <div class="input-group">
                                                                <asp:TextBox ID="txtSearchID" runat="server" CssClass="form-control" placeholder="Search ID"></asp:TextBox>
                                                                <span class="input-group-btn">
                                                                    <asp:LinkButton ID="lnkSearch" runat="server" CssClass="btn btn-info" OnClick="lnkSearch_Click"><i class="fa fa-search"></i></asp:LinkButton>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-2">
                                                            <label class="col-sm-2 control-label">Ambassador</label>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <asp:TextBox ID="txtAmbassador" runat="server" CssClass="form-control" placeholder="Ambassador"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Start Date</label>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">End Date</label>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>

                                    <hr />
                                </div>
                                <div class="col-md-6">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Destination</label>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txtDestination" runat="server" CssClass="form-control" placeholder="Destination"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Purpose</label>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txtPurpose" runat="server" CssClass="form-control" placeholder="Purpose"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Remarks</label>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" placeholder="Remarks"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="col-md-12">
                                        <div class="col-md-6">
                                        </div>
                                        <div class="col-md-3">
                                            <asp:LinkButton ID="lbtnDelete" runat="server" CssClass="btn btn-block btn-social btn-pinterest pull-right" OnClick="lbtnDelete_Click" data-toggle="modal" data-target="#myModal"><span class="fa fa-pinterest"></span>Delete Corporate</asp:LinkButton>
                                        </div>

                                        <div class="col-md-3">
                                            <asp:LinkButton ID="lnkBtnSave" runat="server" CssClass="btn btn-block btn-social btn-vimeo pull-right" OnClick="lnkBtnSave_Click"><span class="fa fa-save"></span>Save Changes</asp:LinkButton>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
