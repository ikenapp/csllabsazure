<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="LabsSettings.aspx.cs" Inherits="Admin_AdminSettings" %>

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
        background : lightblue;
        /*color : white;*/
        font-size :14px;
    }
    
    .funButtonStyle1
    {
        width : 120px;
        height : 50px;
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
    <asp:Label ID="LabsInfo" runat="server" Text="Label"></asp:Label>
    <fieldset class="login">
                    <legend>實驗前置作業/狀態回報</legend>
    <span class="cell">
    <asp:Button ID="DataImport" runat="server" Text="學生資料匯入" CssClass="funButtonStyle" 
                        PostBackUrl="~/Admin/DataImport.aspx" />
    </span>
    <span class="cell">
    <asp:Button ID="Grouping" runat="server" Text="學生分組設定" CssClass="funButtonStyle" 
                        PostBackUrl="~/Admin/Grouping.aspx" />
    </span>
    <span class="cell">
    <asp:Button ID="StatusReport" runat="server" Text="完成進度報告" CssClass="funButtonStyle" 
                        PostBackUrl="~/Admin/StatusReport.aspx" />
    </span>
    </fieldset>
    <fieldset class="login">
                    <legend>實驗相關設定</legend> 
    <span class="cell">
    <asp:Button ID="ExerciseSettings" runat="server" Text="線上習作設定" CssClass="funButtonStyle1" 
                        PostBackUrl="~/Admin/Survey.aspx" />
    </span>
    <span class="cell">
    <asp:Button ID="SelfEvalSettings" runat="server" Text="學習自評設定" CssClass="funButtonStyle1" 
                        PostBackUrl="~/Admin/Scale.aspx" Enabled="False" />
    </span>
    <span class="cell">
    <asp:Button ID="GroupCSettings" runat="server" Text="C組 Q&A 設定" CssClass="funButtonStyle1" 
                        PostBackUrl="~/Admin/GroupCSettings.aspx"  />
    </span>
    <span class="cell">
    <asp:Button ID="PostTestSettings" runat="server" Text="後測設定" CssClass="funButtonStyle1" 
                        PostBackUrl="~/Admin/PostTest.aspx" />
    </span>
    </fieldset>
     <fieldset class="login">
                    <legend>實驗階段切換</legend> 
    <span class="cell">
    <asp:Button ID="FirstPhase" runat="server" Text="第一階段" CssClass="funButtonStyle1" 
                        onclick="FirstPhase_Click" />
    </span>
    <span class="cell">
    <asp:Button ID="SecondPhase1" runat="server" Text="第二階段-1" CssClass="funButtonStyle1" 
                        onclick="FirstPhase_Click" TabIndex="11" />
    </span>
    <span class="cell">
    <asp:Button ID="SecondPhase2" runat="server" Text="第二階段-2" CssClass="funButtonStyle1" 
                        onclick="FirstPhase_Click" TabIndex="12" />
    </span>
    <span class="cell">
    <asp:Button ID="ThirdPhase" runat="server" Text="第三階段-後測" CssClass="funButtonStyle1" 
                        onclick="FirstPhase_Click" TabIndex="2" />
    </span>
    </fieldset>

     <fieldset class="login">
                    <legend>實驗資料匯出</legend>
    <span class="cell">
    <asp:Button ID="ExerciseExport" runat="server" Text="線上習作匯出" CssClass="funButtonStyle" 
                        Enabled="False" />
    </span>
    <span class="cell">
    <asp:Button ID="SelfEvalExport" runat="server" Text="學習自評匯出" CssClass="funButtonStyle" 
                        Enabled="False" />
    </span>
    <span class="cell">
    <asp:Button ID="PostTestExport" runat="server" Text="後測匯出" CssClass="funButtonStyle" 
                        Enabled="False" />
    </span>
    </fieldset>
</div>
</asp:Content>

