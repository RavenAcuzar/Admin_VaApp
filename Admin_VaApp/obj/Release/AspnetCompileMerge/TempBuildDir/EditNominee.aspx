<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="EditNominee.aspx.cs" Inherits="Admin_VaApp.EditNominee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">

            <h2 class="page-title">Edit Candidate</h2>

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
                            Success! Nominee has been edited.
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="input-group input-group-sm col-md-3">
                                <%--<input type="text" class="form-control" />--%>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtSearchKey"></asp:TextBox>
                                <span class="input-group-btn">
                                    <%--<button type="button" class="btn btn-info btn-flat">Search</button>--%>
                                    <asp:Button OnClick="btnSearch_Click" CssClass="btn btn-info btn-flat" runat="server" ID="btnSearch" Text="Search" />
                                </span>
                            </div>

                        </div>
                        <div class="panel-body">
                            <div class="col-md-12">
                                <asp:Image runat="server" ID="imgDisplay" Height="150px" Width="150px" />
                                <%--<img runat="server" id="imgDisplay" src="" style="height:150px; width:150px; "/>--%>
                                <%--<input type="file" accept="image/*" id="imageLoader" name="imageLoader" />--%>
                                <input id="hiddenImgVal" value="" type="hidden" />
                                <%--<asp:TextBox ID="hiddenImgVal" runat="server" TextMode="MultiLine"></asp:TextBox>--%>
                                <asp:FileUpload runat="server" ID="imageLoader" />
                            </div>
                            <div class="col-md-6">
                                <br />
                                <asp:Label CssClass="control-label" runat="server">Voted For</asp:Label>
                                <asp:DropDownList ID="cbxTitle" CssClass="form-control" runat="server">
                                    <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                    <asp:ListItem Text="Associate V Partner" Value="AVP"></asp:ListItem>
                                    <asp:ListItem Text="V Council" Value="VC"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator3" CssClass="alert-danger" runat="server" ErrorMessage="Please select a title for the candidate"
                                    ValidationGroup="rfv_nominee" ControlToValidate="cbxTitle" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                <br />
                                <asp:Label CssClass="control-label" runat="server">Name</asp:Label>
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="alert-danger" ValidationGroup="rfv_nominee" runat="server" ErrorMessage="Required Field"
                                    ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                <br />
                                <asp:Label CssClass="control-label" runat="server">IR ID</asp:Label>
                                <asp:TextBox ID="txtIRID" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="alert-danger" ValidationGroup="rfv_nominee" runat="server" ErrorMessage="Required Field"
                                    ControlToValidate="txtIRID"></asp:RequiredFieldValidator>
                                <br />
                                <asp:Label CssClass="control-label" runat="server">Team</asp:Label>
                                <asp:TextBox ID="txtTeam" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="alert-danger" ValidationGroup="rfv_nominee" runat="server" ErrorMessage="Required Field"
                                    ControlToValidate="txtTeam"></asp:RequiredFieldValidator>
                                <br />
                                <asp:Label CssClass="control-label" runat="server">Date Joining</asp:Label>
                                <%--<input type="text" class="form-control" id="txtDateJoined" onclick="$('#txtDateJoined').datepicker();" />--%>
                                <asp:TextBox ID="txtDateJoined" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="alert-danger" ValidationGroup="rfv_nominee" runat="server" ErrorMessage="Required Field"
                                    ControlToValidate="txtDateJoined"></asp:RequiredFieldValidator>

                                <br />
                                <asp:Label CssClass="control-label" runat="server">Gender</asp:Label>
                                <asp:DropDownList ID="cbxGender" CssClass="form-control" runat="server">
                                    <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                    <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator10" CssClass="alert-danger" runat="server" ErrorMessage="Please select gender"
                                    ValidationGroup="rfv_nominee" ControlToValidate="cbxGender" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                <br />
                                <asp:Label CssClass="control-label" runat="server">Nominated By</asp:Label>
                                <asp:DropDownList ID="cbxNominatedBy" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                                    <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator1" CssClass="alert-danger" runat="server" ErrorMessage="Please select a VPartner"
                                    ValidationGroup="rfv_nominee" ControlToValidate="cbxNominatedBy" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                <a href="NewAmbassador.aspx" class="pull-right">Add New Ambassador</a>
                                <br />
                                <asp:Label CssClass="control-label" runat="server">Supported By</asp:Label>
                                <asp:DropDownList ID="cbxSupportedBy" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                                    <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator2" CssClass="alert-danger" runat="server" ErrorMessage="Please select a VPartner"
                                    ValidationGroup="rfv_nominee" ControlToValidate="cbxSupportedBy" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                <a href="NewAmbassador.aspx" class="pull-right">Add New Ambassador</a>
                            </div>

                            <div class="col-md-6">
                                <div class="row">
                                    <br />
                                    <asp:Label CssClass="control-label" runat="server">Country</asp:Label>
                                    <asp:DropDownList ID="cbxCountry" CssClass="form-control" runat="server">
                                        <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                        <asp:ListItem>United States</asp:ListItem>
                                        <asp:ListItem>Afghanistan</asp:ListItem>
                                        <asp:ListItem>Albania</asp:ListItem>
                                        <asp:ListItem>Algeria</asp:ListItem>
                                        <asp:ListItem>American Samoa</asp:ListItem>
                                        <asp:ListItem>Andorra</asp:ListItem>
                                        <asp:ListItem>Angola</asp:ListItem>
                                        <asp:ListItem>Anguilla</asp:ListItem>
                                        <asp:ListItem>Antarctica</asp:ListItem>
                                        <asp:ListItem>Antigua And Barbuda</asp:ListItem>
                                        <asp:ListItem>Argentina</asp:ListItem>
                                        <asp:ListItem>Armenia</asp:ListItem>
                                        <asp:ListItem>Aruba</asp:ListItem>
                                        <asp:ListItem>Australia</asp:ListItem>
                                        <asp:ListItem>Austria</asp:ListItem>
                                        <asp:ListItem>Azerbaijan</asp:ListItem>
                                        <asp:ListItem>Bahamas</asp:ListItem>
                                        <asp:ListItem>Bahrain</asp:ListItem>
                                        <asp:ListItem>Bangladesh</asp:ListItem>
                                        <asp:ListItem>Barbados</asp:ListItem>
                                        <asp:ListItem>Belarus</asp:ListItem>
                                        <asp:ListItem>Belgium</asp:ListItem>
                                        <asp:ListItem>Belize</asp:ListItem>
                                        <asp:ListItem>Benin</asp:ListItem>
                                        <asp:ListItem>Bermuda</asp:ListItem>
                                        <asp:ListItem>Bhutan</asp:ListItem>
                                        <asp:ListItem>Bolivia</asp:ListItem>
                                        <asp:ListItem>Bosnia And Herzegowina</asp:ListItem>
                                        <asp:ListItem>Botswana</asp:ListItem>
                                        <asp:ListItem>Bouvet Island</asp:ListItem>
                                        <asp:ListItem>Brazil</asp:ListItem>
                                        <asp:ListItem>British Indian Ocean Territory</asp:ListItem>
                                        <asp:ListItem>Brunei Darussalam</asp:ListItem>
                                        <asp:ListItem>Bulgaria</asp:ListItem>
                                        <asp:ListItem>Burkina Faso</asp:ListItem>
                                        <asp:ListItem>Burundi</asp:ListItem>
                                        <asp:ListItem>Cambodia</asp:ListItem>
                                        <asp:ListItem>Cameroon</asp:ListItem>
                                        <asp:ListItem>Canada</asp:ListItem>
                                        <asp:ListItem>Cape Verde</asp:ListItem>
                                        <asp:ListItem>Cayman Islands</asp:ListItem>
                                        <asp:ListItem>Central African Republic</asp:ListItem>
                                        <asp:ListItem>Chad</asp:ListItem>
                                        <asp:ListItem>Chile</asp:ListItem>
                                        <asp:ListItem>China</asp:ListItem>
                                        <asp:ListItem>Christmas Island</asp:ListItem>
                                        <asp:ListItem>Cocos (Keeling) Islands</asp:ListItem>
                                        <asp:ListItem>Colombia</asp:ListItem>
                                        <asp:ListItem>Comoros</asp:ListItem>
                                        <asp:ListItem>Congo</asp:ListItem>
                                        <asp:ListItem>Cook Islands</asp:ListItem>
                                        <asp:ListItem>Costa Rica</asp:ListItem>
                                        <asp:ListItem>Cote D'Ivoire</asp:ListItem>
                                        <asp:ListItem>Croatia (Local Name: Hrvatska)</asp:ListItem>
                                        <asp:ListItem>Cuba</asp:ListItem>
                                        <asp:ListItem>Cyprus</asp:ListItem>
                                        <asp:ListItem>Czech Republic</asp:ListItem>
                                        <asp:ListItem>Denmark</asp:ListItem>
                                        <asp:ListItem>Djibouti</asp:ListItem>
                                        <asp:ListItem>Dominica</asp:ListItem>
                                        <asp:ListItem>Dominican Republic</asp:ListItem>
                                        <asp:ListItem>East Timor</asp:ListItem>
                                        <asp:ListItem>Ecuador</asp:ListItem>
                                        <asp:ListItem>Egypt</asp:ListItem>
                                        <asp:ListItem>El Salvador</asp:ListItem>
                                        <asp:ListItem>Equatorial Guinea</asp:ListItem>
                                        <asp:ListItem>Eritrea</asp:ListItem>
                                        <asp:ListItem>Estonia</asp:ListItem>
                                        <asp:ListItem>Ethiopia</asp:ListItem>
                                        <asp:ListItem>Falkland Islands (Malvinas)</asp:ListItem>
                                        <asp:ListItem>Faroe Islands</asp:ListItem>
                                        <asp:ListItem>Fiji</asp:ListItem>
                                        <asp:ListItem>Finland</asp:ListItem>
                                        <asp:ListItem>France</asp:ListItem>
                                        <asp:ListItem>French Guiana</asp:ListItem>
                                        <asp:ListItem>French Polynesia</asp:ListItem>
                                        <asp:ListItem>French Southern Territories</asp:ListItem>
                                        <asp:ListItem>Gabon</asp:ListItem>
                                        <asp:ListItem>Gambia</asp:ListItem>
                                        <asp:ListItem>Georgia</asp:ListItem>
                                        <asp:ListItem>Germany</asp:ListItem>
                                        <asp:ListItem>Ghana</asp:ListItem>
                                        <asp:ListItem>Gibraltar</asp:ListItem>
                                        <asp:ListItem>Greece</asp:ListItem>
                                        <asp:ListItem>Greenland</asp:ListItem>
                                        <asp:ListItem>Grenada</asp:ListItem>
                                        <asp:ListItem>Guadeloupe</asp:ListItem>
                                        <asp:ListItem>Guam</asp:ListItem>
                                        <asp:ListItem>Guatemala</asp:ListItem>
                                        <asp:ListItem>Guinea</asp:ListItem>
                                        <asp:ListItem>Guinea-Bissau</asp:ListItem>
                                        <asp:ListItem>Guyana</asp:ListItem>
                                        <asp:ListItem>Haiti</asp:ListItem>
                                        <asp:ListItem>Honduras</asp:ListItem>
                                        <asp:ListItem>Hong Kong</asp:ListItem>
                                        <asp:ListItem>Hungary</asp:ListItem>
                                        <asp:ListItem>Icel And</asp:ListItem>
                                        <asp:ListItem>India</asp:ListItem>
                                        <asp:ListItem>Indonesia</asp:ListItem>
                                        <asp:ListItem>Iran (Islamic Republic Of)</asp:ListItem>
                                        <asp:ListItem>Iraq</asp:ListItem>
                                        <asp:ListItem>Ireland</asp:ListItem>
                                        <asp:ListItem>Israel</asp:ListItem>
                                        <asp:ListItem>Italy</asp:ListItem>
                                        <asp:ListItem>Jamaica</asp:ListItem>
                                        <asp:ListItem>Japan</asp:ListItem>
                                        <asp:ListItem>Jordan</asp:ListItem>
                                        <asp:ListItem>Kazakhstan</asp:ListItem>
                                        <asp:ListItem>Kenya</asp:ListItem>
                                        <asp:ListItem>Kiribati</asp:ListItem>
                                        <asp:ListItem>Korea</asp:ListItem>
                                        <asp:ListItem>Kuwait</asp:ListItem>
                                        <asp:ListItem>Kyrgyzstan</asp:ListItem>
                                        <asp:ListItem>Lao People'S Dem Republic</asp:ListItem>
                                        <asp:ListItem>Latvia</asp:ListItem>
                                        <asp:ListItem>Lebanon</asp:ListItem>
                                        <asp:ListItem>Lesotho</asp:ListItem>
                                        <asp:ListItem>Liberia</asp:ListItem>
                                        <asp:ListItem>Libyan Arab Jamahiriya</asp:ListItem>
                                        <asp:ListItem>Liechtenstein</asp:ListItem>
                                        <asp:ListItem>Lithuania</asp:ListItem>
                                        <asp:ListItem>Luxembourg</asp:ListItem>
                                        <asp:ListItem>Macau</asp:ListItem>
                                        <asp:ListItem>Macedonia</asp:ListItem>
                                        <asp:ListItem>Madagascar</asp:ListItem>
                                        <asp:ListItem>Malawi</asp:ListItem>
                                        <asp:ListItem>Malaysia</asp:ListItem>
                                        <asp:ListItem>Maldives</asp:ListItem>
                                        <asp:ListItem>Mali</asp:ListItem>
                                        <asp:ListItem>Malta</asp:ListItem>
                                        <asp:ListItem>Marshall Islands</asp:ListItem>
                                        <asp:ListItem>Martinique</asp:ListItem>
                                        <asp:ListItem>Mauritania</asp:ListItem>
                                        <asp:ListItem>Mauritius</asp:ListItem>
                                        <asp:ListItem>Mayotte</asp:ListItem>
                                        <asp:ListItem>Mexico</asp:ListItem>
                                        <asp:ListItem>Micronesia, Federated States</asp:ListItem>
                                        <asp:ListItem>Moldova, Republic Of</asp:ListItem>
                                        <asp:ListItem>Monaco</asp:ListItem>
                                        <asp:ListItem>Mongolia</asp:ListItem>
                                        <asp:ListItem>Montserrat</asp:ListItem>
                                        <asp:ListItem>Morocco</asp:ListItem>
                                        <asp:ListItem>Mozambique</asp:ListItem>
                                        <asp:ListItem>Myanmar</asp:ListItem>
                                        <asp:ListItem>Namibia</asp:ListItem>
                                        <asp:ListItem>Nauru</asp:ListItem>
                                        <asp:ListItem>Nepal</asp:ListItem>
                                        <asp:ListItem>Netherlands</asp:ListItem>
                                        <asp:ListItem>Netherlands Ant Illes</asp:ListItem>
                                        <asp:ListItem>New Caledonia</asp:ListItem>
                                        <asp:ListItem>New Zealand</asp:ListItem>
                                        <asp:ListItem>Nicaragua</asp:ListItem>
                                        <asp:ListItem>Niger</asp:ListItem>
                                        <asp:ListItem>Nigeria</asp:ListItem>
                                        <asp:ListItem>Niue</asp:ListItem>
                                        <asp:ListItem>Norfolk Island</asp:ListItem>
                                        <asp:ListItem>Northern Mariana Islands</asp:ListItem>
                                        <asp:ListItem>Norway</asp:ListItem>
                                        <asp:ListItem>Oman</asp:ListItem>
                                        <asp:ListItem>Pakistan</asp:ListItem>
                                        <asp:ListItem>Palau</asp:ListItem>
                                        <asp:ListItem>Panama</asp:ListItem>
                                        <asp:ListItem>Papua New Guinea</asp:ListItem>
                                        <asp:ListItem>Paraguay</asp:ListItem>
                                        <asp:ListItem>Peru</asp:ListItem>
                                        <asp:ListItem>Philippines</asp:ListItem>
                                        <asp:ListItem>Pitcairn</asp:ListItem>
                                        <asp:ListItem>Poland</asp:ListItem>
                                        <asp:ListItem>Portugal</asp:ListItem>
                                        <asp:ListItem>Puerto Rico</asp:ListItem>
                                        <asp:ListItem>Qatar</asp:ListItem>
                                        <asp:ListItem>Reunion</asp:ListItem>
                                        <asp:ListItem>Romania</asp:ListItem>
                                        <asp:ListItem>Russian Federation</asp:ListItem>
                                        <asp:ListItem>Rwanda</asp:ListItem>
                                        <asp:ListItem>Saint K Itts And Nevis</asp:ListItem>
                                        <asp:ListItem>Saint Lucia</asp:ListItem>
                                        <asp:ListItem>Saint Vincent, The Grenadines</asp:ListItem>
                                        <asp:ListItem>Samoa</asp:ListItem>
                                        <asp:ListItem>San Marino</asp:ListItem>
                                        <asp:ListItem>Sao Tome And Principe</asp:ListItem>
                                        <asp:ListItem>Saudi Arabia</asp:ListItem>
                                        <asp:ListItem>Senegal</asp:ListItem>
                                        <asp:ListItem>Seychelles</asp:ListItem>
                                        <asp:ListItem>Sierra Leone</asp:ListItem>
                                        <asp:ListItem>Singapore</asp:ListItem>
                                        <asp:ListItem>Slovakia (Slovak Republic)</asp:ListItem>
                                        <asp:ListItem>Slovenia</asp:ListItem>
                                        <asp:ListItem>Solomon Islands</asp:ListItem>
                                        <asp:ListItem>Somalia</asp:ListItem>
                                        <asp:ListItem>South Africa</asp:ListItem>
                                        <asp:ListItem>South Georgia , S Sandwich Is.</asp:ListItem>
                                        <asp:ListItem>Spain</asp:ListItem>
                                        <asp:ListItem>Sri Lanka</asp:ListItem>
                                        <asp:ListItem>St. Helena</asp:ListItem>
                                        <asp:ListItem>St. Pierre And Miquelon</asp:ListItem>
                                        <asp:ListItem>Sudan</asp:ListItem>
                                        <asp:ListItem>Suriname</asp:ListItem>
                                        <asp:ListItem>Svalbard, Jan Mayen Islands</asp:ListItem>
                                        <asp:ListItem>Sw Aziland</asp:ListItem>
                                        <asp:ListItem>Sweden</asp:ListItem>
                                        <asp:ListItem>Switzerland</asp:ListItem>
                                        <asp:ListItem>Syrian Arab Republic</asp:ListItem>
                                        <asp:ListItem>Taiwan</asp:ListItem>
                                        <asp:ListItem>Tajikistan</asp:ListItem>
                                        <asp:ListItem>Tanzania, United Republic Of</asp:ListItem>
                                        <asp:ListItem>Thailand</asp:ListItem>
                                        <asp:ListItem>Togo</asp:ListItem>
                                        <asp:ListItem>Tokelau</asp:ListItem>
                                        <asp:ListItem>Tonga</asp:ListItem>
                                        <asp:ListItem>Trinidad And Tobago</asp:ListItem>
                                        <asp:ListItem>Tunisia</asp:ListItem>
                                        <asp:ListItem>Turkey</asp:ListItem>
                                        <asp:ListItem>Turkmenistan</asp:ListItem>
                                        <asp:ListItem>Turks And Caicos Islands</asp:ListItem>
                                        <asp:ListItem>Tuvalu</asp:ListItem>
                                        <asp:ListItem>Uganda</asp:ListItem>
                                        <asp:ListItem>Ukraine</asp:ListItem>
                                        <asp:ListItem>United Arab Emirates</asp:ListItem>
                                        <asp:ListItem>United Kingdom</asp:ListItem>
                                        <asp:ListItem>United States</asp:ListItem>
                                        <asp:ListItem>United States Minor Is.</asp:ListItem>
                                        <asp:ListItem>Uruguay</asp:ListItem>
                                        <asp:ListItem>Uzbekistan</asp:ListItem>
                                        <asp:ListItem>Vanuatu</asp:ListItem>
                                        <asp:ListItem>Venezuela</asp:ListItem>
                                        <asp:ListItem>Viet Nam</asp:ListItem>
                                        <asp:ListItem>Virgin Islands (British)</asp:ListItem>
                                        <asp:ListItem>Virgin Islands (U.S.)</asp:ListItem>
                                        <asp:ListItem>Wallis And Futuna Islands</asp:ListItem>
                                        <asp:ListItem>Western Sahara</asp:ListItem>
                                        <asp:ListItem>Yemen</asp:ListItem>
                                        <asp:ListItem>Yugoslavia</asp:ListItem>
                                        <asp:ListItem>Zaire</asp:ListItem>
                                        <asp:ListItem>Zambia</asp:ListItem>
                                        <asp:ListItem>Zimbabwe</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator4" CssClass="alert-danger" runat="server" ErrorMessage="Please select a country"
                                        ValidationGroup="rfv_nominee" ControlToValidate="cbxCountry" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                    <br />
                                    <asp:Label CssClass="control-label" runat="server">ISB Graduate</asp:Label>
                                    <asp:DropDownList ID="cbxISBGrad" CssClass="form-control" runat="server">
                                        <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator5" CssClass="alert-danger" runat="server" ErrorMessage="Required Field"
                                        ValidationGroup="rfv_nominee" ControlToValidate="cbxISBGrad" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                    <br />
                                    <asp:Label CssClass="control-label" runat="server">In Service</asp:Label>
                                    <asp:DropDownList ID="cbxInService" CssClass="form-control" runat="server">
                                        <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator6" CssClass="alert-danger" runat="server" ErrorMessage="Required Field"
                                        ValidationGroup="rfv_nominee" ControlToValidate="cbxInService" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                    <br />
                                    <asp:Label CssClass="control-label" runat="server">USD 52,400 from Jan-Dec </asp:Label><asp:Label CssClass="control-label" runat="server" ID="lblLYear"></asp:Label>
                                    <asp:DropDownList ID="cbxLEarnings" CssClass="form-control" runat="server">
                                        <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator7" CssClass="alert-danger" runat="server" ErrorMessage="Required Field"
                                        ValidationGroup="rfv_nominee" ControlToValidate="cbxLEarnings" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                    <br />
                                    <asp:Label CssClass="control-label" runat="server">USD 72,000 from Jan-Dec </asp:Label><asp:Label CssClass="control-label" runat="server" ID="lblMYear"></asp:Label>
                                    <asp:DropDownList ID="cbxMEarnings" CssClass="form-control" runat="server">
                                        <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator8" CssClass="alert-danger" runat="server" ErrorMessage="Required Field"
                                        ValidationGroup="rfv_nominee" ControlToValidate="cbxMEarnings" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                    <br />
                                    <asp:Label CssClass="control-label" runat="server">USD 96,000 from Jan-Dec </asp:Label><asp:Label CssClass="control-label" runat="server" ID="lblHYear"></asp:Label>
                                    <asp:DropDownList ID="cbxHEarnings" CssClass="form-control" runat="server">
                                        <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CompareValidator CssClass="alert-danger" ID="CompareValidator9" runat="server" ErrorMessage="Required Field"
                                        ValidationGroup="rfv_nominee" ControlToValidate="cbxHEarnings" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                    <br />
                                    <asp:Label CssClass="control-label" runat="server">Remark</asp:Label>
                                    <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" TextMode="MultiLine" Style="margin-top: 0px; margin-bottom: 0px; height: 133px;"></asp:TextBox>

                                    <%--<asp:FileUpload runat="server" ID="fUpload" onpropertychange="loadImage(this.value)" />--%>
                                    <br />
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-7"></div>
                                            <div class="col-md-5">
                                                <div class="row">
                                                    <asp:LinkButton ID="lnkBtnUpdate" runat="server" CssClass="btn btn-block btn-social btn-vimeo"
                                                        OnClick="lnkBtnUpdate_Click" OnClientClick="getImgData()" ValidationGroup="rfv_nominee"><span class="fa fa-user-plus"></span>Edit Candidate</asp:LinkButton>
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
        </div>
    </div>
</asp:Content>
