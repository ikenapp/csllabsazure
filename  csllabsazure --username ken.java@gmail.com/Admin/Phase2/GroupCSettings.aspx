<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GroupCSettings.aspx.cs" Inherits="Admin_GroupCSettings" %>

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
   &nbsp;&nbsp;Group C 線上習作題目匯入
    
    <asp:HyperLink ID="Preview" runat="server" 
        NavigateUrl="~/Admin/Phase2/PreviewSurveyC.aspx">已設定資料</asp:HyperLink>
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
        Visible="true" PostBackUrl="~/Admin/Phase2/PreviewSurveyC.aspx"></asp:Button>
     <div style="text-align:center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="sid" Width="900px" Visible="false"
            CellPadding="4" GridLines="None" AllowPaging="True" 
            PageSize="20" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="sid" HeaderText="sid" SortExpression="sid" 
                    InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="question" HeaderText="question" 
                    SortExpression="question" />
                <asp:BoundField DataField="survryid" HeaderText="survryid" 
                    SortExpression="survryid" />
                <asp:BoundField DataField="no" HeaderText="no" SortExpression="no" />
                
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:LabsDBConnectionString %>" 
             SelectCommand="SELECT * FROM [Questions] WHERE ([survryid] = @survryid) ORDER BY [no]">
             <SelectParameters>
                 <asp:QueryStringParameter Name="survryid" QueryStringField="surveyid" 
                     Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource>
        <br />
    </div>
</asp:Content>

