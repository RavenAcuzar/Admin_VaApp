<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="AVPNominationReport.aspx.cs" Inherits="Admin_VaApp.AVPNominationReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">VA Nomination</h2>

            <div class="panel panel-primary">
                <div class="panel-heading"><% Response.Write(Request.QueryString["title"]); %> Candidate List</div>
                <br />
                <%--<div class="form-group">
                    <label class="col-sm-2 control-label">
                        Hide Column
                        <br />
                    </label>
                    <div class="col-sm-10">
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Company Title" id="chkCompanyTitle" /><label for="chkCompanyTitle">Company Title</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Name" id="chkName" /><label for="chkName">Name</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="IR ID" id="chkIRID" /><label for="chkIRID">IR ID</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Password" id="chkPassword" /><label for="chkPassword">Password</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Email" id="chkEmail" /><label for="chkEmail">Email</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Contact Number" id="chkContactNumber" /><label for="chkContactNumber">Contact Number</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Image" id="chkImage" /><label for="chkImage">Image</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Description" id="chkDescription" /><label for="chkDescription">Description</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Corporate Staff" id="chkCorporateStaff" /><label for="chkCorporateStaff">Corporate Staff</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Created On" id="chkCreatedOn" /><label for="chkCreatedOn">Created On</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Created By" id="chkCreatedBy" /><label for="chkCreatedBy">Created By</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Updated On" id="chkUpdatedOn" /><label for="chkUpdatedOn">Updated On</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Updated By" id="chkUpdatedBy" /><label for="chkUpdatedBy">Updated By</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Status" id="chkStatus" /><label for="chkStatus">Status</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Action" id="chkAction" /><label for="chkAction">Action</label>
                        </div>
                    </div>
                </div>--%>
                <div class="panel-body">
                    <%--<asp:ScriptManager ID="ambassadorScript" runat="server" />--%>
                    <asp:UpdatePanel ID="panelAmbassador" runat="server">
                        <ContentTemplate>
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <HeaderTemplate>
                                    <table class="table">
                                        <tr>
                                            <%--<th class="colAction">Action</th>--%>
                                            <th class="colName">Name</th>
                                            <th class="colPassword">Photo</th>
                                            <th class="colIRID">IR ID</th>
                                            <th class="colEmail">Team</th>
                                            <th class="colImage">DIL</th>
                                            <th class="colContactNumber">TGK</th>
                                            <th class="colDescription">RS</th>
                                            <th class="colCorporateStaff">KS</th>
                                            <th class="colCreatedOn">PS</th>
                                            <th class="colCreatedBy">AHH</th>
                                            <th class="colUpdatedOn">SS</th>
                                            <th class="colUpdatedBy">AG</th>
                                            <th class="colUpdatedOn">CM</th>
                                            <th class="colUpdatedBy">FGT</th>
                                            <th class="colUpdatedOn">DS</th>
                                            <th class="colUpdatedBy">Dr. M</th>
                                            <th class="colUpdatedOn">MK</th>
                                            <th class="colUpdatedBy">K. Padma</th>
                                            <th class="colUpdatedBy">Total</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <%--<td class="colAction">
                                            <asp:LinkButton ID="lblEdit" CommandArgument='<%#Eval("[CandidateID]") %>' CssClass="btn btn-info btn-circle" runat="server" OnClick="lblEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <%--<asp:LinkButton ID="lblDelete" CommandArgument='<%#Eval("[ID]") %>' CssClass="btn btn-danger btn-circle" runat="server" data-target="#myModal" data-toggle="modal"><i class="fa fa-user-times"></i></asp:LinkButton>
                                        </td>--%>
                                        <td class="colName">
                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("[Name]") %>'></asp:Label>
                                        </td>
                                        <td class="colPassword">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#"http://vaservice.the-v.net/ImageData.ashx?id=" + Eval("[CandidateID]") %>'></asp:Image>
                                        </td>
                                        <td class="colIRID">
                                            <asp:Label ID="lblIRID" runat="server" Text='<%#Eval("[IRID]") %>'></asp:Label>
                                        </td>
                                        <td class="colEmail">
                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("[Team]") %>'></asp:Label>
                                        </td>
                                        <td class="colContactNumber">
                                            <asp:Label ID="lblContactNumber" runat="server" Text='<%#Eval("[DIL]") %>'></asp:Label>
                                        </td>
                                        <td class="colImage">
                                            <asp:Label ID="lblImage" runat="server" Text='<%#Eval("[TGK]") %>'></asp:Label>
                                        </td>
                                        <td class="colDescription">
                                            <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("[RS]") %>'></asp:Label>
                                        </td>
                                        <td class="colCorporateStaff">
                                            <asp:Label ID="lblCorporateStaff" runat="server" Text='<%#Eval("[KS]") %>'></asp:Label>
                                        </td>
                                        <td class="colCreatedOn">
                                            <asp:Label ID="lblCreatedOn" runat="server" Text='<%#Eval("[PS]") %>'></asp:Label>
                                        </td>
                                        <td class="colCreatedBy">
                                            <asp:Label ID="lblCreatedBy" runat="server" Text='<%#Eval("[AHH]") %>'></asp:Label>
                                        </td>
                                        <td class="colUpdatedOn">
                                            <asp:Label ID="lblUpdatedOn" runat="server" Text='<%#Eval("[SS]") %>'></asp:Label>
                                        </td>
                                        <td class="colUpdatedBy">
                                            <asp:Label ID="lblUpdatedBy" runat="server" Text='<%#Eval("[AG]") %>'></asp:Label>
                                        </td>
                                        <td class="colDescription">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("[CM]") %>'></asp:Label>
                                        </td>
                                        <td class="colCorporateStaff">
                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("[FGT]") %>'></asp:Label>
                                        </td>
                                        <td class="colCreatedOn">
                                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("[DS]") %>'></asp:Label>
                                        </td>
                                        <td class="colCreatedBy">
                                            <asp:Label ID="Label4" runat="server" Text='<%#Eval("[DM]") %>'></asp:Label>
                                        </td>
                                        <td class="colUpdatedOn">
                                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("[MK]") %>'></asp:Label>
                                        </td>
                                        <td class="colUpdatedBy">
                                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("[KPADMA]") %>'></asp:Label>
                                        </td>
                                        <td class="colUpdatedBy">
                                            <asp:Label ID="Label7" runat="server" Text='<%#Eval("[Total]") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>

                            <div>
                                <table class="table">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="lblFirst" runat="server" OnClick="lblFirst_Click" Text="First"></asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lblPrevious" runat="server" OnClick="lblPrevious_Click" Text="Previous"></asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:DataList ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand" OnItemDataBound="rptPaging_ItemDataBound" RepeatDirection="Horizontal">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lblPaging" runat="server" CommandArgument='<%#Eval("[PageIndex]") %>' CommandName="newPage" Text='<%#Eval("[PageText]") %>' Width="20px"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lblNext" runat="server" OnClick="lblNext_Click" Text="Next"></asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lblLast" runat="server" OnClick="lblLast_Click" Text="Last"></asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblpage" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
