<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Phase0.aspx.cs" Inherits="Execise_Phase0" %>

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
                    <legend>前測</legend> 
    <span class="cell">
    <asp:Button ID="PostTest" runat="server" Text="前測" CssClass="funButtonStyle" 
                        PostBackUrl="~/Exercise/PreTest.aspx" />
    </span>
    </fieldset>
</div>
</asp:Content>

