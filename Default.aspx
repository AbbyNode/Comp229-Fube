<%@ Page Title="Home - Fube" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Fube.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link href="css/Home.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div id="Banner" class="section">
		<div class="BannerItem">
			<img class="BannerImg" src="res/BannerImgPlaceholder.png" />
			<div class="BannerText">
				<h1>Title Here</h1>
				<p>Info here.</p>
			</div>
		</div>
	</div>
	<div id="BestSellers" class="section">
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/BannerImgPlaceholder.png" />
		</a>
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/BannerImgPlaceholder.png" />
		</a>
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/BannerImgPlaceholder.png" />
		</a>
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/BannerImgPlaceholder.png" />
		</a>
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/BannerImgPlaceholder.png" />
		</a>
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/BannerImgPlaceholder.png" />
		</a>
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/BannerImgPlaceholder.png" />
		</a>
		<a class="BestSellersItem" href="#">
			<h2 class="BestSellersItemTitle">Item Title</h2>
			<img class="BestSellersItemImg" src="res/BannerImgPlaceholder.png" />
		</a>
	</div>
</asp:Content>
