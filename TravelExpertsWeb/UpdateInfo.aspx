<%@ Page Title="Update Information" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateInfo.aspx.cs" Inherits="TravelExpertsWeb.UpdateInfo" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <hr />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" OnSelecting="ObjectDataSource1_Selecting" SelectMethod="GetCustomerByEmail" TypeName="TravelExpertsWeb.App_Code.CustomerDB" UpdateMethod="UpdateCustomer" ConflictDetection="CompareAllValues" DataObjectTypeName="TravelExpertsWeb.App_Code.Customer" OnSelected="ObjectDataSource1_Selected" OnUpdated="ObjectDataSource1_Updated">
        <SelectParameters>
            <asp:Parameter Name="custEmail" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_Customer" Type="Object" />
            <asp:Parameter Name="customer" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:FormView ID="fvCustomer" CssClass="fv" runat="server" DataSourceID="ObjectDataSource1">
        <EditItemTemplate>
            <div class="row">
                <div class="col-md-3">
                    <b>Customer ID</b>
                     <asp:TextBox ID="CustomerIdTextBox" CssClass="form-control" runat="server" readonly="true" Text='<%# Bind("CustomerId") %>' />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <b>First Name</b>
                     <asp:TextBox ID="CustFirstNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustFirstName") %>' />
                    <asp:RequiredFieldValidator ControlToValidate="CustFirstNameTextBox" runat="server" CssClass="text-danger" ErrorMessage="Please enter your first name"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-3">
                   <b>Last Name</b>
                    <asp:TextBox ID="CustLastNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustLastName") %>' />
                    <asp:RequiredFieldValidator ControlToValidate="CustLastNameTextBox" runat="server" CssClass="text-danger" ErrorMessage="Please enter your last name"></asp:RequiredFieldValidator>
                </div>
            </div>
           <div class="row">
                <div class="col-md-3">
                    <b>Address</b>
                    <asp:TextBox ID="CustAddressTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustAddress") %>' />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CustAddressTextBox" CssClass="text-danger" ErrorMessage="Please enter your address"></asp:RequiredFieldValidator>
                    <br />
                </div>
                <div class="col-md-3">
                  <b>City</b> 
                    <asp:TextBox ID="CustCityTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustCity") %>' />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CustCityTextBox" CssClass="text-danger" ErrorMessage="Please enter your city"></asp:RequiredFieldValidator>
                    <br /> 
               </div>
           </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <b>Province</b>
                    <asp:DropDownList ID="CustProvDDL" CssClass="form-control" runat="server" SelectedValue='<%# Bind("CustProv") %>'>
                        <asp:ListItem Text="Alberta" value ="AB"></asp:ListItem>
                        <asp:ListItem Text="British Columbia" value ="BC"></asp:ListItem>
                        <asp:ListItem Text="Manitoba" value ="MB"></asp:ListItem>
                        <asp:ListItem Text="New Brunswick" value ="NB"></asp:ListItem>
                        <asp:ListItem Text="Newfoundland and Labrador" value ="NL"></asp:ListItem>
                        <asp:ListItem Text="Northwest Territories" value ="NT"></asp:ListItem>
                        <asp:ListItem Text="Nova Scotia" value ="NS"></asp:ListItem>
                        <asp:ListItem Text="Nunavut" value ="NU"></asp:ListItem>
                        <asp:ListItem Text="Ontario" value ="ON"></asp:ListItem>
                        <asp:ListItem Text="Prince Edward Island" value ="PE"></asp:ListItem>
                        <asp:ListItem Text="Quebec" value ="QC"></asp:ListItem>
                        <asp:ListItem Text="Saskatchewan" value ="SK"></asp:ListItem>
                        <asp:ListItem Text="Yukon" value ="YT"></asp:ListItem>
                    </asp:DropDownList>
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
            <br />
            <div class="row">
                <div class="col-md-3">
                    <b>Country</b>
                    <asp:TextBox ID="CustCountryTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustCountry") %>' />
                     <asp:RequiredFieldValidator runat="server" ControlToValidate="CustCountryTextBox" CssClass="text-danger" ErrorMessage="Please enter your country" />
                    <br />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <b>Home Phone</b>
                    <asp:TextBox ID="CustHomePhoneTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustHomePhone") %>' />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CustHomePhoneTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter your home phone number" />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="CustHomePhoneTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter home phone number as 111-222-3333" ValidationExpression="\d{3}-\d{3}-\d{4}"></asp:RegularExpressionValidator>
                    <br />
                </div>
                <div class="col-md-3">
                    <b>Business Phone</b>
                    <asp:TextBox ID="CustBusPhoneTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustBusPhone") %>' />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="CustBusPhoneTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter business phone number as 111-222-3333" ValidationExpression="\d{3}-\d{3}-\d{4}"></asp:RegularExpressionValidator>
                    <br />
                </div>
            </div>
            <div class="row">
            </div>
             <div class="row">
                 <div class="col-md-3">
                    <b>Email</b>
                    <asp:TextBox ID="CustEmailTextBox" CssClass="form-control" runat="server" readonly="true" Text='<%# Bind("CustEmail") %>' />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CustEmailTextBox" CssClass="text-danger" ErrorMessage="Please enter your email" />
                    <br />
                 </div>
             </div>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CssClass="btn btn-success" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CssClass="btn btn-primary" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>       
        <ItemTemplate >
            <h4>
                <b>Customer ID: </b>
                <asp:Label ID="CustomerIdLabel" runat="server" Text='<%# Bind("CustomerId") %>' />
                <br />
            </h4>
            <h4>
                <b>First Name: </b>
                <asp:Label ID="CustFirstNameLabel" runat="server" Text='<%# Bind("CustFirstName") %>' />
            <br />
            </h4>
            <h4>
                <b>Last Name: </b>
                <asp:Label ID="CustLastNameLabel" runat="server" Text='<%# Bind("CustLastName") %>' />
            <br />
            </h4>
            <h4>
                <b>Address: </b>
                <asp:Label ID="CustAddressLabel" runat="server" Text='<%# Bind("CustAddress") %>' />
                <br />
            </h4>
            <h4>
                <b>City: </b>
                <asp:Label ID="CustCityLabel" runat="server" Text='<%# Bind("CustCity") %>' />
                <br />
            </h4>
            <h4>
                <b>Province: </b>
                <asp:Label ID="CustProvLabel" runat="server" Text='<%# Bind("CustProv") %>' />
                <br />
            </h4>
            <h4>
                <b>Postal Code: </b>
                <asp:Label ID="CustPostalLabel" runat="server" Text='<%# Bind("CustPostal") %>' />
                <br />
            </h4>
            <h4>
                <b>Country: </b>
                <asp:Label ID="CustCountryLabel" runat="server" Text='<%# Bind("CustCountry") %>' />
                <br />
            </h4>
            <h4>
                <b>Home Phone: </b>
                <asp:Label ID="CustHomePhoneLabel" runat="server" Text='<%# Bind("CustHomePhone") %>' />
                <br />
            </h4>
            <h4>
                <b>Business Phone: </b>
                <asp:Label ID="CustBusPhoneLabel" runat="server" Text='<%# Bind("CustBusPhone") %>' />
                <br />
            </h4>
            <h4>
                <b>Email: </b>
            <asp:Label ID="CustEmailLabel" runat="server" Text='<%# Bind("CustEmail") %>' />
            <br />
            </h4>
            <asp:LinkButton ID="EditButton"  runat="server" CausesValidation="False" CssClass="btn btn-primary" CommandName="Edit" Text="Edit" />
        </ItemTemplate>
           
    </asp:FormView>

           
</asp:Content>

