<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="Fube.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<link href="css/Shop.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h1>Shop</h1>

	<div id="ShopContainer">
		<a class="ShopItem" href="#">
			<h2 class="ShopItemTitle">Item Title</h2>
			<img class="ShopItemImg" src="res/Tubes/lasagnatube.jpg" />
		</a>
		<a class="ShopItem" href="#">
			<h2 class="ShopItemTitle">Item Title</h2>
			<img class="ShopItemImg" src="res/Tubes/cerealtube.jpg" />
		</a>
		<a class="ShopItem" href="#">
			<h2 class="ShopItemTitle">Item Title</h2>
			<img class="ShopItemImg" src="res/Tubes/fruittube_edit.jpg" />
		</a>
		<a class="ShopItem" href="#">
			<h2 class="ShopItemTitle">Item Title</h2>
			<img class="ShopItemImg" src="res/Tubes/" />
		</a>
		<a class="ShopItem" href="#">
			<h2 class="ShopItemTitle">Item Title</h2>
			<img class="ShopItemImg" src="res/Tubes/" />
		</a>
		<a class="ShopItem" href="#">
			<h2 class="ShopItemTitle">Item Title</h2>
			<img class="ShopItemImg" src="res/Tubes/" />
		</a>
		<a class="ShopItem" href="#">
			<h2 class="ShopItemTitle">Item Title</h2>
			<img class="ShopItemImg" src="res/Tubes/" />
		</a>
	</div>

	<div>
		<a class="linkAsButton" href="CustomTube.aspx">Custom Tube</a>
	</div>
</asp:Content>
