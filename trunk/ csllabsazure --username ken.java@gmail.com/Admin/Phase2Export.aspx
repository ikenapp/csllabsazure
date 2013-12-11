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
    <legend>第二階段討論群組資料匯出</legend>
     <span class="cell">
    <asp:Button ID="FBExport" runat="server" Text="FB討論群組匯出" CssClass="funButtonStyle" 
                         />
    </span>
        <span class="cell">
    <asp:Button ID="SkypeExport" runat="server" Text="Skype討論群組匯出" CssClass="funButtonStyle" 
                        />
    </span>
            <span class="cell">
    <asp:Button ID="GCExport" runat="server" Text="自我反思群組匯出" CssClass="funButtonStyle" 
                         />
    </span>
        <span class="cell">
    <asp:Button ID="Button3" runat="server" Text="群組D資料匯出" CssClass="funButtonStyle" 
                        Visible="False" />
    </span>
    
    
    </fieldset>
        <fieldset>
    <legend>第二階段線上習作與自評資料匯出</legend>
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

     <script>
         function openNewWindow(labid) {
             //window.open("LabPhase2Export.aspx?labid=" + labid, "第二階段習作匯出", config = 'height=840,width=800,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')
             //return false;
             path = "LabPhase2Export";
             title = "第二階段習作匯出";
             return openExport(path, title, labid);
         }

         function openGroupCExport(labid) {
             //window.open("DiscussionCExport.aspx?labid=" + labid, "自我反思群組匯出", config = 'height=840,width=800,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')
             path = "DiscussionCExport";
             title = "自我反思群組匯出";
             return openExport(path, title, labid);
         }

         function openGroupBExport(labid) {
             path = "DiscussionBExport";
             title = "Skype群組匯出";
             return openExport(path, title, labid);
         }

         function openGroupAExport(labid) {
             path = "DiscussionAExport";
             title = "FaceBook群組匯出";
             return openExport(path, title, labid);
         }

         function openExport(path,title,labid) {
             window.open(path+".aspx?labid=" + labid, title, config = 'height=840,width=800,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')
             return false;
         }
    </script>
</asp:Content>

