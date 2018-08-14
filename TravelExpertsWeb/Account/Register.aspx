<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TravelExpertsWeb.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <h4>Create a new account</h4>
    <hr />

    <div class="row">
            <asp:FormView ID="fvCustomer" CssClass="fv" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Insert">                
                <InsertItemTemplate>
                    <div class="row ">
                        <div class="col-md-3">
                            <b>First Name</b>
                            <asp:TextBox ID="CustFirstNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustFirstName") %>' />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CustFirstNameTextBox" CssClass="text-danger" ErrorMessage="Please enter your first name" />
                            <br />
                        </div>
                        <div class="col-md-3">
                            <b>Last Name</b>
                            <asp:TextBox ID="CustLastNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustLastName") %>' />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CustLastNameTextBox" CssClass="text-danger" ErrorMessage="Please enter your last name" />
                            <br />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <b>Address</b>
                            <asp:TextBox ID="CustAddressTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustAddress") %>' />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CustAddressTextBox" CssClass="text-danger" ErrorMessage="Please enter your address" />
                            <br />
                        </div>
                        <div class="col-md-3">
                            <b>City</b> 
                            <asp:TextBox ID="CustCityTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustCity") %>' />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CustCityTextBox" CssClass="text-danger" ErrorMessage="Please enter your city" />
                            <br />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <b>Province</b>
                            <asp:DropDownList ID="CustProvDDL" CssClass="form-control" runat="server" SelectedValue='<%# Bind("CustProv") %>' />
                            <br />
                        </div>
                        <div class="col-md-3">
                            <b>Postal Code</b>
                            <asp:TextBox ID="CustPostalTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustPostal") %>' />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CustPostalTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter your postal code" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="text-danger" ControlToValidate="CustPostalTextBox" runat="server" Display="Dynamic" ErrorMessage="Please enter postal code as A1A 1A1" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]"></asp:RegularExpressionValidator>
                            <br />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <b>Country</b>
                            <asp:TextBox ID="CustCountryTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustCountry") %>' />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CustCountryTextBox" CssClass="text-danger" ErrorMessage="Please enter your country" />
                            <br />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <b>Home Phone</b>
                            <asp:TextBox ID="CustHomePhoneTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustHomePhone") %>' />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CustHomePhoneTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter your home phone number" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="CustHomePhoneTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter home phone number as 111-222-3333" ValidationExpression="\d{3}-\d{3}-\d{4}"></asp:RegularExpressionValidator>
                            <br />
                        </div>
                        <div class="col-md-3">
                             <b>Business Phone</b>
                             <asp:TextBox ID="CustBusPhoneTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustBusPhone") %>' />
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="CustBusPhoneTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter business phone number as 111-222-3333" ValidationExpression="\d{3}-\d{3}-\d{4}"></asp:RegularExpressionValidator>
                             <br />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <b>Email</b>
                            <asp:TextBox ID="CustEmailTextBox" CssClass="form-control" runat="server" TextMode="Email" Text='<%# Bind("CustEmail") %>' />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CustEmailTextBox" CssClass="text-danger" ErrorMessage="Please enter your email" />
                            <br />
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    CustFirstName:
                    <asp:Label ID="CustFirstNameLabel" runat="server" Text='<%# Bind("CustFirstName") %>' />
                    <br />
                    CustLastName:
                    <asp:Label ID="CustLastNameLabel" runat="server" Text='<%# Bind("CustLastName") %>' />
                    <br />
                    CustAddress:
                    <asp:Label ID="CustAddressLabel" runat="server" Text='<%# Bind("CustAddress") %>' />
                    <br />
                    CustCity:
                    <asp:Label ID="CustCityLabel" runat="server" Text='<%# Bind("CustCity") %>' />
                    <br />
                    CustProv:
                    <asp:Label ID="CustProvLabel" runat="server" Text='<%# Bind("CustProv") %>' />
                    <br />
                    CustPostal:
                    <asp:Label ID="CustPostalLabel" runat="server" Text='<%# Bind("CustPostal") %>' />
                    <br />
                    CustCountry:
                    <asp:Label ID="CustCountryLabel" runat="server" Text='<%# Bind("CustCountry") %>' />
                    <br />
                    CustHomePhone:
                    <asp:Label ID="CustHomePhoneLabel" runat="server" Text='<%# Bind("CustHomePhone") %>' />
                    <br />
                    CustBusPhone:
                    <asp:Label ID="CustBusPhoneLabel" runat="server" Text='<%# Bind("CustBusPhone") %>' />
                    <br />
                    CustEmail:
                    <asp:Label ID="CustEmailLabel" runat="server" Text='<%# Bind("CustEmail") %>' />
                    <br />
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="TravelExpertsWeb.App_Code.Customer" InsertMethod="InsertCustomer" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerByEmail" TypeName="TravelExpertsWeb.App_Code.CustomerDB" OnInserted="ObjectDataSource1_Inserted" OnSelected="ObjectDataSource1_Selected">
                <SelectParameters>
                    <asp:Parameter DefaultValue="&quot;&quot;" Name="custEmail" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
         </div>
        <div class="row">
            <div class="row">
                <div class="col-md-3">
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label">Password</asp:Label>
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                 <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                 CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
            <div class="col-md-3">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label">Confirm password</asp:Label>
                <br />
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                 <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
            </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-success" />
                    <asp:Button ID="Clear" runat="server" CausesValidation="False" Text="Clear" CssClass="btn btn-primary" OnClick="Clear_Click"/>
                    <br /><br />
                </div>
            </div>
</asp:Content>
