<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SelfEvaluation.aspx.cs" Inherits="Execise_SelfEvaluation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
    .myheader td
    {
        border : 0px;
        font-weight :bold;
        font-size : 14px;
        color:White;
    }
    .center
    {
        border : 0px;
        text-align : center;
    }
    .Next
    {
        border: 1px solid #CCC;
        width: 180px;
        height:80px;
        font-size : 18px;
        background : pink;
    }
    .title{
    
        font-weight : bold;
        font-size: 14px;
    }
   
    .mtitle
    {
        font-weight :bold;
        font-size : 16px;
    }
    h2,h3
    {
        color:black;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Literal ID="LabInfo" runat="server" Text="Label"></asp:Literal><br>
    <div style="width:100%;">
     
    <%--<h3><asp:Label ID="Tiele" runat="server" Text="第一部分:"></asp:Label></h3>--%>
    <h2><asp:Label ID="desc" runat="server" Text="Label"></asp:Label></h2>
     <div style="text-align:left">
            <asp:GridView ID="GridView1" runat="server" 
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sid" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                PageSize="20" Width="900px" Font-Size="14px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                   <asp:TemplateField HeaderText="題號">
         <ItemTemplate>
               <%# Container.DataItemIndex + 1 %>
         </ItemTemplate>
     </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30%" HeaderText="題目" 
                        SortExpression="question">
                        <ItemTemplate >
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("question") %>'></asp:Label>
                            <asp:HiddenField ID="questionid" runat="server" Value='<%# Bind("sid") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("question") %>'></asp:TextBox>
                        </EditItemTemplate>

<ItemStyle Width="92%"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="center" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <table class="myheader">
                                <tr>
                                    <td>
                                        非常同意</td>
                                    <td>
                                        部分同意</td>
                                    <td>
                                        普通</td>
                                    <td>
                                        部分不同意</td>
                                    <td>
                                        非常不同意</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemStyle Width="30%" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                    HorizontalAlign="Center" />
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
            SelectCommand="SELECT * FROM [Questions] WHERE [survryid] = @survryid and [no] >100 and [no]<200 ORDER BY [no]">
            <SelectParameters>
                <asp:QueryStringParameter Name="survryid" QueryStringField="surveyid" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <div style="text-align:center;width:100%">
        <asp:Button ID="NextButton" runat="server" Text="完成了!!" CssClass="Next" 
            onclick="NextButton_Click" /></div>
    </div>
    <script type="text/javascript" language="javascript">
        if(<%= "'"+isShow+"'" %> == 'True'){
            alert('<%= message %>');
   }
</script>
</asp:Content>
