<%@ Page Title="Admin Accounts" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin_Account.aspx.cs" Inherits="Fube.Admin_Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Modify Accounts</h1>
	<asp:GridView ID="UsersGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="Fube_Users" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
		<Columns>
			<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
			<asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
			<asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
			<asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
			<asp:CheckBoxField DataField="IsAdmin" HeaderText="IsAdmin" SortExpression="IsAdmin" />
			<asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
			<asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
			<asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
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
	<asp:Button ID="AddUserButton" runat="server" Text="Add User" OnClick="AddUserButton_Click" />
	<asp:SqlDataSource ID="Fube_Users" runat="server" ConnectionString="<%$ ConnectionStrings:FUBE %>" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [Users] ([Username], [Password], [IsAdmin], [FirstName], [LastName], [Address]) VALUES (@Username, @Password, @IsAdmin, @FirstName, @LastName, @Address)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [Username] = @Username, [Password] = @Password, [IsAdmin] = @IsAdmin, [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address WHERE [UserID] = @UserID">
		<DeleteParameters>
			<asp:Parameter Name="UserID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Username" Type="String" />
			<asp:Parameter Name="Password" Type="String" />
			<asp:Parameter Name="IsAdmin" Type="Boolean" />
			<asp:Parameter Name="FirstName" Type="String" />
			<asp:Parameter Name="LastName" Type="String" />
			<asp:Parameter Name="Address" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Username" Type="String" />
			<asp:Parameter Name="Password" Type="String" />
			<asp:Parameter Name="IsAdmin" Type="Boolean" />
			<asp:Parameter Name="FirstName" Type="String" />
			<asp:Parameter Name="LastName" Type="String" />
			<asp:Parameter Name="Address" Type="String" />
			<asp:Parameter Name="UserID" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>
</asp:Content>
