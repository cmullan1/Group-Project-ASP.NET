<%@ Page Title="Purchase History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Purchases.aspx.cs" Inherits="TravelExpertsWeb.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" OnSelecting="ObjectDataSource1_Selecting" SelectMethod="GetPurchasesByEmail" TypeName="TravelExpertsWeb.App_Code.PurchasesDB" OnSelected="ObjectDataSource1_Selected">
            <SelectParameters>
                <asp:Parameter Name="custEmail" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </p>
    <p>
        <asp:Label ID="lblTotalPrice" runat="server" Font-Size="Large" ForeColor="#1C5E55"></asp:Label>
    </p>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
</asp:Content>
