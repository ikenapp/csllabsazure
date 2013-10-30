<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PreviewScale.aspx.cs" Inherits="Admin_PreviewScale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 &nbsp;&nbsp;<asp:HyperLink ID="BackLink" runat="server">返回上一頁</asp:HyperLink><br>
 <div style="text-align:center">
        <asp:Label ID="ScaleInfo" runat="server" Text="Label" CssClass="login"></asp:Label>
        <div style="text-align:left">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="sid" DataSourceID="SqlDataSource1" Width="900px" 
            CellPadding="4" GridLines="None" AllowPaging="True" 
            PageSize="20" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="no" HeaderText="題號" SortExpression="no" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField DataField="question" HeaderText="題目" ItemStyle-Width="92%"
                    SortExpression="question" />
                
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        </div>
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

