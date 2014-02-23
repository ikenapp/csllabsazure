<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StatusReport.aspx.cs" Inherits="Admin_StatusReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 &nbsp;&nbsp;<asp:HyperLink ID="BackLink" runat="server">返回上一頁</asp:HyperLink><br>
    <div style="text-align:center">
        <asp:Label ID="LabInfo" runat="server" Text="Label" CssClass="login"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="sid" DataSourceID="SqlDataSource1" Width="900px" 
            CellPadding="4" GridLines="None"  
            PageSize="20" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="school" HeaderText="學校" SortExpression="school" 
                    ReadOnly="True" />
                <asp:BoundField DataField="dept" HeaderText="科系" SortExpression="dept" 
                    ReadOnly="True" />
                <asp:BoundField DataField="student_id" HeaderText="學號" 
                    SortExpression="student_id" ReadOnly="True" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" 
                    ReadOnly="True" />
                 <asp:TemplateField HeaderText="實驗前測" SortExpression="Phase1">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Phase0").ToString() == "True"?"已完成":"X" %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Phase0") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="線上習作-1" SortExpression="Phase1">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Phase1").ToString() == "True"?"已完成":"X" %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Phase1") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="線上自評-1" SortExpression="Phase1E">
                    <ItemTemplate>
                        <asp:Label ID="Label1E" runat="server" Text='<%# Eval("Phase1E").ToString() == "True"?"已完成":"X" %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label1E" runat="server" Text='<%# Eval("Phase1E") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="線上討論-2" SortExpression="Phase21">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Phase21") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Phase21").ToString() == "True"?"已完成":"X" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="線上習作-2" SortExpression="Phase22">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Phase22") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Phase22").ToString() == "True"?"已完成":"X" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="線上自評-2" SortExpression="Phase22E">
                    <EditItemTemplate>
                        <asp:Label ID="Label3E" runat="server" Text='<%# Eval("Phase22E") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3E" runat="server" Text='<%# Eval("Phase22E").ToString() == "True"?"已完成":"X" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="實驗後測" SortExpression="Phase23">
                    <EditItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Phase23") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Phase23").ToString() == "True"?"已完成":"X" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="滿意度" SortExpression="Satisfy">
                    <EditItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Satisfy") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Satisfy").ToString() == "True"?"已完成":"X" %>'></asp:Label>
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
            SelectCommand="select sid ,school,dept,student_id,name,(select s.done from Status As S where s.studentid = u.sid and labid = @labid and phase='Part0') as Phase0 ,(select s.done from Status As S where s.studentid = u.sid and labid = @labid and phase='PartA') as Phase1 ,(select s.done from Status As S where s.studentid = u.sid and labid = @labid and phase='PartAE') as Phase1E ,(select s.done from Status As S where s.studentid = u.sid and labid =  @labid and phase='PartB1') as Phase21 ,(select s.done from Status As S where s.studentid = u.sid and labid =  @labid and phase='PartB2') as Phase22,(select s.done from Status As S where s.studentid = u.sid and labid =  @labid and phase='PartB2E') as Phase22E,(select s.done from Status As S where s.studentid = u.sid and labid =  @labid and phase='Final') as Phase23,(select s.done from Status As S where s.studentid = u.sid and labid = @labid and phase='Satisfy') as Satisfy from Users As U where [group]!='admin' and labid= @labid order by student_id" 
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
            </UpdateParameters>
        </asp:SqlDataSource>
        <link href="superTables.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="jquery-1.3.1.js"></script>
    <script type="text/javascript" src="superTables.js"></script>
    <script type="text/javascript" src="jquery.superTable.js"></script>
        <style>
            .sDefault {
	margin: 0px;
	padding: 0px;
	border: none;
	font-family: Verdana, Arial, sans serif;
	font-size: 1.15em;
}
        </style>
    <script type="text/javascript">
        $(function () {
            $("#<%=GridView1.ClientID%>").toSuperTable({ width: "960px", height: "480px", cssSkin: "sDefault", fixedCols: 4 });
        });
    </script>
        <br />
    </div>
</asp:Content>

