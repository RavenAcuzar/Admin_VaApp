<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Gbd.aspx.cs" Inherits="Admin_VaApp.Gbd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">The-V Corporate Staff</h2>

            <div class="panel panel-primary">
                <div class="panel-heading">Corporate List</div>
                <br />
                <div class="form-group">
                    <label class="col-sm-2 control-label">Hide Column
                        <br />
                    </label>
                    <div class="col-sm-10">
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="ID" id="chkID" /><label for="chkID">ID</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Title" id="chkTitle" /><label for="chkTitle">Title</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Name" id="chkName" /><label for="chkName">Name</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Company Title" id="chkCompanyTitle" /><label for="chkCompanyTitle">Company Title</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Contact Number" id="chkContactNumber" /><label for="chkContactNumber">Contact Number</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Image" id="chkImage" /><label for="chkImage">Image</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Email" id="chkEmail" /><label for="chkEmail">Email</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Password" id="chkPassword" /><label for="chkPassword">Password</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Department" id="chkDepartment" /><label for="chkDepartment">Department</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Region" id="chkRegion" /><label for="chkRegion">Region</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Type" id="chkType" /><label for="chkType">Type</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Created On" id="chkCreatedOn" /><label for="chkCreatedOn">Created On</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Created By" id="chkCreatedBy" /><label for="chkCreatedBy">Created By</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Updated On" id="chkUpdatedOn" /><label for="chkUpdatedOn">Updated On</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Updated By" id="chkUpdatedBy" /><label for="chkUpdatedBy">Updated By</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Status" id="chkStatus" /><label for="chkStatus">Status</label></div>
                        <div class="checkbox checkbox-inline">
                        <input type="checkbox" value="Action" id="chkAction" /><label for="chkAction">Action</label></div>
                    </div>
                </div>
                <br />
                <div class="panel-body">
                    <%--<asp:ScriptManager ID="corpScript" runat="server" />--%>
                    <asp:UpdatePanel ID="panelCorp" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="panel1" runat="server" ScrollBars="Horizontal">
                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                    <HeaderTemplate>
                                        <table class="table">
                                            <tr>
                                                <th class="colAction">Action</th>
                                                <th class="colStatus">Status</th>
                                                <th class="colID">ID</th>
                                                <th class="colTitle">Title</th>
                                                <th class="colName">Name</th>
                                                <th class="colCompanyTitle">Company Title</th>
                                                <th class="colContactNumber">Contact Number</th>
                                                <th class="colImage">Image</th>
                                                <th class="colEmail">Email</th>
                                                <th class="colPassword">Password</th>
                                                <th class="colDepartment">Department</th>
                                                <th class="colRegion">Region</th>
                                                <th class="colType">Type</th>
                                                <th class="colCreatedOn">Created On</th>
                                                <th class="colCreatedBy">Created By</th>
                                                <th class="colUpdatedOn">Updated On</th>
                                                <th class="colUpdatedBy">Updated By</th>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="colAction">
                                                <asp:LinkButton ID="lblEdit" CommandArgument='<%#Eval("[ID]") %>' CssClass="btn btn-info btn-circle" runat="server" OnClick="lblEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            </td>
                                            <td class="colStatus">
                                                <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("[Status]") %>'></asp:Label>
                                            </td>
                                            <td class="colID">
                                                <asp:Label ID="lblID" runat="server" Text='<%#Eval("[newID]") %>'></asp:Label>
                                            </td>
                                            <td class="colTitle">
                                                <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("[Title]") %>'></asp:Label>
                                            </td>
                                            <td class="colName">
                                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("[Name]") %>'></asp:Label>
                                            </td>
                                            <td class="colCompanyTitle">
                                                <asp:Label ID="lblCompanyTitle" runat="server" Text='<%#Eval("[CompanyTitle]") %>'></asp:Label>
                                            </td>
                                            <td class="colContactNumber">
                                                <asp:Label ID="lblContactNumber" runat="server" Text='<%#Eval("[ContactNumber]") %>'></asp:Label>
                                            </td>
                                            <td class="colImage">
                                                <asp:Label ID="lblImage" runat="server" Text='<%#Eval("[Image]") %>'></asp:Label>
                                            </td>
                                            <td class="colEmail">
                                                <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("[Email]") %>'></asp:Label>
                                            </td>
                                            <td class="colPassword">
                                                <asp:Label ID="lblPassword" runat="server" Text='<%#Eval("[Password]") %>'></asp:Label>
                                            </td>
                                            <td class="colDepartment">
                                                <asp:Label ID="lblDepartment" runat="server" Text='<%#Eval("[Department]") %>'></asp:Label>
                                            </td>
                                            <td class="colRegion">
                                                <asp:Label ID="lblRegion" runat="server" Text='<%#Eval("[Region]") %>'></asp:Label>
                                            </td>
                                            <td class="colType">
                                                <asp:Label ID="lblType" runat="server" Text='<%#Eval("[Type]") %>'></asp:Label>
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
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </asp:Panel>
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
