<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminSettings.aspx.cs" Inherits="Admin_AdminSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">

       

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Admin/CreateLab.aspx">新增實驗</asp:HyperLink>
       
    
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="sid" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Width="900px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="實驗名稱" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Bind("name") %>'  NavigateUrl='<%# Bind("sid","~/Admin/LabsSettings.aspx?labid={0}") %>'></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle Width="15%" />
            </asp:TemplateField>
            <asp:BoundField DataField="desc" HeaderText="實驗描述" SortExpression="desc"  
                ItemStyle-Width="40%" >
<ItemStyle Width="40%"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="currentPhase" HeaderText="實驗階段" 
                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%"
                 SortExpression="currentPhase" >
<ItemStyle HorizontalAlign="Center" Width="15%"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="begin" DataFormatString="{0:yyyy-MM-dd}" 
                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%"
                HeaderText="開始日期" SortExpression="begin" >
<ItemStyle HorizontalAlign="Center" Width="15%"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="end" DataFormatString="{0:yyyy-MM-dd}" 
                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%"
                HeaderText="結束日期" SortExpression="end" >
<ItemStyle HorizontalAlign="Center" Width="15%"></ItemStyle>
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
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
        onselecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [Labs] where sid !=1 ">
    </asp:SqlDataSource>
    <br />
       
    
</asp:Content>

