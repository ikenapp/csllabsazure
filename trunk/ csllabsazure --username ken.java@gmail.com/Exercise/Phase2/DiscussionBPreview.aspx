<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiscussionBPreview.aspx.cs" Inherits="DiscussionBPreview" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat='server'>
    <title>Discussion B</title>
    <link href="../../Discussion/skypedefault.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../../Discussion/skypefonts.css" rel="stylesheet" type="text/css" media="all" />
    <style type='text/css'>
        .ta
        {
            overflow: auto;
            margin: 10px auto;
        }

    </style>
    
</head>


<body class="skype">
    <div id="page" class="container">
        <form id='form1' runat='server'>
            <asp:ScriptManager ID='ScriptManager1' runat='server'>
            </asp:ScriptManager>
            <table align="left" border="0" width="900" style="margin:0;">
                 <tr>
                <td colspan="5"><div class="skypebgpreview"><asp:Button ID="Button2" runat="server" Text="問題一" />  <asp:Button ID="Button3" runat="server" Text="問題二" /></div></td>
                <td colspan="1">
                </td>
                </tr>
    <tr>
        <td width="80px" rowspan="3" valign="top">
            <div id="conlistpreview" align="right">
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
            <div id="questionpreview" align="left">
                <asp:Label ID='TitleLabel' runat='server' Text='Label'></asp:Label>
            </div>
            <table>
                <tr align="right">
                    <td colspan="3">
                        <div style="height: 480px; overflow-x: hidden; overflow-y: auto;vertical-align:top; margin-top:0;" id="mydiv">
                            <asp:UpdatePanel ID='UpdatePanel1' runat='server'>
                                <ContentTemplate>
                                     <asp:HiddenField ID="HiddenField1" runat="server" Value="1" />
                                    <asp:GridView ID='GridView1' runat='server' AutoGenerateColumns='False' Width='800' ShowHeader='False'>
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
               
                </table>
        </th>
        </tr>
    

            </table>
           
    </div>
    </form>
     
</body>
</html>
<script>
    var objDiv = document.getElementById("mydiv");
    objDiv.scrollTop = objDiv.scrollHeight;
</script>