<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PostTestExport.aspx.cs" Inherits="PostTestExport" %>

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
     
      <asp:Button ID="PostTestExportBTN" runat="server" Text="後測匯出" CssClass="funButtonStyle" 
                         />
    
        <br />
        <asp:GridView ID="GridView1" runat="server" Width="900px">
        </asp:GridView>
    
    </div>
</asp:Content>

