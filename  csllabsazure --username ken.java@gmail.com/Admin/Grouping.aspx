<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Grouping.aspx.cs" Inherits="Admin_Grouping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;&nbsp;<asp:HyperLink ID="BackLink" runat="server">返回上一頁</asp:HyperLink><br>
    <div style="text-align:center">
        <asp:Label ID="LabInfo" runat="server" Text="Label" CssClass="login"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="sid" DataSourceID="SqlDataSource1" Width="900px" 
            CellPadding="4" GridLines="None" AllowPaging="True" 
            PageSize="20" ForeColor="#333333" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" EditText="修改" ShowEditButton="True" />
                <asp:BoundField DataField="school" HeaderText="學校" SortExpression="school" 
                    ReadOnly="True" />
                <asp:BoundField DataField="dept" HeaderText="科系" SortExpression="dept" 
                    ReadOnly="True" />
                <asp:BoundField DataField="student_id" HeaderText="學號" 
                    SortExpression="student_id" ReadOnly="True" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" 
                    ReadOnly="True" />
                <asp:BoundField DataField="gender" HeaderText="性別" SortExpression="gender" />
                <asp:BoundField DataField="nickname" HeaderText="暱稱" 
                    SortExpression="nickname" ReadOnly="True" />
                <asp:BoundField DataField="passsword" HeaderText="密碼" 
                    SortExpression="passsword" ReadOnly="True" />
                <asp:BoundField DataField="birthday" HeaderText="生日" 
                    SortExpression="birthday" DataFormatString="{0:yyyy-MM-dd}" 
                    ReadOnly="True" />
                <asp:BoundField DataField="age" HeaderText="年紀" SortExpression="age" 
                    ReadOnly="True" />
                <asp:TemplateField HeaderText="組別" SortExpression="group">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("group") %>' 
                            Width="50px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("group") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="組別編號" SortExpression="groupid">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("groupid") %>' 
                            Width="50px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("groupid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
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
            DeleteCommand="DELETE FROM [Users] WHERE [sid] = @sid" 
            InsertCommand="INSERT INTO [Users] ([name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (@name, @nickname, @passsword, @birthday, @age, @group, @school, @dept, @labid, @student_id, @groupid, @gender)" 
            SelectCommand="SELECT * FROM [Users] WHERE [labid] = @labid and [group] != 'admin' ORDER BY [group], [groupid]" 
            UpdateCommand="UPDATE [Users] SET  [group] = @group, [groupid] = @groupid, [gender] = @gender WHERE [sid] = @sid">
            <DeleteParameters>
                <asp:Parameter Name="sid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="nickname" Type="String" />
                <asp:Parameter Name="passsword" Type="String" />
                <asp:Parameter DbType="Date" Name="birthday" />
                <asp:Parameter Name="age" Type="Int32" />
                <asp:Parameter Name="group" Type="String" />
                <asp:Parameter Name="school" Type="String" />
                <asp:Parameter Name="dept" Type="String" />
                <asp:Parameter Name="labid" Type="Int32" />
                <asp:Parameter Name="student_id" Type="String" />
                <asp:Parameter Name="groupid" Type="Int32" />
                <asp:Parameter Name="gender" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="labid" QueryStringField="labid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="group" Type="String" />
                <asp:Parameter Name="groupid" Type="Int32" />
                <asp:Parameter Name="gender" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>
</asp:Content>

