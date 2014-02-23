<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PreTestExport.aspx.cs" Inherits="PreTestExport" %>

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
        width : 120px;
        height : 35px;
        background : lightblue;
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
      
        <fieldset>
    <legend>第一階段前測資料匯出</legend>
     <span class="cell">
    <asp:Button ID="PostTestExportBTN" runat="server" Text="前測匯出" CssClass="funButtonStyle" OnClick="PostTestExportBTN_Click" />
    
    </span>
    </fieldset>
    
    </div>
</asp:Content>

