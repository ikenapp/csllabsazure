<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DataImport.aspx.cs" Inherits="Admin_DataImport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
.link{
    background: lightgreen;
    width: 200px;
    height : 50px;
    padding 10px;
    margin: 5px;
    border: 1px solid #999;
    text-decoration: none;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;&nbsp;<asp:HyperLink ID="BackLink" runat="server">返回上一頁</asp:HyperLink><br>
    &nbsp;&nbsp;學生資料匯入<asp:HyperLink ID="Preview" runat="server" 
        NavigateUrl="~/Admin/PreviewSurvey.aspx">已設定資料</asp:HyperLink><br/>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Label ID="Label2" runat="server" Text="請上傳.csv檔案"></asp:Label>
    <br>
    <asp:Button ID="UploadButton" runat="server"
        Text="檔案上傳" onclick="Button1_Click" /><asp:Label ID="MsgLabel" runat="server"></asp:Label>
    <br />
    <asp:Button ID="DataImport" runat="server" Text="資料匯入" Visible="False" 
        onclick="DataImport_Click" /><asp:Label ID="MsgLabel2" runat="server"></asp:Label>
    <br />
    <asp:Button ID="GroupingLink" runat="server" Text="檢視學生組別"
        Visible="true" PostBackUrl="~/Admin/Grouping.aspx"></asp:Button>
     <div style="text-align:center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="sid" DataSourceID="SqlDataSource1" Width="900px" 
            CellPadding="4" GridLines="None" AllowPaging="True" 
            PageSize="20" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="school" HeaderText="學校" SortExpression="school" />
                <asp:BoundField DataField="dept" HeaderText="科系" SortExpression="dept" />
                <asp:BoundField DataField="student_id" HeaderText="學號" 
                    SortExpression="student_id" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:BoundField DataField="gender" HeaderText="性別" SortExpression="gender" />
                <asp:BoundField DataField="nickname" HeaderText="暱稱" 
                    SortExpression="nickname" />
                <asp:BoundField DataField="passsword" HeaderText="密碼" 
                    SortExpression="passsword" />
                <asp:BoundField DataField="birthday" HeaderText="生日" 
                    SortExpression="birthday" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="age" HeaderText="年紀" SortExpression="age" />
                <asp:BoundField DataField="group" HeaderText="組別" SortExpression="group" />
                
                <asp:BoundField DataField="groupid" HeaderText="組別編號" 
                    SortExpression="groupid" />
                
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
            UpdateCommand="UPDATE [Users] SET [name] = @name, [nickname] = @nickname, [passsword] = @passsword, [birthday] = @birthday, [age] = @age, [group] = @group, [school] = @school, [dept] = @dept, [labid] = @labid, [student_id] = @student_id, [groupid] = @groupid, [gender] = @gender WHERE [sid] = @sid">
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
                <asp:Parameter Name="sid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>

</asp:Content>



