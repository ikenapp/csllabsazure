﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DiscussionD2.aspx.cs" Inherits="Discussion_DiscussioD2" %>

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

</style>
    <script type="text/javascript">
        function openNewWin(){
            window.open('DiscussionDPreview.aspx', '第一部分看法', config='height=840,width=44<asp:Literal runat="server"></asp:Literal>0')

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
        <a href="javascript:void" class="previewparta1" onclick="openNewWin()" >
            檢視上一頁輸入
        </a>
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
                SelectCommand="SELECT * FROM [Questions] WHERE (([survryid] = @survryid) AND ([no] &gt; @no)) ORDER BY [no]">
                <SelectParameters>
                    <asp:QueryStringParameter Name="survryid" QueryStringField="surveyid" 
                        Type="Int32" />
                    <asp:QueryStringParameter Name="no" QueryStringField="minid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
           
        </div>
        <br />
    </span> 
            </ContentTemplate>
        </asp:UpdatePanel>
    <div style="text-align:center;width:100%">
            <asp:Button ID="SaveAll" runat="server" Text="全部儲存" CssClass="centerBTN" OnClick="SaveAll_Click" />
            </div>
           <br>
     <div style="width:100%;height:20px;text-align:center;background:black;vertical-align:bottom">
                <small style="color:white;font-size:12px">資元科技顧問有限公司 版權所有 © 2013 BIT Tech. All Rights Reserved.</small>
            </div>
          <script type="text/javascript" language="javascript">
              if(<%= "'"+isShow+"'" %> == 'True'){
                  alert('<%= message %>');
              }
              </script>
</asp:Content>

