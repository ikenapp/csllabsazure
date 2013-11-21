<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiscussionAPreview.aspx.cs" Inherits="Exercise_Phase2_DiscussionAPreview" %>


<!DOCTYPE html>
<html >
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title></title>
<meta name='keywords' content='' />
<meta name='description' content='' />
<link href='../../Discussion/default.css' rel='stylesheet' type='text/css' media='all' />
<link href='../../Discussion/fonts.css' rel='stylesheet' type='text/css' media='all' />
<script type="text/javascript" src="../../Discussion/jquery-1.10.2.min.js"></script>  
<!--[if IE 6]><link href='default_ie6.css' rel='stylesheet' type='text/css' /><![endif]-->
   
     <script type="text/javascript">
         function openNewWin(){
             window.open('Phase1Preview.aspx', '上一階段我的作答', config = 'height=840,width=440')

         }

    </script>
</head>
<body class='fb'>
    <form id='form1' runat='server'>
<div style="margin:0;">
    <div><a href='../Default.aspx' style='color:white;'>回首頁</a>&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="問題一我的作答" />  <asp:Button ID="Button3" runat="server" Text="問題二我的作答"  /> 
</div>
     <asp:ScriptManager ID='ScriptManager1' runat='server'></asp:ScriptManager>
	<div id='header' class='container'>
<br>
		<div id='logo'>
		  <h3><asp:Label ID='TitleLabel' runat='server' Text='Label'></asp:Label>
          </h3>
			
		</div>
	</div>
</div>
         <asp:UpdatePanel ID='UpdatePanel1' runat='server'>
            <ContentTemplate> 
                <asp:HiddenField ID="HiddenField1" runat="server" Value="1" />
<div id='wrapper'>
  <div id='page' class='container' style='vertical-align:top;padding: 0 auto;'>
    <div align='left' >
      <table width='1184' border='0' rules='cols' valign='top'>
        <tr>
          <th width='86' valign='top' scope='col'><div id='sidebar'>
            <span style='float:right;color:red;font-weight: 600;' id='countdownE'></span><br>
            <h2 align='left'>本組組員:</h2>
            <p align='left'><asp:Label ID='GroupInfo' runat='server' Text='Label' Font-Bold='True'></asp:Label>
              </p>
          </div></th>
         
          <th width='967' align='right' valign='top' scope='col'>
          <div id='content' align='left'>
           
           <table border='0' width=967>
  <tr>
    <td width='990px' class='all'><div id='type' align='left' class='fb'>在想些什麼 :
        <asp:TextBox ID='TextBox1' runat='server' Width='675px' Enabled="false"></asp:TextBox>
        </div>
        <asp:Button ID='Button1' runat='server' Text='發言' Enabled="false" />
      </td>
  </tr>
</table>
             
<div style='overflow-y:auto;min-height:400px;height:600px;width:980px;overflow-style:move;overflow-x:hidden;'>
    <!-- Main block -->
    <asp:Literal ID='Literal1' runat='server' Visible="true" ></asp:Literal>

    <%--
     <div id="reply" class="reply2" align="left" style="display:none;border:1px solid #ccc;">
             <table width="600"border="0">
               <tr>
                 <th width="600" scope="col">
                  <table width="600" border="0" align="left">
                   <tr>
                     <td>
                     <div id="reply-cont" class="" align="left">
                         <input type="text" id="comment" style="width:500px;"/><input type="button" id="commentBTN" value="儲存" />
                     </div>
                     </td>
                   </tr>
                 </table></th>
               </tr>
             
             </table>
           </div>
    
                    <asp:GridView ID='GridView1' runat='server' AutoGenerateColumns='False'  Width='100%' ShowHeader='False' OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText='topic' SortExpression='topic'>
                                <EditItemTemplate>
                                    <asp:TextBox ID='TextBox2' runat='server' Text='<%# Bind("topic") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <div class='post' align='left'>
             <table width='977' border='0' >
               <tr valign='top'>
                 <th width='90' height='80'  scope='col'><img src='icon.jpg' width='85' height='75'/></th>
                 <th width='850' scope='col'  align='left'>
                 <table  border='0'>
                   <tr>
                     <th width='856' scope='col'>
                     <div class='fbpost-name' align='left' >
                     <asp:Literal ID="Literal2" runat="server" Text='<%# Bind("nickname") %>' ></asp:Literal>
                     </div>
                     </th>
                   </tr>
                   <tr>
                    <td>
                     <div class='fbpost-cont' align='left' >
                     <asp:Literal ID="Literal3" runat="server" Text='<%# Bind("topic") %>' ></asp:Literal>
                         <asp:HiddenField ID="SID" runat="server" value='<%# Bind("disid") %>' ></asp:HiddenField>
                     </td>
                   </tr>
                   <tr>
                     <td>
                     <div  align='left' class='fb'>
                     <asp:Literal ID="Literal5" runat="server" Text='<%# Bind("selflikes") %>' ></asp:Literal> <img src='like.png' height='20' width='20'> <span class='display'><asp:Literal ID="Literal7" runat="server" Text='<%# Bind("likes") %>' ></asp:Literal></span>&nbsp;&nbsp;&nbsp;
                     <asp:Literal ID="Literal6" runat="server" Text='<%# Bind("selfquestions") %>' ></asp:Literal> <img src='question.png' height='16' width='16'> <span class='display'><asp:Literal ID="Literal8" runat="server" Text='<%# Bind("questions") %>' ></asp:Literal></span>&nbsp;&nbsp;&nbsp;<asp:Label ID='Label2' runat='server' Text='<%# Bind("time","{0:tt hh:mm:ss}") %>' Font-Bold='True'></asp:Label>
                     <p>&nbsp;</p>
                     </td>
                   </tr>
                 </table>
                 </th>
               </tr>
               </table>
           </div>
                                    <!--feedbacks
                                    <div class='reply' align='left'><table width='560'border='0'>
                                        <asp:Literal ID="Feedback" runat="server" ></asp:Literal>
                                        </table></div>-->
                                    <div id="reply<%# Container.DataItemIndex %>" class='reply' align='left'>
                                     <asp:GridView ID='GridView2' runat='server' AutoGenerateColumns='False'  Width='100%' ShowHeader='False'>
                        <Columns>
                            <asp:TemplateField HeaderText='topic' SortExpression='topic'>
                                <EditItemTemplate>
                                    <asp:TextBox ID='TextBox3' runat='server' Text='<%# Bind("topic") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <tr>
                 <th width='90' scope='col' valign='top'><p><img src='icon.jpg' width='80' height='70'/>
                   <p>&nbsp;</p></th>
                 <th width='560' scope='col'><table width='560' border='0' align='left'>
                   <tr >
                     <th scope='col'>
                     <div class='reply-name' align='left' ><asp:Literal ID="Literal4" runat="server" Text='<%# Bind("nickname") %>' ></asp:Literal></div>
                     </th>
                   </tr>
                   <tr>
                     <td>
                     <div class='reply-cont' align='left' ><asp:Literal ID="Literal9" runat="server" Text='<%# Bind("topic") %>' ></asp:Literal></div>
                     </td>
                   </tr>
                   <tr>
                      <td align='left'><asp:Literal ID='Label1' runat='server' Text='<%# Bind("time","{0:tt hh:mm:ss}") %>' ></asp:Literal>&nbsp;&nbsp;&nbsp 
                      <asp:Literal ID="Literal10" runat="server" Text='<%# Bind("selflikes") %>' ></asp:Literal> <img src='like.png' height='20' width='20'> <span class='display'><asp:Literal ID="Literal11" runat="server" Text='<%# Bind("likes") %>' ></asp:Literal></span>&nbsp;&nbsp;&nbsp;
                     <asp:Literal ID="Literal12" runat="server" Text='<%# Bind("selfquestions") %>' ></asp:Literal> <img src='question.png' height='16' width='16'> <span class='display'><asp:Literal ID="Literal13" runat="server" Text='<%# Bind("questions") %>' ></asp:Literal></span>&nbsp;&nbsp;&nbsp;
                     </td></tr>
                 </table></th>
               </tr>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                        </Columns>
                    </asp:GridView>

</div>
                                    <!--End FB -->
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                        </Columns>
                    </asp:GridView>

                     <asp:Timer ID='Timer1' runat='server' Interval='30000'>
                    </asp:Timer>
      --%>
                     </ContentTemplate>
        </asp:UpdatePanel>
      
           </div>
            
          </div></th>
        </tr>
      </table>
    </div>
  </div>
</div>
<div id='copyright' class='container'>
</div>
    <div style='width:100%;height:20px;text-align:center;background:black;vertical-align:bottom'>
                <small style='color:white;font-size:12px'>資元科技顧問有限公司 版權所有 © 2013 BIT Tech. All Rights Reserved.</small>
            </div>
    </form>
</body>
</html>

  
