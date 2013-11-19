<%@ Page Title='' Language='C#' AutoEventWireup='true' CodeFile='DiscussionA.aspx.cs' Inherits='Discussion_DiscussionA' %>

<!DOCTYPE html>
<html >
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title></title>
<meta name='keywords' content='' />
<meta name='description' content='' />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' />
<link href='default.css' rel='stylesheet' type='text/css' media='all' />
<link href='fonts.css' rel='stylesheet' type='text/css' media='all' />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />  
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>  
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<!--[if IE 6]><link href='default_ie6.css' rel='stylesheet' type='text/css' /><![endif]-->
<script type='text/javascript'>
    var minutes, seconds, seconds_left = <%= timeLeft%>;
    var refreshIntervalId = null;
    var countdownE = null;
    window.onload = function (){
        countdownE = document.getElementById('countdownE'); 
        refreshIntervalId = setInterval(intervalFun, 1000);
    }
    function intervalFun() {
        minutes = parseInt(seconds_left / 60);
        seconds = parseInt(seconds_left % 60);
        countdownE.innerHTML = '剩餘時間 : '+((minutes < 10) ? '0' : '') + minutes + ' : ' + ((seconds < 10) ? '0' : '') + seconds;
        if (seconds_left == 0) {
            clearInterval(refreshIntervalId);
            alert('時間到!!')
        }
        seconds_left--;
              
    }
    function pressLike(obj,url){
        num = obj.innerHTML=="讚"?1:-1;
        obj.innerHTML = obj.innerHTML=="讚"?"收回讚":"讚";
        $.ajax({
            url: "Likes.aspx?feedbackId="+url
        }).done(function() {
            //alert("OK")
        });
        val = $(obj).parent().find("span")[0].innerHTML;
        //alert($(obj).parent()[0].nodeName+" => "+val)
        val = parseInt(val)+num;
        if(val>=0){
            $(obj).parent().find("span")[0].innerHTML = val;
        }

    }

    function pressQuestions(obj,url){
        num = obj.innerHTML=="質疑"?1:-1;
        obj.innerHTML= obj.innerHTML=="質疑"?"不質疑":"質疑";
        $.ajax({
            url: "Questions.aspx?feedbackId="+url
        }).done(function() {
            //alert("OK")
        });
        val = $(obj).parent().find("span")[1].innerHTML;
        //alert($(obj).parent()[0].nodeName+" => "+val)
        val = parseInt(val)+num;
        //alert(num+"+"+val);
        if(val>=0){
            $(obj).parent().find("span")[1].innerHTML = val;
        }

    }

    function pressCommnets(obj,url){
        $.ajax({
            url: "Comments.aspx?feedbackId="+url
        }).done(function() {
            //alert("OK")
        });
        val = $(obj).parent().find("span")[1].innerHTML;
        //alert($(obj).parent()[0].nodeName+" => "+val)
        val = parseInt(val)+num;
        //alert(num+"+"+val);
        if(val>=0){
            $(obj).parent().find("span")[1].innerHTML = val;
        }

    }
</script>
</head>
<body class='fb'>
    <form id='form1' runat='server'>
<div>
	<div id='header' class='container'>
        <a href='../Default.aspx' style='color:white;'>回首頁</a>
		<div id='logo'>
		  <h1>問題: <asp:Label ID='TitleLabel' runat='server' Text='Label'></asp:Label>
          </h1>
			<span style='float:right;color:red;font-weight: 600;' id='countdownE'></span>
		</div>
	</div>
</div>
        
<div id='wrapper'>
  <div id='page' class='container' style='vertical-align:top;padding: 0 auto;'>
    <div align='left' >
      <table width='1184' border='0' rules='cols' valign='top'>
        <tr>
          <th width='176' valign='top' scope='col'><div id='sidebar'>
            <h2 align='left'>本組組員:</h2>
            <p align='left'><asp:Label ID='GroupInfo' runat='server' Text='Label' Font-Bold='True'></asp:Label>
              </p>
          </div></th>
         
          <th width='967' align='right' valign='top' scope='col'>
          <div id='content' align='left'>
           
           <table border='0' width=967>
  <tr>
    <td width='990px' class='all'><div id='type' align='left' class='fb'>在想些什麼 :
        <asp:TextBox ID='TextBox1' runat='server' Width='675px' ></asp:TextBox>
        </div>
        <asp:Button ID='Button1' runat='server' OnClick='Button1_Click' Text='發言' />
      </td>
  </tr>
</table>
              <asp:ScriptManager ID='ScriptManager1' runat='server'></asp:ScriptManager>
<div style='overflow-y:auto;min-height:400px;height:600px;width:980px;overflow-style:move;overflow-x:hidden;'>
    <!-- Main block -->
    <asp:Literal ID='Literal1' runat='server' Visible="false" ></asp:Literal>
     <asp:UpdatePanel ID='UpdatePanel1' runat='server'>
            <ContentTemplate>
                    <asp:GridView ID='GridView1' runat='server' AutoGenerateColumns='False'  Width='100%' ShowHeader='False' OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText='topic' SortExpression='topic'>
                                <EditItemTemplate>
                                    <asp:TextBox ID='TextBox1' runat='server' Text='<%# Bind("topic") %>'></asp:TextBox>
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
                     <a href='javascript:void()' onclick='pressLike(this,"<asp:Literal ID="Literal21" runat="server" Text='<%# Bind("disid") %>' ></asp:Literal>")'><asp:Literal ID="Literal5" runat="server" Text='<%# Bind("selflikes") %>' ></asp:Literal></a> <img src='like.png' height='20' width='20'> <span class='display'><asp:Literal ID="Literal7" runat="server" Text='<%# Bind("likes") %>' ></asp:Literal></span>&nbsp;&nbsp;&nbsp;
                     <a href='javascript:void()' onclick='pressQuestions(this,"<asp:Literal ID="Literal22" runat="server" Text='<%# Bind("disid") %>' ></asp:Literal>")'><asp:Literal ID="Literal6" runat="server" Text='<%# Bind("selfquestions") %>' ></asp:Literal></a> <img src='question.png' height='16' width='16'> <span class='display'><asp:Literal ID="Literal8" runat="server" Text='<%# Bind("questions") %>' ></asp:Literal></span>&nbsp;&nbsp;&nbsp;<a href='javascript:void()' onclick='pressComment(this,"<asp:Literal ID="Literal23" runat="server" Text='<%# Bind("disid") %>' ></asp:Literal>")'>留言</>&nbsp;&nbsp;&nbsp;<asp:Label ID='Label2' runat='server' Text='<%# Bind("time","{0:tt hh:mm:ss}") %>' Font-Bold='True'></asp:Label>
                     <p>&nbsp;</p>
                     </td>
                   </tr>
                 </table>
                 </th>
               </tr>
               </table>
           </div>
                                    <!--feedbacks-->
                                    <div class='reply' align='left'><table width='560'border='0'>
                                        <asp:Literal ID="Feedback" runat="server" ></asp:Literal>
                                        </table></div>

                                </ItemTemplate>
                            </asp:TemplateField>
                           
                        </Columns>
                    </asp:GridView>

                     <asp:Timer ID='Timer1' runat='server' Interval='30000'>
                    </asp:Timer>

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

