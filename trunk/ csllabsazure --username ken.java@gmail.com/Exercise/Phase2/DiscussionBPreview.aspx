<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiscussionBPreview.aspx.cs" Inherits="DiscussionBPreview" %>

<!DOCTYPE html>

<html>
<head runat="server" runat='server'>
    <title>第一部分看法</title>
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
            <table align="left" border="0" width="1177">
    <tr>
        <td width="262" rowspan="2" valign="top">
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
                        <div style="height: 480px; overflow-x: hidden; overflow-y: auto;vertical-align:top;">
                            <asp:UpdatePanel ID='UpdatePanel1' runat='server'>
                                <ContentTemplate>
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
                                                                    <asp:Literal ID='Literal2' runat='server' Text='<%# Bind("nickname") %>'></asp:Literal>
                                                                </div>
                                                            </td>
                                                            <td scope="col" valign="top">
                                                                <div class="dislog">
                                                                    <asp:Literal ID='Literal3' runat='server' Text='<%# Bind("topic") %>'></asp:Literal>
                                                                </div>
                                                            </td>
                                                            <td scope="col" valign="top" width="70px">
                                                                <div class="time" align="left">
                                                                    <asp:Literal ID='Literal4' runat='server' Text='<%# Bind("time","{0:tt hh:mm:ss}") %>'></asp:Literal>
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
            <p>&nbsp;</p>
    </div>
    <p>&nbsp;</p>
    </form>
         <div style='width: 100%; height: 20px; text-align: center; background: black; vertical-align: bottom'>
             <small style='color: white; font-size: 12px'>資元科技顧問有限公司 版權所有 © 2013 BIT Tech. All Rights Reserved.</small>
         </div>
</body>
</html>
