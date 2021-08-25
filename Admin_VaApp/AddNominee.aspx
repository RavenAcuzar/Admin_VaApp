<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="AddNominee.aspx.cs" Inherits="Admin_VaApp.AddNominee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">

            <h2 class="page-title">Add Candidate</h2>

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
                            Success! New Nominee Added.
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Nominee Information</div>
                        <div class="panel-body">
                            <div class="col-md-12">
                                <asp:Image runat="server" ID="imgDisplay" Height="150px" Width="150px" />
                                <%--<img runat="server" id="imgDisplay" src="" style="height:150px; width:150px; "/>-->
                                <%--<input type="file" accept="image/*" id="imageLoader" name="imageLoader" />-->
                                <input id="hiddenImgVal" value="" type="hidden" />
                                <%--<asp:TextBox ID="hiddenImgVal" runat="server" TextMode="MultiLine"></asp:TextBox>-->
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
                                <%--<input type="text" class="form-control" id="txtDateJoined" onclick="$('#txtDateJoined').datepicker();" />-->
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
                                        <asp:ListItem Value="AF">Afghanistan</asp:ListItem>
                                        <asp:ListItem Value="AL">Albania</asp:ListItem>
                                        <asp:ListItem Value="DZ">Algeria</asp:ListItem>
                                        <asp:ListItem Value="AS">American Samoa</asp:ListItem>
                                        <asp:ListItem Value="AD">Andorra</asp:ListItem>
                                        <asp:ListItem Value="AO">Angola</asp:ListItem>
                                        <asp:ListItem Value="AI">Anguilla</asp:ListItem>
                                        <asp:ListItem Value="AQ">Antarctica</asp:ListItem>
                                        <asp:ListItem Value="AG">Antigua And Barbuda</asp:ListItem>
                                        <asp:ListItem Value="AR">Argentina</asp:ListItem>
                                        <asp:ListItem Value="AM">Armenia</asp:ListItem>
                                        <asp:ListItem Value="AW">Aruba</asp:ListItem>
                                        <asp:ListItem Value="AU">Australia</asp:ListItem>
                                        <asp:ListItem Value="AT">Austria</asp:ListItem>
                                        <asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
                                        <asp:ListItem Value="BS">Bahamas</asp:ListItem>
                                        <asp:ListItem Value="BH">Bahrain</asp:ListItem>
                                        <asp:ListItem Value="BD">Bangladesh</asp:ListItem>
                                        <asp:ListItem Value="BB">Barbados</asp:ListItem>
                                        <asp:ListItem Value="BY">Belarus</asp:ListItem>
                                        <asp:ListItem Value="BE">Belgium</asp:ListItem>
                                        <asp:ListItem Value="BZ">Belize</asp:ListItem>
                                        <asp:ListItem Value="BJ">Benin</asp:ListItem>
                                        <asp:ListItem Value="BM">Bermuda</asp:ListItem>
                                        <asp:ListItem Value="BT">Bhutan</asp:ListItem>
                                        <asp:ListItem Value="BO">Bolivia</asp:ListItem>
                                        <asp:ListItem Value="BA">Bosnia And Herzegowina</asp:ListItem>
                                        <asp:ListItem Value="BW">Botswana</asp:ListItem>
                                        <asp:ListItem Value="BV">Bouvet Island</asp:ListItem>
                                        <asp:ListItem Value="BR">Brazil</asp:ListItem>
                                        <asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>
                                        <asp:ListItem Value="BN">Brunei Darussalam</asp:ListItem>
                                        <asp:ListItem Value="BG">Bulgaria</asp:ListItem>
                                        <asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
                                        <asp:ListItem Value="BI">Burundi</asp:ListItem>
                                        <asp:ListItem Value="KH">Cambodia</asp:ListItem>
                                        <asp:ListItem Value="CM">Cameroon</asp:ListItem>
                                        <asp:ListItem Value="CA">Canada</asp:ListItem>
                                        <asp:ListItem Value="CV">Cape Verde</asp:ListItem>
                                        <asp:ListItem Value="KY">Cayman Islands</asp:ListItem>
                                        <asp:ListItem Value="CF">Central African Republic</asp:ListItem>
                                        <asp:ListItem Value="TD">Chad</asp:ListItem>
                                        <asp:ListItem Value="CL">Chile</asp:ListItem>
                                        <asp:ListItem Value="CN">China</asp:ListItem>
                                        <asp:ListItem Value="CX">Christmas Island</asp:ListItem>
                                        <asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>
                                        <asp:ListItem Value="CO">Colombia</asp:ListItem>
                                        <asp:ListItem Value="KM">Comoros</asp:ListItem>
                                        <asp:ListItem Value="CG">Congo</asp:ListItem>
                                        <asp:ListItem Value="CK">Cook Islands</asp:ListItem>
                                        <asp:ListItem Value="CR">Costa Rica</asp:ListItem>
                                        <asp:ListItem Value="CI">Cote D'Ivoire</asp:ListItem>
                                        <asp:ListItem Value="HR">Croatia (Local Name: Hrvatska)</asp:ListItem>
                                        <asp:ListItem Value="CU">Cuba</asp:ListItem>
                                        <asp:ListItem Value="CY">Cyprus</asp:ListItem>
                                        <asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
                                        <asp:ListItem Value="DK">Denmark</asp:ListItem>
                                        <asp:ListItem Value="DJ">Djibouti</asp:ListItem>
                                        <asp:ListItem Value="DM">Dominica</asp:ListItem>
                                        <asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
                                        <asp:ListItem Value="TP">East Timor</asp:ListItem>
                                        <asp:ListItem Value="EC">Ecuador</asp:ListItem>
                                        <asp:ListItem Value="EG">Egypt</asp:ListItem>
                                        <asp:ListItem Value="SV">El Salvador</asp:ListItem>
                                        <asp:ListItem Value="GQ">Equatorial Guinea</asp:ListItem>
                                        <asp:ListItem Value="ER">Eritrea</asp:ListItem>
                                        <asp:ListItem Value="EE">Estonia</asp:ListItem>
                                        <asp:ListItem Value="ET">Ethiopia</asp:ListItem>
                                        <asp:ListItem Value="FK">Falkland Islands (Malvinas)</asp:ListItem>
                                        <asp:ListItem Value="FO">Faroe Islands</asp:ListItem>
                                        <asp:ListItem Value="FJ">Fiji</asp:ListItem>
                                        <asp:ListItem Value="FI">Finland</asp:ListItem>
                                        <asp:ListItem Value="FR">France</asp:ListItem>
                                        <asp:ListItem Value="GF">French Guiana</asp:ListItem>
                                        <asp:ListItem Value="PF">French Polynesia</asp:ListItem>
                                        <asp:ListItem Value="TF">French Southern Territories</asp:ListItem>
                                        <asp:ListItem Value="GA">Gabon</asp:ListItem>
                                        <asp:ListItem Value="GM">Gambia</asp:ListItem>
                                        <asp:ListItem Value="GE">Georgia</asp:ListItem>
                                        <asp:ListItem Value="DE">Germany</asp:ListItem>
                                        <asp:ListItem Value="GH">Ghana</asp:ListItem>
                                        <asp:ListItem Value="GI">Gibraltar</asp:ListItem>
                                        <asp:ListItem Value="GR">Greece</asp:ListItem>
                                        <asp:ListItem Value="GL">Greenland</asp:ListItem>
                                        <asp:ListItem Value="GD">Grenada</asp:ListItem>
                                        <asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
                                        <asp:ListItem Value="GU">Guam</asp:ListItem>
                                        <asp:ListItem Value="GT">Guatemala</asp:ListItem>
                                        <asp:ListItem Value="GN">Guinea</asp:ListItem>
                                        <asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>
                                        <asp:ListItem Value="GY">Guyana</asp:ListItem>
                                        <asp:ListItem Value="HT">Haiti</asp:ListItem>
                                        <asp:ListItem Value="HM">Heard And Mc Donald Islands</asp:ListItem>
                                        <asp:ListItem Value="VA">Holy See (Vatican City State)</asp:ListItem>
                                        <asp:ListItem Value="HN">Honduras</asp:ListItem>
                                        <asp:ListItem Value="HK">Hong Kong</asp:ListItem>
                                        <asp:ListItem Value="HU">Hungary</asp:ListItem>
                                        <asp:ListItem Value="IS">Icel And</asp:ListItem>
                                        <asp:ListItem Value="IN">India</asp:ListItem>
                                        <asp:ListItem Value="ID">Indonesia</asp:ListItem>
                                        <asp:ListItem Value="IR">Iran (Islamic Republic Of)</asp:ListItem>
                                        <asp:ListItem Value="IQ">Iraq</asp:ListItem>
                                        <asp:ListItem Value="IE">Ireland</asp:ListItem>
                                        <asp:ListItem Value="IL">Israel</asp:ListItem>
                                        <asp:ListItem Value="IT">Italy</asp:ListItem>
                                        <asp:ListItem Value="JM">Jamaica</asp:ListItem>
                                        <asp:ListItem Value="JP">Japan</asp:ListItem>
                                        <asp:ListItem Value="JO">Jordan</asp:ListItem>
                                        <asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
                                        <asp:ListItem Value="KE">Kenya</asp:ListItem>
                                        <asp:ListItem Value="KI">Kiribati</asp:ListItem>
                                        <asp:ListItem Value="KP">Korea, Dem People'S Republic</asp:ListItem>
                                        <asp:ListItem Value="KR">Korea, Republic Of</asp:ListItem>
                                        <asp:ListItem Value="KW">Kuwait</asp:ListItem>
                                        <asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
                                        <asp:ListItem Value="LA">Lao People'S Dem Republic</asp:ListItem>
                                        <asp:ListItem Value="LV">Latvia</asp:ListItem>
                                        <asp:ListItem Value="LB">Lebanon</asp:ListItem>
                                        <asp:ListItem Value="LS">Lesotho</asp:ListItem>
                                        <asp:ListItem Value="LR">Liberia</asp:ListItem>
                                        <asp:ListItem Value="LY">Libyan Arab Jamahiriya</asp:ListItem>
                                        <asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
                                        <asp:ListItem Value="LT">Lithuania</asp:ListItem>
                                        <asp:ListItem Value="LU">Luxembourg</asp:ListItem>
                                        <asp:ListItem Value="MO">Macau</asp:ListItem>
                                        <asp:ListItem Value="MK">Macedonia</asp:ListItem>
                                        <asp:ListItem Value="MG">Madagascar</asp:ListItem>
                                        <asp:ListItem Value="MW">Malawi</asp:ListItem>
                                        <asp:ListItem Value="MY">Malaysia</asp:ListItem>
                                        <asp:ListItem Value="MV">Maldives</asp:ListItem>
                                        <asp:ListItem Value="ML">Mali</asp:ListItem>
                                        <asp:ListItem Value="MT">Malta</asp:ListItem>
                                        <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
                                        <asp:ListItem Value="MQ">Martinique</asp:ListItem>
                                        <asp:ListItem Value="MR">Mauritania</asp:ListItem>
                                        <asp:ListItem Value="MU">Mauritius</asp:ListItem>
                                        <asp:ListItem Value="YT">Mayotte</asp:ListItem>
                                        <asp:ListItem Value="MX">Mexico</asp:ListItem>
                                        <asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>
                                        <asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>
                                        <asp:ListItem Value="MC">Monaco</asp:ListItem>
                                        <asp:ListItem Value="MN">Mongolia</asp:ListItem>
                                        <asp:ListItem Value="MS">Montserrat</asp:ListItem>
                                        <asp:ListItem Value="MA">Morocco</asp:ListItem>
                                        <asp:ListItem Value="MZ">Mozambique</asp:ListItem>
                                        <asp:ListItem Value="MM">Myanmar</asp:ListItem>
                                        <asp:ListItem Value="NA">Namibia</asp:ListItem>
                                        <asp:ListItem Value="NR">Nauru</asp:ListItem>
                                        <asp:ListItem Value="NP">Nepal</asp:ListItem>
                                        <asp:ListItem Value="NL">Netherlands</asp:ListItem>
                                        <asp:ListItem Value="AN">Netherlands Ant Illes</asp:ListItem>
                                        <asp:ListItem Value="NC">New Caledonia</asp:ListItem>
                                        <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
                                        <asp:ListItem Value="NI">Nicaragua</asp:ListItem>
                                        <asp:ListItem Value="NE">Niger</asp:ListItem>
                                        <asp:ListItem Value="NG">Nigeria</asp:ListItem>
                                        <asp:ListItem Value="NU">Niue</asp:ListItem>
                                        <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
                                        <asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
                                        <asp:ListItem Value="NO">Norway</asp:ListItem>
                                        <asp:ListItem Value="OM">Oman</asp:ListItem>
                                        <asp:ListItem Value="PK">Pakistan</asp:ListItem>
                                        <asp:ListItem Value="PW">Palau</asp:ListItem>
                                        <asp:ListItem Value="PA">Panama</asp:ListItem>
                                        <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>
                                        <asp:ListItem Value="PY">Paraguay</asp:ListItem>
                                        <asp:ListItem Value="PE">Peru</asp:ListItem>
                                        <asp:ListItem Value="PH">Philippines</asp:ListItem>
                                        <asp:ListItem Value="PN">Pitcairn</asp:ListItem>
                                        <asp:ListItem Value="PL">Poland</asp:ListItem>
                                        <asp:ListItem Value="PT">Portugal</asp:ListItem>
                                        <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
                                        <asp:ListItem Value="QA">Qatar</asp:ListItem>
                                        <asp:ListItem Value="RE">Reunion</asp:ListItem>
                                        <asp:ListItem Value="RO">Romania</asp:ListItem>
                                        <asp:ListItem Value="RU">Russian Federation</asp:ListItem>
                                        <asp:ListItem Value="RW">Rwanda</asp:ListItem>
                                        <asp:ListItem Value="KN">Saint K Itts And Nevis</asp:ListItem>
                                        <asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
                                        <asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>
                                        <asp:ListItem Value="WS">Samoa</asp:ListItem>
                                        <asp:ListItem Value="SM">San Marino</asp:ListItem>
                                        <asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>
                                        <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
                                        <asp:ListItem Value="SN">Senegal</asp:ListItem>
                                        <asp:ListItem Value="SC">Seychelles</asp:ListItem>
                                        <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
                                        <asp:ListItem Value="SG">Singapore</asp:ListItem>
                                        <asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>
                                        <asp:ListItem Value="SI">Slovenia</asp:ListItem>
                                        <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
                                        <asp:ListItem Value="SO">Somalia</asp:ListItem>
                                        <asp:ListItem Value="ZA">South Africa</asp:ListItem>
                                        <asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>
                                        <asp:ListItem Value="ES">Spain</asp:ListItem>
                                        <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
                                        <asp:ListItem Value="SH">St. Helena</asp:ListItem>
                                        <asp:ListItem Value="PM">St. Pierre And Miquelon</asp:ListItem>
                                        <asp:ListItem Value="SD">Sudan</asp:ListItem>
                                        <asp:ListItem Value="SR">Suriname</asp:ListItem>
                                        <asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>
                                        <asp:ListItem Value="SZ">Sw Aziland</asp:ListItem>
                                        <asp:ListItem Value="SE">Sweden</asp:ListItem>
                                        <asp:ListItem Value="CH">Switzerland</asp:ListItem>
                                        <asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>
                                        <asp:ListItem Value="TW">Taiwan</asp:ListItem>
                                        <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
                                        <asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>
                                        <asp:ListItem Value="TH">Thailand</asp:ListItem>
                                        <asp:ListItem Value="TG">Togo</asp:ListItem>
                                        <asp:ListItem Value="TK">Tokelau</asp:ListItem>
                                        <asp:ListItem Value="TO">Tonga</asp:ListItem>
                                        <asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>
                                        <asp:ListItem Value="TN">Tunisia</asp:ListItem>
                                        <asp:ListItem Value="TR">Turkey</asp:ListItem>
                                        <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
                                        <asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>
                                        <asp:ListItem Value="TV">Tuvalu</asp:ListItem>
                                        <asp:ListItem Value="UG">Uganda</asp:ListItem>
                                        <asp:ListItem Value="UA">Ukraine</asp:ListItem>
                                        <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
                                        <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                                        <asp:ListItem Value="US">United States</asp:ListItem>
                                        <asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>
                                        <asp:ListItem Value="UY">Uruguay</asp:ListItem>
                                        <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
                                        <asp:ListItem Value="VU">Vanuatu</asp:ListItem>
                                        <asp:ListItem Value="VE">Venezuela</asp:ListItem>
                                        <asp:ListItem Value="VN">Viet Nam</asp:ListItem>
                                        <asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
                                        <asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>
                                        <asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>
                                        <asp:ListItem Value="EH">Western Sahara</asp:ListItem>
                                        <asp:ListItem Value="YE">Yemen</asp:ListItem>
                                        <asp:ListItem Value="ZR">Zaire</asp:ListItem>
                                        <asp:ListItem Value="ZM">Zambia</asp:ListItem>
                                        <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
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
                                    <asp:Label CssClass="control-label" runat="server">USD 75,000 Annual Comission </asp:Label> <label hidden="true" id="pYear" style="font-weight: normal;"> </label> <label hidden="true" id="cYear" style="font-weight: normal;"> </label>
                                    <asp:DropDownList ID="cbxLEarnings" CssClass="form-control" runat="server">
                                    <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator7" CssClass="alert-danger" runat="server" ErrorMessage="Required Field"
                                    ValidationGroup="rfv_nominee" ControlToValidate="cbxLEarnings" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                    <br />
                                    <asp:Label CssClass="control-label" runat="server">USD 156,000 Annual Comission</asp:Label> <label hidden="true" id="pYear1" style="font-weight: normal;"></label> <label hidden="true" id="cYear1" style="font-weight: normal;"> </label>
                                    <asp:DropDownList ID="cbxMEarnings" CssClass="form-control" runat="server">
                                    <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:DropDownList>
                                    <div hidden="true">
                                <asp:CompareValidator ID="CompareValidator8" CssClass="alert-danger" runat="server" ErrorMessage="Required Field"
                                    ValidationGroup="rfv_nominee" ControlToValidate="cbxMEarnings" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                    <br />
                                    <asp:Label CssClass="control-label" runat="server">USD 96,000 from April </asp:Label> <label id="pYear2" style="font-weight: normal;"></label> to March <label id="cYear2" style="font-weight: normal;"> </label>   
                                    <asp:DropDownList ID="cbxHEarnings" CssClass="form-control" runat="server">
                                    <asp:ListItem  Value="-1">Please Select...</asp:ListItem>
                                        <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:DropDownList>
                                    </div>
                                <asp:CompareValidator ID="CompareValidator21" CssClass="alert-danger" runat="server" ErrorMessage="Required Field"
                                    ValidationGroup="rfv_nominee" ControlToValidate="cbxRank" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                    <br />
                                    <asp:Label CssClass="control-label" runat="server">Rank Category</asp:Label>
                                    <asp:DropDownList ID="cbxRank" CssClass="form-control" runat="server">
                                    <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                        <asp:ListItem Text="Gold" Value="Gold"></asp:ListItem>
                                        <asp:ListItem Text="Sapphire" Value="Sapphire"></asp:ListItem>
                                        <asp:ListItem Text="Diamond" Value="Diamond"></asp:ListItem>
                                        <asp:ListItem Text="Platinum" Value="Platinum"></asp:ListItem>
                                        <asp:ListItem Text="Blue Diamond" Value="Blue Diamond"></asp:ListItem>
                                    </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator20" CssClass="alert-danger" runat="server" ErrorMessage="Required Field"
                                    ValidationGroup="rfv_nominee" ControlToValidate="cbxCOVMem" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>
                                    <br />
                                    <asp:Label CssClass="control-label" runat="server">Member of Colours of The V (COV)</asp:Label>
                                    <asp:DropDownList ID="cbxCOVMem" CssClass="form-control" runat="server">
                                    <asp:ListItem Selected="True" Value="-1">Please Select...</asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                <asp:Label ID="Label1" CssClass="control-label" runat="server">Year of Nomination as VC (For AVP ONLY)</asp:Label>
                                <asp:TextBox ID="txtYrNom" CssClass="form-control" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="alert-danger" ValidationGroup="rfv_nominee" runat="server" ErrorMessage="Required Field" 
                                    ControlToValidate="txtDirectRefNo"></asp:RequiredFieldValidator>
                                <br />
                                 <asp:Label CssClass="control-label" runat="server">No. of Direct Referals:</asp:Label>
                                <asp:TextBox ID="txtDirectRefNo" runat="server" type="number" ></asp:TextBox>
                                <br/>
                                    <asp:Label CssClass="control-label" runat="server">Remark</asp:Label>
                                    <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" TextMode="MultiLine" Style="margin-top: 0px; margin-bottom: 0px; height: 133px;"></asp:TextBox>

                                    <%--<asp:FileUpload runat="server" ID="fUpload" onpropertychange="loadImage(this.value)" />-->
                                    <br />
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-7"></div>
                                            <div class="col-md-5">
                                                <div class="row">
                                                    <asp:LinkButton ID="lnkBtnCreate" runat="server" CssClass="btn btn-block btn-social btn-vimeo" 
                                                        OnClick="lnkBtnCreate_Click" OnClientClick="getImgData()" ValidationGroup="rfv_nominee"><span class="fa fa-user-plus"></span>Add Candidate</asp:LinkButton>
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
