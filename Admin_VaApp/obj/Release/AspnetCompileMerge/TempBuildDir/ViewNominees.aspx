<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="ViewNominees.aspx.cs" Inherits="Admin_VaApp.ViewNominees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading" style="line-height:45px; !important">Candidate List
                    <asp:LinkButton ID="lbtnExportExcel" runat="server" CssClass="btn btn-info pull-right"
                    OnClick="lbtnExportExcel_Click"><i class="fa fa-reply"></i></asp:LinkButton>

                </div>
                <%--<div class="form-group" style="
    padding-top: 15px;
">
                    <label class="col-sm-2 control-label">
                        Hide Column
                        <br />
                    </label>
                    <div class="col-sm-10">
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Company Title" id="chkPhoto" /><label for="chkPhoto">Photo</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Name" id="chkName" /><label for="chkName">Name</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="IR ID" id="chkIRID" /><label for="chkIRID">IR ID</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Password" id="chkTitle" /><label for="chkTitle">Title</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Email" id="chkTeam" /><label for="chkTeam">Team</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Contact Number" id="chkDateJoining" /><label for="chkDateJoining">Date Joining</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Image" id="chkGender" /><label for="chkGender">Gender</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Description" id="chkCountry" /><label for="chkCountry">Country</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Corporate Staff" id="chkISBGraduate" /><label for="chkISBGraduate">ISB Graduate</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Created On" id="chkNominatedBy" /><label for="chkNominatedBy">Nominated By</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Created By" id="chkSupportedBy" /><label for="chkSupportedBy">Supported By</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Updated On" id="chkUpdatedOn" /><label for="chkUpdatedOn">50, 400</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Updated By" id="chkUpdatedBy" /><label for="chkUpdatedBy">72, 000</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Status" id="chkStatus" /><label for="chkStatus">96, 000</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Action" id="chkAction" /><label for="chkAction">Action</label>
                        </div>
                        <div class="checkbox checkbox-inline">
                            <input type="checkbox" value="Action" id="chkNominationBatch" /><label for="chkNominationBatch">Nomination Batch</label>
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
                                        <th class="colAction">Action</th>
                                        <th class="colPhoto">Photo</th>
                                        <th class="colName">Name</th>
                                        <th class="colIRID">IR ID</th>
                                        <th class="colTitle">Title</th>
                                        <th class="colTeam">Team</th>
                                        <th class="colDateJoining">Date Joining</th>
                                        <th class="colGender">Gender</th>
                                        <th class="colCountry">Country</th>
                                        <th class="colNominatedBy">Nominated By</th>
                                        <th class="colSupportedBy">Supported By</th>
                                        <th class="colISBGraduate">ISB Graduate</th>
                                        <th class="colInService">In Service</th>
                                        <th class="colLEarnings">50, 400</th>
                                        <th class="colMEarnings">72, 000</th>
                                        <th class="colHEarnings">96, 000</th>
                                        <th class="colNominationBatch">Nomination Batch</th>
                                        <th class="colRemark">Remark</th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="colAction">
                                        <asp:LinkButton ID="lblEdit" runat="server" CommandArgument='<%#Eval("[IRID]") %>' CssClass="btn btn-info btn-circle" OnClick="lblEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                        <%--<asp:LinkButton ID="lblDelete" CommandArgument='<%#Eval("[ID]") %>' CssClass="btn btn-danger btn-circle" runat="server" data-target="#myModal" data-toggle="modal"><i class="fa fa-user-times"></i></asp:LinkButton>--%>
                                    </td>
                                    <td class="colPhoto">
                                        <asp:Image ID="Label3" runat="server" ImageUrl='<%#"http://vaservice.the-v.net/ImageData.ashx?id=" + Eval("[ID]") %>'></asp:Image>
                                    </td>
                                    <td class="colName">
                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("[Name]") %>'></asp:Label>
                                    </td>
                                    <td class="colIRID">
                                        <asp:Label ID="lblIRID" runat="server" Text='<%#Eval("[IRID]") %>'></asp:Label>
                                    </td>
                                    <td class="colTitle">
                                        <asp:Label ID="lblCompanyTitle" runat="server" Text='<%#Eval("[Title]") %>'></asp:Label>
                                    </td>
                                    <td class="colTeam">
                                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("[Team]") %>'></asp:Label>
                                    </td>
                                    <td class="colDateJoining">
                                        <asp:Label ID="lblPassword" runat="server" Text='<%#Eval("[DateJoining]") %>'></asp:Label>
                                    </td>
                                    <td class="colGender">
                                        <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("[Gender]") %>'></asp:Label>
                                    </td>
                                    <td class="colCountry">
                                        <asp:Label ID="lblContactNumber" runat="server" Text='<%#Eval("[Country]") %>'></asp:Label>
                                    </td>
                                    <td class="colNominatedBy">
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("[NominatedBy]") %>'></asp:Label>
                                    </td>
                                    <td class="colSupportedBy">
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("[SupportedBy]") %>'></asp:Label>
                                    </td>
                                    <td class="colISBGraduate">
                                        <asp:Label ID="lblImage" runat="server" Text='<%#Eval("[ISBGraduate]") %>'></asp:Label>
                                    </td>
                                    <td class="colInService">
                                        <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("[InService]") %>'></asp:Label>
                                    </td>
                                    <td class="colLEarnings">
                                        <asp:Label ID="lblCorporateStaff" runat="server" Text='<%#Eval("[LEarnings]") %>'></asp:Label>
                                    </td>
                                    <td class="colMEarnings">
                                        <asp:Label ID="lblCreatedOn" runat="server" Text='<%#Eval("[MEarnings]") %>'></asp:Label>
                                    </td>
                                    <td class="colHEarnings">
                                        <asp:Label ID="lblCreatedBy" runat="server" Text='<%#Eval("[HEarnings]") %>'></asp:Label>
                                    </td>
                                    <td class="colNominationBatch">
                                        <asp:Label ID="lblUpdatedOn" runat="server" Text='<%#Eval("[NominationBatch]") %>'></asp:Label>
                                    </td>
                                    <td class="colRemark">
                                        <asp:Label ID="lblUpdatedBy" runat="server" Text='<%#Eval("[Remark]") %>'></asp:Label>
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
