<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DownloadTemplate.aspx.cs" Inherits="Admin_DownloadTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        Excel範本下載:
        <ul>
            <li>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/UploadTemplate/Students_Temp.csv">學生資料</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UploadTemplate/Survey_Temp.csv">線上習作</asp:HyperLink>
                </li>
            <li>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/UploadTemplate/SelfEval_GroupC_Temp.csv">學習自評</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/UploadTemplate/GroupC_Temp.csv">C組 Q & A</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/UploadTemplate/PostTest_Temp.csv">實驗後測</asp:HyperLink>
            </li>
        </ul>
    </p>
</asp:Content>

