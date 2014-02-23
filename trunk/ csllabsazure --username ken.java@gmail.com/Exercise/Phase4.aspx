<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Phase4.aspx.cs" Inherits="Execise_Phase4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
    #buttonArea
    {
        margin : auto;
        padding : 20px;
        width : 80%;
        /*border : 1px solid #CCC;*/
        text-align : center;
    }
    
    .funButtonStyle
    {
        width : 200px;
        height : 50px;
        background : pink;
        /*color : white;*/
        font-size :14px;
    }
    
    .cell
    {
        margin : 20px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="buttonArea">
    <asp:Label ID="LabsInfo" runat="server" Text="Label"></asp:Label>
    <fieldset class="login">
                    <legend>滿意度</legend> 
    <span class="cell">
    <asp:Button ID="PostTest" runat="server" Text="滿意度" CssClass="funButtonStyle" 
                        PostBackUrl="~/Exercise/Satisfy.aspx" />
    </span>
    </fieldset>
</div>
</asp:Content>

