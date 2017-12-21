<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Comp229_Fube.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<link href="css/Contact.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div id="ContactInfo">
		<h1><%: Title %></h1>

		<div>
			<h3>Talk to us</h3>
			<label for="phone">Phone:</label>
			<a id="phone" href="tel:416-222-4444">416-222-4444</a>
		</div>

		<div>
			<h3>Write to us</h3>
			<label for="email">Email:</label>
			<a id="email" href="mailto:Supper@Fube.com">Supper@Fube.com</a>
		</div>

		<div>
			<h3>Visit us</h3>
			<label for="address">Address:</label>
			<p>
				Foodroad St.<br />
				Delic, ON M1K 5E9<br />
				Canada<br />
			</p>
		</div>
	</div>

	<div id="SideImages">
		<img src="res/Tubes/cerealtube.jpg" />
	</div>
</asp:Content>
