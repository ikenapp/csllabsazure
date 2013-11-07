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
            width: 900px;
            height: 350px;
            overflow: auto;
            background: white;
            margin: 20px auto;
        }
        #sendPanel
        {
            display:block;
            border: 1px solid #ccc;
            width:900px;
            height:40px;
            overflow:auto;
            background:white;
            margin: 20px auto;
            padding:20px;
        }
        .ta
        {
            width:800px;
            height:20px;
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
<body>
    <form id="form1" runat="server">
    
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div style="text-align: center; margin: 20px;">
            <a href="../Default.aspx">回首頁</a> &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="GroupInfo" runat="server" Text="Label"></asp:Label>
        </div>
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
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("nickname") %>'></asp:Label>
                                        </span>
                                        <span class="rightPanel">
                                         <asp:Label ID="Label2" runat="server" Text='<%# Bind("time","{0:tt hh:mm:ss}") %>'></asp:Label>
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
                <div id="sendPanel">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="ta" TextMode="MultiLine"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="訊息送出" OnClick="Button1_Click" />
                </div>
          
    </div>
    </form>
</body>
</html>
