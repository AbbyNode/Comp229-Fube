<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomTube.aspx.cs" Inherits="Comp229_Fube.CustomTube" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link href="css/CustomTube.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h3>Add Ingredient:</h3>
        <asp:DropDownList ID="IngredientsDropDown" runat="server">
        </asp:DropDownList>
        <asp:Button ID="AddIngredientButton" runat="server" Text="Add" OnClick="AddIngredientButton_Click" />
    </div>
    <div id="TubeBase">
    </div>
</asp:Content>
