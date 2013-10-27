<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateLab.aspx.cs" Inherits="Admin_CreateLab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
    #createPanel
    {
        text-align:center;
    }
    #acctinfo
    {
        text-align:left;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
 <div id="createPanel"><asp:HyperLink ID="BackLink" runat="server">返回上一頁</asp:HyperLink>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup" ShowMessageBox="True" ShowSummary="False" />
            <div class="accountInfo" id="acctinfo">
                <fieldset class="login">
                    <legend>新增實驗</legend>
                    
                        <asp:Label ID="LabNameLabel" runat="server" AssociatedControlID="LabName">實驗名稱:</asp:Label>
                        <asp:TextBox ID="LabName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="LabNameRequired" runat="server" ControlToValidate="LabName" 
                             CssClass="failureNotification" ErrorMessage="實驗名稱必填" ToolTip="Lab Name is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>

                        <asp:Label ID="DescLabel" runat="server" AssociatedControlID="Desc">實驗描述:</asp:Label>
                        <asp:TextBox ID="Desc" runat="server" CssClass="textEntry" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="DescRequired" runat="server" ControlToValidate="Desc" 
                             CssClass="failureNotification" ErrorMessage="實驗描述必填" ToolTip="Description is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>

                        <asp:Label ID="BeginDateLabel" runat="server" AssociatedControlID="BeginDate">開始時間:</asp:Label>
                        <asp:TextBox ID="BeginDate" runat="server" CssClass="textEntry" ></asp:TextBox>
                        <asp:CalendarExtender ID="BeginDate_CalendarExtender" runat="server" 
                        Enabled="True" Format="yyyy-MM-dd" TargetControlID="BeginDate">
                    </asp:CalendarExtender>
                        <asp:RequiredFieldValidator ID="BeginDateRequired" runat="server" ControlToValidate="BeginDate" 
                             CssClass="failureNotification" ErrorMessage="開始時間必填" ToolTip="Begin Date is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
       
                        <asp:Label ID="EndDateLabel" runat="server" AssociatedControlID="EndDate">結束時間:</asp:Label>
                        <asp:TextBox ID="EndDate" runat="server" CssClass="textEntry" ></asp:TextBox>
                        <asp:CalendarExtender ID="EndDate_CalendarExtender" runat="server" 
                        Enabled="True" Format="yyyy-MM-dd" TargetControlID="EndDate">
                    </asp:CalendarExtender>
                        <asp:RequiredFieldValidator ID="EndDateRequired" runat="server" ControlToValidate="EndDate" 
                             CssClass="failureNotification" ErrorMessage="結束時間必填" ToolTip="End Date is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
              
                    <br />
                    <br />
                    <p class="submitButton">
                    <asp:Button ID="InsertButton" runat="server" Text="新增" 
                        ValidationGroup="LoginUserValidationGroup" onclick="InsertButton_Click" />
                        </p>
                    <p>
                        
                        <asp:Label ID="MessageLabel" runat="server" CssClass="failureNotification"></asp:Label>
                       
                    </p>
                </fieldset>
               
            </div>
            </div>
</asp:Content>

