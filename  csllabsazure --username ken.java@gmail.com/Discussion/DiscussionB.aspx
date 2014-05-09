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
                //alert('時間到!!')
            }
            seconds_left--;
               

        }

    </script>
    <script type="text/javascript">
        function openNewWin(){
            window.open('Phase1Preview.aspx', '觀看前一週的作答結果', config='height=840,width=440,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')

        }

        function openTasks(url){
            window.open(url, '討論活動', config='height=400,width=440,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')

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
                <td colspan="5" ><div class="skypebg"><asp:Button ID="backHome" runat="server" Text="回首頁" PostBackUrl="~/Default.aspx" />&nbsp;<asp:Button ID="viewPreResult" runat="server" Text="觀看前一週的作答結果" OnClientClick="openNewWin();return false;" />
        <asp:Button ID="Button2" runat="server" Text="問題一" OnClick="Button2_Click" Visible="false" />  <asp:Button ID="Button3" runat="server" Text="續做問題二" OnClick="Button3_Click" /> <b style="color:red">首先請與您的小組同學確定發言討論的順序，接著進行以下兩段習作討論，請注意討論應控制在70分鐘內完成喔。</b></div></td>
                <td colspan="1">
                </td>
                </tr>
    <tr>
        <td width="100" rowspan="3" valign="top">
            <div id="conlist" align="right">
                <span style='float: right; color: red; padding-right: 10px;' id='countdownE'></span><br />
                <div id="post-name">
                    我是:<asp:Literal ID="Literal1" runat="server"></asp:Literal>
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
        <th height="30" colspan="3" scope="col" valign="top">
            <div id="question" align="left">
                <asp:Label ID='TitleLabel' runat='server' Text='Label'></asp:Label><button onclick="openTasks('SkypeTask<%=no %>.aspx')" >
            討論活動</button>
            </div>
            <table>
                <tr align="left">
                    <td colspan="3">
                        <div style="height: 480px; overflow-x: hidden; overflow-y: auto;vertical-align:top; margin-top:0;" id="mydiv">
                            <asp:UpdatePanel ID='UpdatePanel1' runat='server'>
                                <ContentTemplate>
                                     <asp:HiddenField ID="HiddenField1" runat="server" Value="1" />
                                    <asp:GridView ID='GridView1' runat='server' AutoGenerateColumns='False' Width='900px' ShowHeader='False'>
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

                                    <asp:Timer ID='Timer1' runat='server' Interval='120000'>
                                    </asp:Timer>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                </tr>
                <tr>
                    <td width="10" height="50">&nbsp;</td>
                    <td width="750" valign="top">
                        <div id="type1">
                            &nbsp;發送訊息<br />
                            <asp:TextBox ID='TextBox1' runat='server' CssClass='ta' TextMode='MultiLine' Height="98px" Width="780px"></asp:TextBox>
                        </div>
                    </td>
                    <td width="159" valign="top">
                        <asp:ImageButton ID="Button1" runat="server" Width="53" Height="24" ImageUrl="images/send.png" OnClick="Button1_Click" /></td>
                </tr>
                </table>
        </th>
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
<script>
    var objDiv = document.getElementById("mydiv");
    objDiv.scrollTop = objDiv.scrollHeight;
</script>