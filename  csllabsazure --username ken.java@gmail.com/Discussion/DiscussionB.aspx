<%@ Page Language='C#' AutoEventWireup='true' CodeFile='DiscussionB.aspx.cs' Inherits='Discussion_DiscussionB' %>

<!DOCTYPE html>

<html>
<head runat='server'>
    <title>Discussion B</title>
    <link href="skypedefault.css" rel="stylesheet" type="text/css" media="all" />
    <link href="skypefonts.css" rel="stylesheet" type="text/css" media="all" />
    <style type='text/css'>
        .ta
        {
            overflow: auto;
            margin: 10px auto;
        }
        /*#discussionBoard
        {
            display: block;
            border: 1px solid #ccc;
            width: 850px;
            height: 350px;
            overflow: auto;
            background: white;
        }
        #sendPanel
        {
            display:block;
            border: 1px solid #ccc;
            width:900px;
            height:60px;
            overflow:auto;
            background:white;
            margin: 20px auto;
            padding:20px;
        }
        #title
        {
            display:block;
            border: 1px solid #ccc;
            width:920px;
            height:40px;
            background:white;
            margin: 20px auto;
            padding:10px;
        }
        #mainPanel
        {
            display:inline-block;
        }
        #memberPanel
        {
            border: 1px solid #ccc;
            width: 100%;
            height: 350px;
            
        }
        
        body
        {
            font-size: .80em;
            font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif;
            margin: 10px auto;
            padding: 0px;
        }
        .rightPanel
        {
            width:50%;

            display:inline-block;
            text-align:right;
        }
        .leftPanel
        {
            width:50%;
            display:inline-block;
            float:left;
        }
        .Panel
        {
            width:100%;
            display:block;
            float:left;
        }
        div.disCell:nth-of-type(even)
        {
            background:#ccc;
        }*/
    </style>
    <script type='text/javascript'>
        var minutes, seconds, seconds_left = <%= timeLeft%>
        var countdownE = null;
        var refreshIntervalId = null;

        window.onload = function (){
            countdownE = document.getElementById('countdownE');
            refreshIntervalId = setInterval(intervalFun, 1000);
        };
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

    </script>
    <script type="text/javascript">
        function openNewWin(){
            window.open('Phase1Preview.aspx', '第一階段', config='height=840,width=440')

        }

    </script>
</head>

<%--         <table width='900px' style='border:1px solid #000;padding:10px;margin: 20px auto; background:white;border-radius:20px;box-shadow:20px 20px 20px gray'>
            <tr><td colspan='2'><a href='../Default.aspx'>回首頁</a><div id='title'>
                <asp:Label ID='TitleLabel' runat='server' Text='Label'></asp:Label>
                <span style='float:right;color:red;' id='countdownE'></span></div></td></tr>
            
             <tr><td width='100px'>
        <div id='memberPanel'>
            <asp:Label ID='GroupInfo' runat='server' Text='Label' Font-Bold='True'></asp:Label>
        </div>
                 </td>
                 <td width='800px'>
                <div id='discussionBoard'>
                     
                    <asp:GridView ID='GridView1' runat='server' AutoGenerateColumns='False'  Width='100%' ShowHeader='False'>
                        <Columns>
                            <asp:TemplateField HeaderText='topic' SortExpression='topic'>
                                <EditItemTemplate>
                                    <asp:TextBox ID='TextBox1' runat='server' Text='<%# Bind("topic") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <div style='background:#ccc'>
                                        <span class='leftPanel'>
                                        <asp:Label ID='Label3' runat='server' Text='<%# Bind("nickname") %>' Font-Bold='True'></asp:Label>
                                        </span>
                                        <span class='rightPanel'>
                                         <asp:Label ID='Label2' runat='server' Text='<%# Bind("time","{0:tt hh:mm:ss}") %>' Font-Bold='True'></asp:Label>
                                         </span>
                                         <span class='Panel'>
                                            <asp:Literal ID='Label1' runat='server' Text='<%# Bind("topic") %>'></asp:Literal>
                                         </span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                        </Columns>
                    </asp:GridView>

                   
                </div>
            </div>
          </td>
          </tr>
        <tr><td colspan='2'>
                <div id='sendPanel'>
                    <asp:TextBox ID='TextBox1' runat='server' CssClass='ta' TextMode='MultiLine'></asp:TextBox>
                    <asp:Button ID='Button1' runat='server' Text='訊息送出' OnClick='Button1_Click' />
                </div>
            </td>
          </tr>
    </table>
      
    
</body>--%>

<body class="skype">
    <div id="page" class="container">
        <form id='form1' runat='server'>
            <asp:ScriptManager ID='ScriptManager1' runat='server'>
            </asp:ScriptManager>
            <table align="left" border="0" width="1177" stye="margin:0;">
                 <tr>
                <td colspan="3"><a href='../Default.aspx'>回首頁</a>&nbsp;&nbsp<a href="javascript:void()" onclick="openNewWin()" >
            檢視上一階段輸入
        </a>&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="問題一" OnClick="Button2_Click" />  <asp:Button ID="Button3" runat="server" Text="問題二" OnClick="Button3_Click" /> </td>
                <td colspan="1">
                    <div>
                        <span style='float: right; color: red; padding-right: 10px;' id='countdownE'></span>
                    </div>
                </td>
                </tr>
    <tr>
        <td width="262" rowspan="3" valign="top">
            <div id="conlist" align="left">
                <div id="post-name">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </div>
                <asp:Label ID='GroupInfo' runat='server' Text='Label' Font-Bold='True'></asp:Label>
            </div>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
        </td>
        <th height="50" colspan="3" scope="col">
            <div id="question" align="left">
                <asp:Label ID='TitleLabel' runat='server' Text='Label'></asp:Label>
            </div>
        </th>
    </tr>
                <tr align="right">
                    <td colspan="3">
                        <div style="height: 330px; overflow-x: hidden; overflow-y: auto;vertical-align:top;">
                            <asp:UpdatePanel ID='UpdatePanel1' runat='server'>
                                <ContentTemplate>
                                     <asp:HiddenField ID="HiddenField1" runat="server" Value="1" />
                                    <asp:GridView ID='GridView1' runat='server' AutoGenerateColumns='False' Width='100%' ShowHeader='False'>
                                        <Columns>
                                            <asp:TemplateField HeaderText='topic' SortExpression='topic'>
                                                <AlternatingItemTemplate>
                                                    <table style="background: white; width: 100%">
                                                        <tr align="right">
                                                            <td scope="col" valign="top" width="70px">
                                                                <div class="teamname">
                                                                    <asp:Literal ID='Label3' runat='server' Text='<%# Bind("nickname") %>'></asp:Literal>
                                                                </div>
                                                            </td>
                                                            <td scope="col" valign="top">
                                                                <div class="dislog">
                                                                    <asp:Literal ID='Label1' runat='server' Text='<%# Bind("topic") %>'></asp:Literal>
                                                                </div>
                                                            </td>
                                                            <td scope="col" valign="top" width="70px">
                                                                <div class="time" align="left">
                                                                    <asp:Literal ID='Label2' runat='server' Text='<%# Bind("time","{0:tt hh:mm:ss}") %>'></asp:Literal>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </AlternatingItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID='TextBox1' runat='server' Text='<%# Bind("topic") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <table style="background: #CCC; width: 100%">
                                                        <tr align="right">
                                                            <td scope="col" valign="top" width="70px">
                                                                <div class="teamname">
                                                                    <asp:Literal ID='Label3' runat='server' Text='<%# Bind("nickname") %>'></asp:Literal>
                                                                </div>
                                                            </td>
                                                            <td scope="col" valign="top">
                                                                <div class="dislog">
                                                                    <asp:Literal ID='Label1' runat='server' Text='<%# Bind("topic") %>'></asp:Literal>
                                                                </div>
                                                            </td>
                                                            <td scope="col" valign="top" width="70px">
                                                                <div class="time" align="left">
                                                                    <asp:Literal ID='Label2' runat='server' Text='<%# Bind("time","{0:tt hh:mm:ss}") %>'></asp:Literal>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>

                                    <asp:Timer ID='Timer1' runat='server' Interval='5000'>
                                    </asp:Timer>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                </tr>
                <tr>
                    <td width="132" height="140">&nbsp;</td>
                    <td width="606" valign="top">
                        <div id="type1">
                            &nbsp;發送訊息<br />
                            <asp:TextBox ID='TextBox1' runat='server' CssClass='ta' TextMode='MultiLine' Height="98px" Width="590px"></asp:TextBox>
                        </div>

                       
      <p>&nbsp;</p>
                    </td>
                    <td width="159" valign="top">
                        <asp:ImageButton ID="Button1" runat="server" Width="53" Height="24" ImageUrl="images/send.png" OnClick="Button1_Click" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
    </div>
    <p>&nbsp;</p>
    </form>
         <div style='width: 100%; height: 20px; text-align: center; background: black; vertical-align: bottom'>
             <small style='color: white; font-size: 12px'>資元科技顧問有限公司 版權所有 © 2013 BIT Tech. All Rights Reserved.</small>
         </div>
</body>
</html>
