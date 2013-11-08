<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiscussionB.aspx.cs" Inherits="Discussion_DiscussionB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Discussion B</title>
    <style type="text/css">
        #discussionBoard
        {
            display: block;
            border: 1px solid #ccc;
            width: 850px;
            height: 350px;
            overflow: auto;
            background: white;
           /* margin: 0px auto;*/
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
        .ta
        {
            width:800px;
            height:40px;
            overflow:auto;
            margin: 10px auto;
        }
        body
        {
            font-size: .80em;
            font-family: "Helvetica Neue", "Lucida Grande", "Segoe UI", Arial, Helvetica, Verdana, sans-serif;
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
        }
    </style>
    
</head>
<body style="background:#eee">
    <form id="form1" runat="server">
    
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <table width="900px" style="border:1px solid #000;padding:10px;margin: 20px auto; background:white;border-radius:20px;box-shadow:20px 20px 20px gray">
            <tr><td colspan="2"><a href="../Default.aspx">回首頁</a><div id="title">
                <asp:Label ID="TitleLabel" runat="server" Text="Label"></asp:Label></div></td></tr>
             <tr><td width="100px">
        <div id="memberPanel">
            <asp:Label ID="GroupInfo" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        </div>
                 </td>
                 <td width="800px">
                <div id="discussionBoard">
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="100%" ShowHeader="False">
                        <Columns>
                            <asp:TemplateField HeaderText="topic" SortExpression="topic">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("topic") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <div style="background:#ccc">
                                        <span class="leftPanel">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("nickname") %>' Font-Bold="True"></asp:Label>
                                        </span>
                                        <span class="rightPanel">
                                         <asp:Label ID="Label2" runat="server" Text='<%# Bind("time","{0:tt hh:mm:ss}") %>' Font-Bold="True"></asp:Label>
                                         </span>
                                         <span class="Panel">
                                            <asp:Literal ID="Label1" runat="server" Text='<%# Bind("topic") %>'></asp:Literal>
                                         </span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                        </Columns>
                    </asp:GridView>

                     <asp:Timer ID="Timer1" runat="server" Interval="5000">
                    </asp:Timer>

                     </ContentTemplate>
        </asp:UpdatePanel>
                </div>
            </div>
          </td>
          </tr>
        <tr><td colspan="2">
                <div id="sendPanel">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="ta" TextMode="MultiLine"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="訊息送出" OnClick="Button1_Click" />
                </div>
            </td>
          </tr>
    </table>
    </form>
</body>
</html>
