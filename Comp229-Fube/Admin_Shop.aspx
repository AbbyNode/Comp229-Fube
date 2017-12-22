<%@ Page Title="Admin Shop" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin_Shop.aspx.cs" Inherits="Fube.Admin_Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Modify Tubes in Shop</h1>
	<asp:GridView ID="ShopItemsGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="Fube_Shop" ForeColor="Black" GridLines="Horizontal" AllowSorting="True" DataKeyNames="TubeID">
		<Columns>
			<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
			<asp:BoundField DataField="TubeID" HeaderText="TubeID" SortExpression="TubeID" InsertVisible="False" ReadOnly="True" />
			<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
			<asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
			<asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
			<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
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
	<asp:Button ID="AddNewButton" runat="server" Text="Add New Tube" OnClick="AddNewButton_Click" />
	<asp:SqlDataSource ID="Fube_Shop" runat="server" ConnectionString="<%$ ConnectionStrings:FUBE %>" SelectCommand="SELECT * FROM [Tubes]" DeleteCommand="DELETE FROM [Tubes] WHERE [TubeID] = @TubeID" InsertCommand="INSERT INTO [Tubes] ([Name], [Price], [Image], [Description]) VALUES (@Name, @Price, @Image, @Description)" UpdateCommand="UPDATE [Tubes] SET [Name] = @Name, [Price] = @Price, [Image] = @Image, [Description] = @Description WHERE [TubeID] = @TubeID">
		<DeleteParameters>
			<asp:Parameter Name="TubeID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Name" Type="String" />
			<asp:Parameter Name="Price" Type="Decimal" />
			<asp:Parameter Name="Image" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Name" Type="String" />
			<asp:Parameter Name="Price" Type="Decimal" />
			<asp:Parameter Name="Image" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="TubeID" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>
</asp:Content>
