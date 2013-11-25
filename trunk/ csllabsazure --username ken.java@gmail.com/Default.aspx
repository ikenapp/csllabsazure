<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div style="margin:0 auto; width:300px;display:block">
    <h2>
        <asp:Literal ID="NicknameLabel" runat="server" Text="Label"></asp:Literal>
    </h2>
    <p>
        請您點選左上角選單”粗體字”的頁籤，進入本週線上學習的畫面。
    </p>
        </div>
</asp:Content>
