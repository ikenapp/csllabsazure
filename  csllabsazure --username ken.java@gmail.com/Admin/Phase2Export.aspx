<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Phase2Export.aspx.cs" Inherits="Admin_Phase2Export" %>

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
    <legend>討論群組資料匯出</legend>
     <span class="cell">
    <asp:Button ID="FBExport" runat="server" Text="FB討論群組匯出" CssClass="funButtonStyle" 
                        Enabled="False" />
    </span>
        <span class="cell">
    <asp:Button ID="Button1" runat="server" Text="Skype討論群組匯出" CssClass="funButtonStyle" 
                        Enabled="False" />
    </span>
            <span class="cell">
    <asp:Button ID="Button2" runat="server" Text="自我反思群組匯出" CssClass="funButtonStyle" 
                        Enabled="False" />
    </span>
        <span class="cell">
    <asp:Button ID="Button3" runat="server" Text="群組D資料匯出" CssClass="funButtonStyle" 
                        Enabled="False" />
    </span>
    
    
    </fieldset>
        <fieldset>
    <legend>線上習作與自評資料匯出</legend>
     <span class="cell">
    <asp:Button ID="OnlineExport" runat="server" Text="線上習作匯出" CssClass="funButtonStyle" 
                         />
    </span>
    <span class="cell">
    <asp:Button ID="SelfEvalExport" runat="server" Text="學習自評匯出" CssClass="funButtonStyle" 
                         OnClick="SelfEvalExport_Click" />
    </span>
    
    </fieldset>
        </div>
</asp:Content>

