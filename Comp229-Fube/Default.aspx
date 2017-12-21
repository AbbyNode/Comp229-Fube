<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Fube.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<link href="css/Home.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div id="Banner" class="section">
		<div class="BannerItem">
			<img class="BannerImg" src="res/Tubes/tube-food-4.jpg" />
			<div class="BannerText">
				<h1>Title Here</h1>
				<p>Info here.</p>
			</div>
		</div>
	</div>
	<div id="BestSellers" class="section">
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/Tubes/lasagnatube.jpg" />
		</a>
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/Tubes/cerealtube.jpg" />
		</a>
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/res/Tubes/fruittube_edit.jpg" />
		</a>
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/res/Tubes/pizzburgertube.jpg" />
		</a>
	</div>
</asp:Content>
