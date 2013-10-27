<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Phase1.aspx.cs" Inherits="Execise_Phase1" %>

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
        width : 150px;
        height : 50px;
        background : lightyellow;
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
                    <legend>第一階段</legend> 
    <span class="cell">
    <asp:Button ID="OnlineLab" runat="server" Text="線上習作" CssClass="funButtonStyle" 
                        PostBackUrl="~/Exercise/Phase1/OnlineLab.aspx" />
    </span>
    <span class="cell">
    <asp:Button ID="SelfEval" runat="server" Text="學習自評" CssClass="funButtonStyle" 
                        PostBackUrl="~/Exercise/Phase1/SelfEvaluation.aspx" Enabled="False"/>
    </span>
    </fieldset>
</div>
</asp:Content>

