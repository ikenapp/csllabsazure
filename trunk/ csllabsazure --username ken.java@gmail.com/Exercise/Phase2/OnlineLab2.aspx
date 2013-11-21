<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OnlineLab2.aspx.cs" Inherits="Execise2_OnlineLab2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    #myheader td
    {
        border : 0px;
    }
    .center
    {
        border : 0px;
        text-align : center;
    }
    .centerBTN
    {
        border: 1px solid #CCC;
        width: 180px;
        height:80px;
        font-size : 18px;
        background : pink;
    }
    .optionPanel
    {
        width:900px;
        min-height:450px;
        max-height:100%;
        border: 1px solid #ccc;
        padding:20px;
        background : #eee;
     }
     .myarea
     {
        padding:20px
     }
     
     .focusView
     {
         color:blue; 
         font-weight :bold;  
     }
        h3
        {
            color:black;
        }
</style>
   <script type="text/javascript">
       function openNewWinA(){
           openNewWindow('DiscussionAPreview.aspx', '前一堂課我的作答結果')
           //window.open('DiscussionAPreview.aspx','討論內容', config='height=840,width=980,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');

       }
       function openNewWinB(){
           openNewWindow('DiscussionBPreview.aspx', '前一堂課我的作答結果')

       }
       function openNewWinC(){
           window.open('DiscussionCPreview.aspx', '前一堂課我的作答結果', config='height=840,width=400,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');

       }
       function openNewWinD(){
           window.open('DiscussionDPreview.aspx', '前一堂課我的作答結果', config='height=840,width=400,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');

       }
       function openNewWindow(url,title){
           window.open(url,title, config='height=840,width=980,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
       }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
                 </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
             <div style="width:100%;">
             <span style="width:300px">
             <div id="opinonsPanel">
             </div>
             </span>
    <span style="text-align:left;width:680px;">
        <asp:HyperLink ID="BackLink" runat="server">返回上一頁</asp:HyperLink>
        <br />
        <asp:Label ID="LabInfo" runat="server" CssClass="login" Text="Label"></asp:Label>
             <h3><asp:Label ID="Part2Title" runat="server" CssClass="login" Text="Label"></asp:Label></h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="sid" DataSourceID="SqlDataSource1" 
                ForeColor="#333333" GridLines="None" ShowHeader="False" Width="600px" 
                onrowcommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="question" SortExpression="question">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("question") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate><%--
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("no") %>'></asp:Label>--%>
                            <div class="myarea">
                            <%# Container.DataItemIndex + 1 %>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("question") %>'></asp:Label>
                            <asp:HiddenField ID="qid" runat="server" Value='<%# Bind("sid") %>' />
                            <br />
                          
                            <asp:TextBox ID="Answer" runat="server" Height="100px" Width="800px" TextMode="MultiLine" ></asp:TextBox>
                            <asp:Button ID="RowSave" runat="server" Text="儲存"  CommandName="ROW_SAVE" 
      CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                <asp:Label ID="MsgLabel" runat="server" CssClass="failureNotification"></asp:Label>
                            <br />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                SelectCommand="SELECT * FROM [Questions] WHERE (([survryid] = @survryid) AND ([no] >200)) ORDER BY [no]">
                <SelectParameters>
                    <asp:QueryStringParameter Name="survryid" QueryStringField="surveyid" 
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
           
        </div>
        <br />
    </span> 
            </ContentTemplate>
        </asp:UpdatePanel>
    <div style="text-align:center;width:100%">
            <asp:Button ID="SaveAll" runat="server" Text="前往學習成效自評>>" CssClass="centerBTN" OnClick="SaveAll_Click" />
            </div>
           <br>
          <script type="text/javascript" language="javascript">
              if(<%= "'"+isShow+"'" %> == 'True'){
                  alert('<%= message %>');
              }
              </script>
</asp:Content>

