<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Fube.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<link href="css/About.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h1>Welcome to Fube!</h1>
	<p>Have you ever felt like you aren't getting enough time to eat? We present to you:</p>
	<h3>Food in a Tube!</h3>
	<p>Now you'll be able to eat on the go! Wherever you are, whenever!</p>
	<p>Fube's are compressed food ingredients mixed with specially designed formulas to ensure the tastes you love.</p>
	<h3>Sample Fube:</h3>
	<img id="SampleTube" src="res/Tubes/fruittube_edit.jpg" />
</asp:Content>
