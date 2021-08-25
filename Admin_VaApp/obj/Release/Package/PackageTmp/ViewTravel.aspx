<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="ViewTravel.aspx.cs" Inherits="Admin_VaApp.ViewTravel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">View Travel Request</h2>

            <div class="panel panel-primary">
                <div class="panel-heading">List of Travel Request</div>
                <br />
                <asp:ScriptManager ID="ambassadorScript" runat="server" />
                <asp:UpdatePanel ID="panelAmbassador" runat="server">
                        <ContentTemplate>
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <HeaderTemplate>
                                    <table class="table">
                                        <tr>
                                            <th class="colAction">Action</th>
                                            <th>ID</th>
                                            <th>IR ID</th>
                                            <th>Ambassador</th>
                                            <th>Position</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Destination</th>
                                            <th>Purpose</th>
                                            <th>Remarks</th>
                                            <th>Created On</th>
                                            <th>Created By</th>
                                            <th>Updated On</th>
                                            <th>Updated By</th>
                                            <th>NSE</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td class="colAction">
                                            <asp:LinkButton ID="lblEdit" CommandArgument='<%#Eval("[ID]") %>' CssClass="btn btn-info btn-circle" runat="server" OnClick="lblEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <%--<asp:LinkButton ID="lblDelete" CommandArgument='<%#Eval("[ID]") %>' CssClass="btn btn-danger btn-circle" runat="server" data-target="#myModal" data-toggle="modal"><i class="fa fa-user-times"></i></asp:LinkButton>--%>
                                        </td>
                                        <td class="colID">
                                            <asp:Label ID="lblID" runat="server" Text='<%#Eval("[ID]") %>'></asp:Label>
                                        </td>
                                        <td class="colIrId">
                                            <asp:Label ID="lblIRID" runat="server" Text='<%#Eval("[IrId]") %>'></asp:Label>
                                        </td>
                                        <td class="colAmbassador">
                                            <asp:Label ID="lblAmbassador" runat="server" Text='<%#Eval("[VAmbassador]") %>'></asp:Label>
                                        </td>
                                        <td class="colrunningNum">
                                            <asp:Label ID="lblrunningNum" runat="server" Text='<%#Eval("[Position]") %>'></asp:Label>
                                        </td>
                                        <td class="colStartDate">
                                            <asp:Label ID="lblStartDate" runat="server" Text='<%#Eval("[StartDate]") %>'></asp:Label>
                                        </td>
                                        <td class="colEndDate">
                                            <asp:Label ID="lblEndDate" runat="server" Text='<%#Eval("[EndDate]") %>'></asp:Label>
                                        </td>
                                        <td class="colDestination">
                                            <asp:Label ID="lblDestination" runat="server" Text='<%#Eval("[Destination]") %>'></asp:Label>
                                        </td>
                                        <td class="colPurpose">
                                            <asp:Label ID="lblPurpose" runat="server" Text='<%#Eval("[Purpose]") %>'></asp:Label>
                                        </td>
                                        <td class="colRemarks">
                                            <asp:Label ID="lblRemarks" runat="server" Text='<%#Eval("[Remarks]") %>'></asp:Label>
                                        </td>
                                        <td class="colCreatedOn">
                                            <asp:Label ID="lblCreatedOn" runat="server" Text='<%#Eval("[CreatedOn]") %>'></asp:Label>
                                        </td>
                                        <td class="colCreatedBy">
                                            <asp:Label ID="lblCreatedBy" runat="server" Text='<%#Eval("[CreatedBy]") %>'></asp:Label>
                                        </td>
                                        <td class="colUpdatedOn">
                                            <asp:Label ID="lblUpdatedOn" runat="server" Text='<%#Eval("[UpdatedOn]") %>'></asp:Label>
                                        </td>
                                        <td class="colUpdatedBy">
                                            <asp:Label ID="lblUpdatedBy" runat="server" Text='<%#Eval("[UpdatedBy]") %>'></asp:Label>
                                        </td>
                                        <td class="colStatus">
                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("[NSE]") %>'></asp:Label>
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

                <div class="panel-body">

                </div>
            </div>
        </div>
    </div>
</asp:Content>
