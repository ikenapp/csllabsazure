<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SelfEvaluation2.aspx.cs" Inherits="Exercise_Phase2_SelfEvaluation2" %>

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
   
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="LabInfo" runat="server" CssClass="login title" Text="Label"></asp:Label>
   <div style="width:100%;">
     
    <h4><asp:Label ID="Tiele" runat="server" Text="第二部分:"></asp:Label></h4>
    <h4><asp:Label ID="desc" runat="server" Text="Label"></asp:Label></h4>
     <div style="text-align:left">    
         <asp:GridView ID="GridView1" runat="server" 
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sid" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                PageSize="20" Width="900px" Font-Size="14px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <%--<asp:BoundField DataField="no" HeaderText="題號" 
                        ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%" SortExpression="no">
<ItemStyle HorizontalAlign="Center" Width="8%"></ItemStyle>
                    </asp:BoundField>--%>
                    <asp:TemplateField HeaderText="題號">
         <ItemTemplate>
               <%# Container.DataItemIndex + 1 %>
         </ItemTemplate>
     </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="35%" HeaderText="題目" 
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
                                <asp:ListItem>6</asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <table class="myheader">
                                <tr>
                                    <td>
                                        不曾</td>
                                    <td>
                                        幾乎不曾</td>
                                    <td>
                                        很少</td>
                                    <td>
                                        有時候</td>
                                    <td>
                                        常常</td>
                                    <td>
                                        總是</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemStyle Width="35%" />
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
            SelectCommand="SELECT * FROM [Questions] WHERE [survryid] = @survryid and [no] >200  and [no] <300 ORDER BY [no]">
            <SelectParameters>
                <asp:QueryStringParameter Name="survryid" QueryStringField="surveyid" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <div style="text-align:center;width:100%">
        <asp:Button ID="FinishButton" runat="server" Text="第三部分 >>" CssClass="Next" 
            onclick="FinishButton_Click"/>
            </div>
    </div>
    <script type="text/javascript" language="javascript">
        window.onload = function(){
            if(<%= "'"+isShow+"'" %> == 'True'){
                alert('<%= message %>');
            }
        }
</script>
</asp:Content>
