<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Discussion_Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="sid" HeaderText="sid" InsertVisible="False" ReadOnly="True" SortExpression="sid" />
                <asp:BoundField DataField="labid" HeaderText="labid" SortExpression="labid" />
                <asp:BoundField DataField="groupid" HeaderText="groupid" SortExpression="groupid" />
                <asp:BoundField DataField="topic" HeaderText="topic" SortExpression="topic" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
                <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LabsDBConnectionString %>" SelectCommand="SELECT * FROM [DiscussionB] where labid=2 and student_id=215"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
