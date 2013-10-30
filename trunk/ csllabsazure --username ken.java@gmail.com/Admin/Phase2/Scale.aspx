<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Scale.aspx.cs" Inherits="Admin_Scale2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    .title
    {
        font-size:14px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;&nbsp;<asp:HyperLink ID="BackLink" runat="server">返回上一頁</asp:HyperLink><br>
   &nbsp;&nbsp;第二階段學習自評題目匯入
    
    <asp:HyperLink ID="Preview" runat="server" 
        NavigateUrl="~/Admin/Phase1/PreviewSurvey.aspx">已設定資料</asp:HyperLink>
   <br />
   <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Label ID="Label2" runat="server" Text="請上傳.csv檔案"></asp:Label>
    <br>
    <asp:Button ID="UploadButton" runat="server"
        Text="檔案上傳" onclick="Button1_Click" /><asp:Label ID="MsgLabel" runat="server"></asp:Label>
    <br />
    <asp:Button ID="SurveyImport" runat="server" Text="資料匯入" Visible="False" 
        onclick="SurveyImport_Click" /><asp:Label ID="MsgLabel2" runat="server"></asp:Label>
    <br />
    <asp:Button ID="PreviewLink" runat="server" Text="預覽習作"
        Visible="true" PostBackUrl="~/Admin/PreviewSurvey.aspx"></asp:Button>
     <div style="text-align:center">
        <br />
    </div>
</asp:Content>