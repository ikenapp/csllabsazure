<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Phase1Export.aspx.cs" Inherits="Admin_Phase1Export" %>

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
    <legend>第一階段資料匯出</legend>
    <span class="cell">
    <asp:Button ID="ExerciseExport" runat="server" Text="線上習作匯出" CssClass="funButtonStyle" 
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
            window.open("LabPhase1Export.aspx?labid="+labid, "第一階段習作匯出", config = 'height=840,width=800,toolbar=yes, menubar=yes, scrollbars=no, resizable=no,location=no, status=no')

        }

    </script>
</asp:Content>

