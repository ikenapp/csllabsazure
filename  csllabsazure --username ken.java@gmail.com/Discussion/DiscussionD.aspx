<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DiscussionD.aspx.cs" Inherits="Discussion_DiscussionD" EnableViewState="true"%>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
    #myheader td
    {
        border : 0px;
    }
    .center
    {
        border : 0px;
        text-align : center;
    }
    .centerBTN
    {
        border: 1px solid #CCC;
        width: 180px;
        height:80px;
        font-size : 18px;
        margin : 0px 200px 0px 300px; 
        background : pink;
    }
    .optionPanel
    {
        width:900px;
        min-height:450px;
        max-height:100%;
        border: 1px solid #ccc;
        padding:10px;
        background : #eee;
        color:black;
     }
     .myarea
     {
        padding:20px
     }
     
     .focusView
     {
         color:blue; 
         font-weight :bold;  
         
     }
     .Next
    {
        border: 1px solid #CCC;
        background : pink;
    }
    .MSG
    {
        color:Red;
        font-weight : bold;
    }
    .noborder
    {
        border:none;
    }
    h1,h2,h3,h4,h5
    {
        color:black;
        font-weight:bold;
    }
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div style="text-align:left;width:100%;">
        <asp:HyperLink ID="BackLink" runat="server" Visible="false">返回上一頁</asp:HyperLink>
        <br />
        <asp:Label ID="LabInfo" runat="server" CssClass="login" Text="Label"></asp:Label>
        <h3>第一部分:</h3>
        <h3><asp:Label ID="Part1Title" runat="server" CssClass="login" Text="Label"></asp:Label>
        </h3>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               
        <div style="text-align:left;">
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                <asp:Button ID="Button1" runat="server" Text="說法1" CssClass="focusView" 
                CommandArgument="0" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button2" runat="server" Text="說法2" 
                CommandArgument="1" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button3" runat="server" Text="說法3" 
                CommandArgument="2" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button4" runat="server" Text="說法4" 
                CommandArgument="3" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button5" runat="server" Text="說法5" 
                CommandArgument="4" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button6" runat="server" Text="說法6" 
                CommandArgument="5" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button7" runat="server" Text="說法7" 
                CommandArgument="6" CommandName="SwitchViewByIndex" />
                    <div class="optionPanel">
                    <h3>說法一:</h3><%= label_rank %><asp:DropDownList ID="DropDownList1" runat="server" CssClass="noborder">
                         <asp:ListItem Value="1">非常不認同</asp:ListItem>
                            <asp:ListItem Value="2">大部分不認同</asp:ListItem>
                            <asp:ListItem Value="3">普通</asp:ListItem>
                            <asp:ListItem Value="4">大部分認同</asp:ListItem>
                            <asp:ListItem Value="5">非常認同</asp:ListItem>
                        </asp:DropDownList>
                        <%= label_rank_end %> <br><%= label_content %><br />
                        <asp:TextBox ID="ContentTB1" runat="server" Height="135px" TextMode="MultiLine" Width="800px"></asp:TextBox>
                        <br />
                        <%= label_source %><br />
                        <asp:TextBox ID="SourceTB1" runat="server" Height="85px" TextMode="MultiLine" Width="800px"></asp:TextBox>
                        <br />
                        <%= label_attributes %><br>
                        <asp:CheckBoxList ID="AttrList1" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">具實證基礎</asp:ListItem>
                            <asp:ListItem Value="2">專家個人看法</asp:ListItem>
                            <asp:ListItem Value="3">個人假設</asp:ListItem>
                            <asp:ListItem Value="4">未經查證的資料</asp:ListItem>
                            <asp:ListItem Value="5">以上皆非</asp:ListItem>
                        </asp:CheckBoxList><br />
                        <%= label_opinons %><br /> 
                        <asp:TextBox ID="OpinionTB1" runat="server" Height="135px" TextMode="MultiLine" Width="800px"></asp:TextBox>
                        <asp:Button ID="SaveButton1" runat="server" onclick="SaveButton1_Click" Text="儲存" />
                        <br/>
                        <asp:Label ID="MsgLabel1" runat="server" CssClass="MSG" Text=""></asp:Label>
                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
                <asp:Button ID="Button8" runat="server" Text="說法1" 
                CommandArgument="0" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button9" runat="server" Text="說法2" CssClass="focusView"
                CommandArgument="1" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button10" runat="server" Text="說法3" 
                CommandArgument="2" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button11" runat="server" Text="說法4" 
                CommandArgument="3" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button12" runat="server" Text="說法5" 
                CommandArgument="4" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button13" runat="server" Text="說法6" 
                CommandArgument="5" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button14" runat="server" Text="說法7" 
                CommandArgument="6" CommandName="SwitchViewByIndex" />
                    <div class="optionPanel">
                    <h3>說法二:</h3><%= label_rank %><asp:DropDownList ID="DropDownList2" runat="server">
                              <asp:ListItem Value="1">非常不認同</asp:ListItem>
                            <asp:ListItem Value="2">大部分不認同</asp:ListItem>
                            <asp:ListItem Value="3">普通</asp:ListItem>
                            <asp:ListItem Value="4">大部分認同</asp:ListItem>
                            <asp:ListItem Value="5">非常認同</asp:ListItem>
                    </asp:DropDownList>
                        <%= label_rank_end %>
                        <br />
                         <%= label_content %><br />
                        <asp:TextBox ID="ContentTB2" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br />
                        <%= label_source %><br />
                        <asp:TextBox ID="SourceTB2" runat="server" Height="85px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br />
                         <%= label_attributes %><br>
                        <asp:CheckBoxList ID="AttrList2" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">具實證基礎</asp:ListItem>
                            <asp:ListItem Value="2">專家個人看法</asp:ListItem>
                            <asp:ListItem Value="3">個人假設</asp:ListItem>
                            <asp:ListItem Value="4">未經查證的資料</asp:ListItem>
                            <asp:ListItem Value="5">以上皆非</asp:ListItem>
                        </asp:CheckBoxList><br />
                        <%= label_opinons %><br /> 
                        <asp:TextBox ID="OpinionTB2" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox><asp:Button ID="SaveButton2" runat="server" 
                            Text="儲存" onclick="SaveButton1_Click" /><br/>
                            <asp:Label ID="MsgLabel2" runat="server" Text="" CssClass="MSG"></asp:Label>
                  </div>
                </asp:View>
                <asp:View ID="View3" runat="server">
                <asp:Button ID="Button48" runat="server" Text="說法1" 
                CommandArgument="0" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button49" runat="server" Text="說法2" 
                CommandArgument="1" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button50" runat="server" Text="說法3" CssClass="focusView"
                CommandArgument="2" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button51" runat="server" Text="說法4" 
                CommandArgument="3" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button52" runat="server" Text="說法5" 
                CommandArgument="4" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button53" runat="server" Text="說法6" 
                CommandArgument="5" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button54" runat="server" Text="說法7" 
                CommandArgument="6" CommandName="SwitchViewByIndex" />
                    <div class="optionPanel"> 
                    <h3>說法三:</h3><%= label_rank %><asp:DropDownList ID="DropDownList3" runat="server">
                              <asp:ListItem Value="1">非常不認同</asp:ListItem>
                            <asp:ListItem Value="2">大部分不認同</asp:ListItem>
                            <asp:ListItem Value="3">普通</asp:ListItem>
                            <asp:ListItem Value="4">大部分認同</asp:ListItem>
                            <asp:ListItem Value="5">非常認同</asp:ListItem>
                  </asp:DropDownList>
                        <%= label_rank_end %>
                     
                        <br />
                        <%= label_content %><br />
                        <asp:TextBox ID="ContentTB3" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br />
                        <%= label_source %><br />
                        <asp:TextBox ID="SourceTB3" runat="server" Height="85px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br />
                         <%= label_attributes %><br>
                        <asp:CheckBoxList ID="AttrList3" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">具實證基礎</asp:ListItem>
                            <asp:ListItem Value="2">專家個人看法</asp:ListItem>
                            <asp:ListItem Value="3">個人假設</asp:ListItem>
                            <asp:ListItem Value="4">未經查證的資料</asp:ListItem>
                            <asp:ListItem Value="5">以上皆非</asp:ListItem>
                        </asp:CheckBoxList><br />
                        <%= label_opinons %><br /> 
                        <asp:TextBox ID="OpinionTB3" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox><asp:Button ID="SaveButton3" runat="server" 
                            Text="儲存" onclick="SaveButton1_Click" /><br/><asp:Label ID="MsgLabel3" runat="server" Text="" CssClass="MSG"></asp:Label>
                    </div>
                </asp:View>
                <asp:View ID="View4" runat="server">
                <asp:Button ID="Button40" runat="server" Text="說法1" 
                CommandArgument="0" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button41" runat="server" Text="說法2" 
                CommandArgument="1" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button42" runat="server" Text="說法3" 
                CommandArgument="2" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button43" runat="server" Text="說法4" CssClass="focusView"
                CommandArgument="3" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button44" runat="server" Text="說法5" 
                CommandArgument="4" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button45" runat="server" Text="說法6" 
                CommandArgument="5" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button46" runat="server" Text="說法7" 
                CommandArgument="6" CommandName="SwitchViewByIndex" />
                    <div class="optionPanel">
                    <h3>說法四:</h3><%= label_rank %><asp:DropDownList ID="DropDownList4" runat="server">
                             <asp:ListItem Value="1">非常不認同</asp:ListItem>
                            <asp:ListItem Value="2">大部分不認同</asp:ListItem>
                            <asp:ListItem Value="3">普通</asp:ListItem>
                            <asp:ListItem Value="4">大部分認同</asp:ListItem>
                            <asp:ListItem Value="5">非常認同</asp:ListItem>
                        </asp:DropDownList>
                        <%= label_rank_end %>
                     
                        <br />
                        <%= label_content %><br />
                        <asp:TextBox ID="ContentTB4" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br />
                        <%= label_source %><br />
                        <asp:TextBox ID="SourceTB4" runat="server" Height="85px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br /> <%= label_attributes %><br>
                        <asp:CheckBoxList ID="AttrList4" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">具實證基礎</asp:ListItem>
                            <asp:ListItem Value="2">專家個人看法</asp:ListItem>
                            <asp:ListItem Value="3">個人假設</asp:ListItem>
                            <asp:ListItem Value="4">未經查證的資料</asp:ListItem>
                            <asp:ListItem Value="5">以上皆非</asp:ListItem>
                        </asp:CheckBoxList><br />
                        <%= label_opinons %><br /> 
                        <asp:TextBox ID="OpinionTB4" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox><asp:Button ID="SaveButton4" runat="server" 
                            Text="儲存" onclick="SaveButton1_Click" /><br/><asp:Label ID="MsgLabel4" runat="server" Text="" CssClass="MSG"></asp:Label>
                    </div>
                </asp:View>
                <asp:View ID="View5" runat="server">
                <asp:Button ID="Button32" runat="server" Text="說法1" 
                CommandArgument="0" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button33" runat="server" Text="說法2" 
                CommandArgument="1" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button34" runat="server" Text="說法3" 
                CommandArgument="2" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button35" runat="server" Text="說法4"
                CommandArgument="3" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button36" runat="server" Text="說法5" CssClass="focusView"
                CommandArgument="4" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button37" runat="server" Text="說法6" 
                CommandArgument="5" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button38" runat="server" Text="說法7" 
                CommandArgument="6" CommandName="SwitchViewByIndex" />
                    <div class="optionPanel">
                    <h3>說法五:</h3><%= label_rank %><asp:DropDownList ID="DropDownList5" runat="server">
                             <asp:ListItem Value="1">非常不認同</asp:ListItem>
                            <asp:ListItem Value="2">大部分不認同</asp:ListItem>
                            <asp:ListItem Value="3">普通</asp:ListItem>
                            <asp:ListItem Value="4">大部分認同</asp:ListItem>
                            <asp:ListItem Value="5">非常認同</asp:ListItem>
                  </asp:DropDownList>
                        <%= label_rank_end %>
                     
                        <br />
                        <%= label_content %><br />
                        <asp:TextBox ID="ContentTB5" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br />
                        <%= label_source %><br />
                        <asp:TextBox ID="SourceTB5" runat="server" Height="85px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br />
                         <%= label_attributes %><br>
                        <asp:CheckBoxList ID="AttrList5" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">具實證基礎</asp:ListItem>
                            <asp:ListItem Value="2">專家個人看法</asp:ListItem>
                            <asp:ListItem Value="3">個人假設</asp:ListItem>
                            <asp:ListItem Value="4">未經查證的資料</asp:ListItem>
                            <asp:ListItem Value="5">以上皆非</asp:ListItem>
                        </asp:CheckBoxList><br />
                        <%= label_opinons %><br /> 
                        <asp:TextBox ID="OpinionTB5" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox><asp:Button ID="SaveButton15" runat="server" 
                            Text="儲存" onclick="SaveButton1_Click" /><br/><asp:Label ID="MsgLabel5" runat="server" Text="" CssClass="MSG"></asp:Label>
                    </div>
                </asp:View>
                <asp:View ID="View6" runat="server">
                <asp:Button ID="Button24" runat="server" Text="說法1" 
                CommandArgument="0" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button25" runat="server" Text="說法2" 
                CommandArgument="1" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button26" runat="server" Text="說法3" 
                CommandArgument="2" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button27" runat="server" Text="說法4" 
                CommandArgument="3" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button28" runat="server" Text="說法5" 
                CommandArgument="4" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button29" runat="server" Text="說法6" CssClass="focusView"
                CommandArgument="5" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button30" runat="server" Text="說法7" 
                CommandArgument="6" CommandName="SwitchViewByIndex" />
                    <div class="optionPanel">
                    <h3>說法六:</h3><%= label_rank %><asp:DropDownList ID="DropDownList6" runat="server">
                           <asp:ListItem Value="1">非常不認同</asp:ListItem>
                            <asp:ListItem Value="2">大部分不認同</asp:ListItem>
                            <asp:ListItem Value="3">普通</asp:ListItem>
                            <asp:ListItem Value="4">大部分認同</asp:ListItem>
                            <asp:ListItem Value="5">非常認同</asp:ListItem>
                        </asp:DropDownList>
                        <%= label_rank_end %>
                     
                        <br />
                        <%= label_content %><br />
                        <asp:TextBox ID="ContentTB6" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br />
                        <%= label_source %><br />
                        <asp:TextBox ID="SourceTB6" runat="server" Height="85px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br />
                         <%= label_attributes %><br>
                        <asp:CheckBoxList ID="AttrList6" runat="server" RepeatDirection="Horizontal">
                             <asp:ListItem Value="1">非常不認同</asp:ListItem>
                            <asp:ListItem Value="2">大部分不認同</asp:ListItem>
                            <asp:ListItem Value="3">普通</asp:ListItem>
                            <asp:ListItem Value="4">大部分認同</asp:ListItem>
                            <asp:ListItem Value="5">非常認同</asp:ListItem>
                        </asp:CheckBoxList><br />
                        <%= label_opinons %><br /> 
                        <asp:TextBox ID="OpinionTB6" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox><asp:Button ID="SaveButton6" runat="server" 
                            Text="儲存" onclick="SaveButton1_Click" /><br/>
                            <asp:Label ID="MsgLabel6" runat="server" Text=""></asp:Label>
                    </div>
                </asp:View>
                <asp:View ID="View7" runat="server">
                <asp:Button ID="Button16" runat="server" Text="說法1" 
                CommandArgument="0" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button17" runat="server" Text="說法2" 
                CommandArgument="1" CommandName="SwitchViewByIndex" />
                <asp:Button ID="Button18" runat="server" Text="說法3" 
                CommandArgument="2" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button19" runat="server" Text="說法4" 
                CommandArgument="3" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button20" runat="server" Text="說法5" 
                CommandArgument="4" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button21" runat="server" Text="說法6" 
                CommandArgument="5" CommandName="SwitchViewByIndex" />
            <asp:Button ID="Button22" runat="server" Text="說法7" CssClass="focusView"
                CommandArgument="6" CommandName="SwitchViewByIndex" />
                    <asp:Button ID="NextButton" runat="server" Text="進行第二部分 >>"  CssClass="Next"
                    PostBackUrl="~/Discussion/DiscussionD2.aspx" onclick="NextButton_Click" 
             />
       
                    <div class="optionPanel">
                    <h3>說法七:</h3><%= label_rank %><asp:DropDownList ID="DropDownList7" runat="server">
                            <asp:ListItem Value="1">非常不認同</asp:ListItem>
                            <asp:ListItem Value="2">大部分不認同</asp:ListItem>
                            <asp:ListItem Value="3">普通</asp:ListItem>
                            <asp:ListItem Value="4">大部分認同</asp:ListItem>
                            <asp:ListItem Value="5">非常認同</asp:ListItem>
                        </asp:DropDownList>
                        <%= label_rank_end %>
                     
                        <br />
                        <%= label_content %><br />
                        <asp:TextBox ID="ContentTB7" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br />
                         <%= label_source %><br />
                        <asp:TextBox ID="SourceTB7" runat="server" Height="85px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox>
                        <br /> 
                        <%= label_attributes %><br>
                        <asp:CheckBoxList ID="AttrList7" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">具實證基礎</asp:ListItem>
                            <asp:ListItem Value="2">專家個人看法</asp:ListItem>
                            <asp:ListItem Value="3">個人假設</asp:ListItem>
                            <asp:ListItem Value="4">未經查證的資料</asp:ListItem>
                            <asp:ListItem Value="5">以上皆非</asp:ListItem>
                        </asp:CheckBoxList><br />
                         <%= label_opinons %><br /> 
                        <asp:TextBox ID="OpinionTB7" runat="server" Height="135px" TextMode="MultiLine" 
                            Width="800px"></asp:TextBox><asp:Button ID="SaveButton7" runat="server" 
                            Text="儲存" onclick="SaveButton1_Click" /><br/>
                            <asp:Label ID="MsgLabel7" runat="server" Text="" CssClass="MSG"></asp:Label>
                    </div>
                </asp:View>
            </asp:MultiView>
            <br/>
            <div style="text-align:center;width:100%">
             </div>
        </div>
        <br />
    
     
            </ContentTemplate>
        </asp:UpdatePanel>

         <script type="text/javascript">
             if ('<%= isShow %>' == 'True') {
                 alert('<%= message %>');
    }
    </script>
    </div>
</asp:Content>
