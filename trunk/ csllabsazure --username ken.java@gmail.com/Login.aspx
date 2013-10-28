<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Account_MainLogin" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<style type="text/css">
    #loginPanel
    {
        text-align:center;
    }
    .acctinfo
    {
        text-align:left;
    }
</style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

<div id="loginPanel">
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup" ShowMessageBox="True" ShowSummary="False" />
            <div class="accountInfo" >
                <fieldset class="login"  style="text-align:left;" >
                    <legend>登入資訊</legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">登入帳號:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="登入帳號必填" ToolTip="User Name is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密碼:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="密碼必填" ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="NicknameLabel" runat="server" AssociatedControlID="NickName">暱稱:</asp:Label>
                        <asp:TextBox ID="Nickname" runat="server" CssClass="textEntry" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NicknameRequired" runat="server" ControlToValidate="Nickname" 
                             CssClass="failureNotification" ErrorMessage="暱稱必填" ToolTip="Nickname is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                     <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" Text="登入" 
                        ValidationGroup="LoginUserValidationGroup" onclick="LoginButton_Click"/>
                        </p>
                    <p>
                        
                        <asp:Label ID="MessageLabel" runat="server" CssClass="failureNotification"></asp:Label>
                       
                    </p>
                </fieldset>
               
            </div>
       
    </div>
</asp:Content>