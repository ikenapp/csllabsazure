<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="DiscussionA.aspx.cs" Inherits="Discussion_DiscussionA" %>

<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
<script type="text/javascript">
    var minutes, seconds, seconds_left = <%= timeLeft%>;
    var refreshIntervalId = null;
    var countdownE = null;
    window.onload = function (){
        countdownE = document.getElementById("countdownE"); 
        refreshIntervalId = setInterval(intervalFun, 1000);
    }
    function intervalFun() {
        minutes = parseInt(seconds_left / 60);
        seconds = parseInt(seconds_left % 60);
        countdownE.innerHTML = "剩餘時間 : "+((minutes < 10) ? "0" : "") + minutes + " : " + ((seconds < 10) ? "0" : "") + seconds;
        if (seconds_left == 0) {
            clearInterval(refreshIntervalId);
            alert("時間到!!")
        }
        seconds_left--;
              
    }

</script>
</head>
<body class="fb">
    <form id="form1" runat="server">
<div>
	<div id="header" class="container">
        <a href="../Default.aspx" style="color:white;">回首頁</a>
		<div id="logo">
		  <h1>問題: <asp:Label ID="TitleLabel" runat="server" Text="Label"></asp:Label>
          </h1>
			<span style="float:right;color:red;font-weight: 600;" id="countdownE"></span>
		</div>
	</div>
</div>
<div id="wrapper">
  <div id="page" class="container" style="vertical-align:top;padding: 0 auto;">
    <div align="left" >
      <table width="1184" border="0" rules="cols" valign="top">
        <tr>
          <th width="176" valign="top" scope="col"><div id="sidebar">
            <h2 align="left">本組組員:</h2>
            <p align="left"><asp:Label ID="GroupInfo" runat="server" Text="Label" Font-Bold="True"></asp:Label>
              </p>
          </div></th>
         
          <th width="967" align="right" valign="top" scope="col">
          <div id="content" align="left">
           
           <table border="0" width=967>
  <tr>
    <td width="990px" class="all"><div id="type" align="left" class="fb">在想些什麼 :
        <asp:TextBox ID="TextBox1" runat="server" Width="675px" ></asp:TextBox>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="發言" />
      </td>
  </tr>
</table>
<div style="overflow-y:auto;min-height:400px;height:600px;width:980px;overflow-style:move;overflow-x:hidden;">
    <!-- Main block -->
           <div class="post" align="left">
             <table width="977" border="0" >
               <tr valign="top">
                 <th width="90" height="80"  scope="col"><img src="icon.jpg" width="85" height="75"/></th>
                 <th width="850" scope="col"  align="left">
                 <table  border="0">
                   <tr>
                     <th width="856" scope="col">
                     <div class="fbpost-name" align="left" >
                     diamond Hung
                     </div>
                     </th>
                   </tr>
                   <tr>
                     <td>
                     <div class="fbpost-cont" align="left" >
                     內容
                     內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內</div>
                     </td>
                   </tr>
                   <tr>
                     <td>
                     <div id="Div1" align="left" class="fb">
                     <a href="#">讚</a> <img src="like.png" height="20" width="20"> <span class="display">0</span>  <a href="#">質疑</a> <img src="question.png" height="16" width="16"> <span class="display">0</span>  <a href="#">留言</a> 時間</div>
                     <p>&nbsp;</p>
                     </td>
                   </tr>
                 </table>
                 </th>
               </tr>
               </table>
            
           </div>
           
           
           
          <div class="reply" align="left">
             <table width="560"border="0">
                 <!-- Feedback -->
               <tr>
                 <th width="90" scope="col" valign="top"><p><img src="icon.jpg" width="80" height="70"/>
                   <p>&nbsp;</p></th>
                 <th width="560" scope="col"><table width="560" border="0" align="left">
                   <tr >
                     <th scope="col">
                     <div class="reply-name" align="left" >Mike</div>
                     </th>
                   </tr>
                   <tr>
                     <td>
                     <div class="reply-cont" align="left" >討論內容容
                     </td>
                   </tr>
                   <tr>
                     <td align="left">時間. <a href="#">讚</a> <img src="like.png" height="20" width="20"> <span class="display">0</span>  <a href="#">質疑</a> <img src="question.png" height="16" width="16">  <span class="display">0</span></td>
                   </tr>
                 </table></th>
               </tr>
               <!-- feedback end -->
                 <tr>
                 <th width="90" scope="col" valign="top"><p><img src="icon.jpg" width="80" height="70"/>
                   <p>&nbsp;</p></th>
                 <th width="560" scope="col"><table width="560" border="0" align="left">
                   <tr >
                     <th scope="col">
                     <div class="reply-name" align="left" >Ken</div>
                     </th>
                   </tr>
                   <tr>
                     <td>
                     <div class="reply-cont" align="left" >討論內容容
                     內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內</div>
                     </td>
                   </tr>
                   <tr>
                     <td align="left">時間. <a href="#">讚</a> <img src="like.png" height="20" width="20"> <span class="display">0</span> <a href="#">質疑</a> <img src="question.png" height="16" width="16"> <span class="display">0</span> </td>
                   </tr>
                 </table></th>
               </tr>


             </table>

           </div>

             <!-- Main block  end-->   
                
           </div>
            
          </div></th>
        </tr>
      </table>
    </div>
  </div>
</div>
<div id="copyright" class="container">
</div>
    <div style="width:100%;height:20px;text-align:center;background:black;vertical-align:bottom">
                <small style="color:white;font-size:12px">資元科技顧問有限公司 版權所有 © 2013 BIT Tech. All Rights Reserved.</small>
            </div>
    </form>
</body>
</html>

