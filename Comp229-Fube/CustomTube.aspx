<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomTube.aspx.cs" Inherits="Comp229_Fube.CustomTube" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<link href="css/CustomTube.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div>
		<h3>Add Ingredient:</h3>
		<asp:DropDownList ID="IngredientsDropDown" runat="server" DataSourceID="IngredientsData" DataTextField="Name" DataValueField="Name">
		</asp:DropDownList>
		<asp:SqlDataSource ID="IngredientsData" runat="server" ConnectionString="<%$ ConnectionStrings:FUBEConnectionString %>" SelectCommand="SELECT [Name] FROM [Ingredients]"></asp:SqlDataSource>
		<asp:Button ID="AddIngredientButton" runat="server" Text="Add" OnClick="AddIngredientButton_Click" />
	</div>
	<div id="TubeContainer">
		<img id="BlankTube" src="res/BlankTube.png" />
		<div id="TubeIngredients">
			<asp:PlaceHolder ID="IngredientsPlaceholder" runat="server"></asp:PlaceHolder>
		</div>
	</div>
</asp:Content>
