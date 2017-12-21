﻿<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Fube.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<link href="css/LogIn.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div id="LogInBody">
		<asp:MultiView ID="loginPageView" runat="server" ActiveViewIndex="0">
			<!--LOGIN VIEW-->
			<asp:View ID="loginView" runat="server">
				<h1>Log In</h1>
				<p>
					New to FUBE?
                    <asp:LinkButton runat="server" ID="changeViewBtn" Text="Sign Up" OnClick="ChangeView" />
				</p>
				<asp:TextBox runat="server" ID="idTxtBox" Placeholder="ID" CssClass="Textboxes" />
				<asp:TextBox runat="server" ID="pwTxtBox" Placeholder="Password" CssClass="Textboxes" />
				<div>
					<asp:Button runat="server" ID="loginBtn" Text="Log In" OnClick="LoginClick" />
				</div>
			</asp:View>
			<!--SIGN UP VIEW-->
			<asp:View ID="signupView" runat="server">
				<h1>Sign Up</h1>
				<p>
					Already have an account?
                    <asp:LinkButton runat="server" ID="LinkButton1" Text="Log In" OnClick="ChangeView" />
				</p>
				<asp:TextBox runat="server" ID="txtSignupEmail" placeholder="Email" CssClass="Textboxes" />
				<asp:RegularExpressionValidator ID="RegularExpressionValidator_email" runat="server" Display="Dynamic"
					ControlToValidate="txtSignupEmail"
					ValidationExpression="^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$"
					ErrorMessage="Please use the correct format e.g. xyz@gmail.com"
					ForeColor="DarkGray" />
				<asp:TextBox runat="server" ID="txtConfirmEmail" placeholder="Confirm Email" CssClass="Textboxes" />
				<asp:CompareValidator ID="CompareValidator_email" runat="server" Display="Dynamic"
					ControlToCompare="txtSignupEmail"
					ControlToValidate="txtConfirmEmail"
					ErrorMessage="Please enter the same email address as above"
					ForeColor="DarkGray" />
				<asp:TextBox runat="server" ID="txtSignupPassword" placeholder="Password" CssClass="Textboxes" />
				<asp:TextBox runat="server" ID="txtConfirmPassword" placeholder="Confirm Password" CssClass="Textboxes" />
				<asp:CompareValidator ID="CompareValidator_password" runat="server" Display="Dynamic"
					ControlToCompare="txtSignupPassword"
					ControlToValidate="txtConfirmPassword"
					ErrorMessage="Please enter the same password as above"
					ForeColor="DarkGray" />
				<div>
					<asp:Button runat="server" ID="signupBtn" Text="Sign Up" OnClick="SignUpClick" />
				</div>
			</asp:View>
		</asp:MultiView>
	</div>
</asp:Content>
