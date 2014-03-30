﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SelfEvaluation.aspx.cs" Inherits="Execise_SelfEvaluation" %>


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
      .HIDDEN
        {
            display:none;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <link href="../superTables.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../jquery-1.3.1.js"></script>
    <script type="text/javascript" src="../superTables.js"></script>
    <script type="text/javascript" src="../jquery.superTable.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#<%=GridView1.ClientID%>").toSuperTable({ width: "980px", height: "480px",cssSkin: "sDefault",fixedCols: 1  });
        });
    </script>
    <style>
        .sDefault {
	margin: 0px;
	padding: 0px;
	border: none;
	font-family: Verdana, Arial, sans serif;
	font-size: 1.1em; 
}
    </style>
    <asp:Literal ID="LabInfo" runat="server" Text="Label"></asp:Literal><br>
    <div style="width:100%;">
     
    <%--<h3><asp:Label ID="Tiele" runat="server" Text="第一部分:"></asp:Label></h3>--%>
    <h2><asp:Label ID="desc" runat="server" Text="Label"></asp:Label></h2>
     <div style="text-align:left;padding-left:-30px">
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
                    <asp:TemplateField ItemStyle-Width="400px" HeaderText="題目" 
                        SortExpression="question">
                        <ItemTemplate >
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("question") %>'></asp:Label>
                           <asp:Label ID="questionid" runat="server" Text='<%# Bind("sid") %>' CssClass="HIDDEN"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("question") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:RadioButton ID="RadioButton5" runat="server" CausesValidation="False" GroupName="Values" Text="5" />
                        </ItemTemplate>
                        <HeaderTemplate>
                            非<br>常<br>同<br>意
                        </HeaderTemplate>
                   
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:RadioButton ID="RadioButton4" runat="server" CausesValidation="False" GroupName="Values" Text="4" />
                        </ItemTemplate>
                        <HeaderTemplate>
                           部<br>分<br>同<br>意
                        </HeaderTemplate>
                       
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:RadioButton ID="RadioButton3" runat="server" CausesValidation="False" GroupName="Values" Text="3" />
                        </ItemTemplate>
                        <HeaderTemplate>
                            普<br>通
                        </HeaderTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:RadioButton ID="RadioButton2" runat="server" CausesValidation="False" GroupName="Values" Text="2" />
                        </ItemTemplate>
                        <HeaderTemplate>
                            部<br>分<br>不<br>同<br>意
                        </HeaderTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:RadioButton ID="RadioButton1" runat="server" CausesValidation="False" GroupName="Values" Text="1" />
                        </ItemTemplate>
                        <HeaderTemplate>
                            非<br>常<br>不<br>同<br>意
                        </HeaderTemplate>
                       
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
        完成作答後，請記得：在學習平台儲存您的答案。謝謝您！
        <br /><br />
        <div style="text-align:center;width:100%">
        <asp:Button ID="NextButton" runat="server" Text="儲存" CssClass="Next" OnClientClick="return check();"
            onclick="NextButton_Click" /></div>
    </div><br />
    <script type="text/javascript" language="javascript">
        array = '<%= Session["SelfEval"]%>';
        $(document).ready(function () {
            gridviewScroll();
           <% if(!Page.IsPostBack){%>
           //alert(array)
           array = eval(array);
           for(i = 0; i<array.length;i++){
               var fieldName = "MainContent_GridView1_RadioButton"+array[i]+"_"+i;
               //console.log(fieldName)
               $('input:radio[id="'+fieldName+'"]').attr('checked', true);
           }
           <%}%>
       });
	
	
        function gridviewScroll() {
            if(<%= "'"+isShow+"'" %> == 'True'){
                alert('<%= message %>');
            }
        }
        function check(){
            ret = true;
            len = $('.HIDDEN').length;
            //alert(len/2);
            msg = "";
            for(i = 0; i<len/2;i++){
                k = i+2;
                if(i<8){
                    k = "0"+k;
                }
                key = "ctl00$MainContent$GridView1$ctl"+k+"$Values";
                //console.log(key+":"+$('input[name='+key+']:checked').val());
                //console.log(key+":"+$('input[name='+key+']:checked')[0].checked);
                if(typeof($('input[name='+key+']:checked').val())=="undefined"){
                    msg += (i+1)+","
                    ret = false;
                }
                
            }
            if(!ret){
                alert("題號 : " + msg + " 請記得填寫!");
            }
            return ret;
        }
</script>
</asp:Content>
