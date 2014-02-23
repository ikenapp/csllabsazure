<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SatisficationExport.aspx.cs" Inherits="Admin_SatisfyExport" %>

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
    <legend>滿意度匯出</legend>
    
    <span class="cell">
    <asp:Button ID="SelfEvalExport" runat="server" Text="評量匯出" CssClass="funButtonStyle" 
                        OnClick="SelfEvalExport_Click" />
    </span>
    <span class="cell">
    <asp:Button ID="ExerciseExport" runat="server" Text="意見匯出" CssClass="funButtonStyle" 
                         />
    </span>
    </fieldset> 
      </div>

    <script>
        function openNewWindow(labid) {
            window.open("SatisfyExport.aspx?labid="+labid, "滿意度意見匯出", config = 'height=840,width=800,toolbar=yes, menubar=yes, scrollbars=no, resizable=no,location=no, status=no')

        }

    </script>
</asp:Content>

