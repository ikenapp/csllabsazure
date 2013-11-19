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
    
</head>
<body class='fb'>
    <form id='form1' runat='server'>
<div>
	<div id='header' class='container'>
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
           
           
            
<div style='overflow-y:auto;min-height:400px;height:600px;width:980px;overflow-style:move;overflow-x:hidden;'>
    <!-- Main block -->
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
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

