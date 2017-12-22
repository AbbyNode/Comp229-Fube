<%@ Page Title="Order Confirmation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubmitOrder.aspx.cs" Inherits="Comp229_Fube.SubmitOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h1>Order Confirmation</h1>
	<h3>Your order has been submitted</h3>
	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="OrderID,TubeID" DataSourceID="Fube_OrderItems" ForeColor="Black" GridLines="Horizontal">
		<Columns>
			<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
			<asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
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
	</asp:Content>
