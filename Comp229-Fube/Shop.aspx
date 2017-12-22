<%@ Page Title="Shop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="Fube.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<link href="css/Shop.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h1>Shop</h1>

	<div id="ShopContainer">
		<asp:PlaceHolder runat="server" ID="ShopItemsPlaceHolder"></asp:PlaceHolder>
	</div>

	<div>
		<a class="linkAsButton" href="CustomTube.aspx">Custom Tube</a>
	</div>
</asp:Content>
