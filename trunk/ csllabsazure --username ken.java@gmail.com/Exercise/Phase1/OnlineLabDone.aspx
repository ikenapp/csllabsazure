﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OnlineLabDone.aspx.cs" Inherits="Exercise_OnlineLabDone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h1>恭喜你完成了第一階段線上習作,非常感謝您的參與!</h1>
    <span class="cell">
    <asp:Button ID="SelfEval" runat="server" Text="學習自評" CssClass="funButtonStyle" 
                        PostBackUrl="~/Exercise/Phase1/SelfEvaluation.aspx" />
    </span>
</asp:Content>

