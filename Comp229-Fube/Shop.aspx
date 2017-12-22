<%@ Page Title="Shop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="Fube.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<link href="css/Shop.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h1>Cart</h1>
	<asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="OrderID,TubeID" DataSourceID="Fube_OrderItems" ForeColor="Black" GridLines="Horizontal">
		<Columns>
			<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
			<asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
			<asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" SortExpression="Price" />
			<asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
		</Columns>
		<FooterStyle BackColor="#CCCC99" ForeColor="Black" />
		<HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
		<SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
		<SortedAscendingCellStyle BackColor="#F7F7F7" />
		<SortedAscendingHeaderStyle BackColor="#4B4B4B" />
		<SortedDescendingCellStyle BackColor="#E5E5E5" />
		<SortedDescendingHeaderStyle BackColor="#242121" />
	</asp:GridView>

	<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="Fube_OrderItemsTotal" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="Column1" HeaderText="Total" ReadOnly="True" SortExpression="Column1" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>

	<asp:SqlDataSource ID="Fube_OrderItemsTotal" runat="server" ConnectionString="<%$ ConnectionStrings:FUBE %>" DeleteCommand="DELETE FROM [OrderItems] WHERE [OrderID] = @OrderID AND [TubeID] = @TubeID" InsertCommand="INSERT INTO [OrderItems] ([OrderID], [TubeID], [Quantity]) VALUES (@OrderID, @TubeID, @Quantity)" SelectCommand="SELECT SUM([Price]*[Quantity]) FROM [OrderItems] INNER JOIN [Tubes] ON [OrderItems].[TubeID] = [Tubes].[TubeID] WHERE ([OrderID] = @OrderID)" UpdateCommand="UPDATE [OrderItems] SET [Quantity] = @Quantity WHERE [OrderID] = @OrderID AND [TubeID] = @TubeID">
		<DeleteParameters>
			<asp:Parameter Name="OrderID" Type="Int32" />
			<asp:Parameter Name="TubeID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="OrderID" Type="Int32" />
			<asp:Parameter Name="TubeID" Type="Int32" />
			<asp:Parameter Name="Quantity" Type="Decimal" />
		</InsertParameters>
		<SelectParameters>
			<asp:SessionParameter DefaultValue="0" Name="OrderID" SessionField="OrderNum" Type="Int32" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="Quantity" Type="Decimal" />
			<asp:Parameter Name="OrderID" Type="Int32" />
			<asp:Parameter Name="TubeID" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="Fube_OrderItems" runat="server" ConnectionString="<%$ ConnectionStrings:FUBE %>" DeleteCommand="DELETE FROM [OrderItems] WHERE [OrderID] = @OrderID AND [TubeID] = @TubeID" InsertCommand="INSERT INTO [OrderItems] ([OrderID], [TubeID], [Quantity]) VALUES (@OrderID, @TubeID, @Quantity)" SelectCommand="SELECT [OrderID], [OrderItems].[TubeID], [Name], [Price], [Quantity] FROM [OrderItems] INNER JOIN [Tubes] ON [OrderItems].[TubeID] = [Tubes].[TubeID] WHERE ([OrderID] = @OrderID)" UpdateCommand="UPDATE [OrderItems] SET [Quantity] = @Quantity WHERE [OrderID] = @OrderID AND [TubeID] = @TubeID">
		<DeleteParameters>
			<asp:Parameter Name="OrderID" Type="Int32" />
			<asp:Parameter Name="TubeID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="OrderID" Type="Int32" />
			<asp:Parameter Name="TubeID" Type="Int32" />
			<asp:Parameter Name="Quantity" Type="Decimal" />
		</InsertParameters>
		<SelectParameters>
			<asp:SessionParameter DefaultValue="0" Name="OrderID" SessionField="OrderNum" Type="Int32" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="Quantity" Type="Decimal" />
			<asp:Parameter Name="OrderID" Type="Int32" />
			<asp:Parameter Name="TubeID" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>
	<asp:Button ID="SubmitOrderButton" runat="server" Text="Submit Order" OnClick="SubmitOrderButton_Click" />

	<h1>Shop
	<div id="ShopContainer">
		<asp:PlaceHolder runat="server" ID="ShopItemsPlaceHolder"></asp:PlaceHolder>
	</div>
	<div>
		<a class="linkAsButton" href="CustomTube.aspx">Custom Tube</a>
	</div>
</asp:Content>
