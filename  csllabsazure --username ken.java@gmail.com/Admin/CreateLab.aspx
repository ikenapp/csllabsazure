<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateLab.aspx.cs" Inherits="Admin_CreateLab" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <style type="text/css">
    #createPanel
    {
        width:360px;
        text-align:center;
        margin: 50px auto;
    }
    .acctinfo
    {
        text-align:left;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div id="createPanel"><asp:HyperLink ID="BackLink" runat="server">返回上一頁</asp:HyperLink>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup" ShowMessageBox="True" ShowSummary="False" />
            <div class="acctinfo" >
                <fieldset class="login" style="text-align:left;">
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
                        <asp:TextBox ID="BeginDate" runat="server" CssClass="textEntry" ></asp:TextBox><br>(西元年-月-日,Ex : 2013-10-21)
                        <%--<asp:CalendarExtender ID="BeginDate_CalendarExtender" runat="server" 
                        Enabled="True" Format="yyyy-MM-dd" TargetControlID="BeginDate">
                    </asp:CalendarExtender>--%>
                        <asp:RequiredFieldValidator ID="BeginDateRequired" runat="server" ControlToValidate="BeginDate" 
                             CssClass="failureNotification" ErrorMessage="開始時間必填" ToolTip="Begin Date is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
       
                        <asp:Label ID="EndDateLabel" runat="server" AssociatedControlID="EndDate">結束時間:</asp:Label>
                        <asp:TextBox ID="EndDate" runat="server" CssClass="textEntry" ></asp:TextBox><br>(西元年-月-日,Ex : 2013-10-21)
                       <%-- <asp:CalendarExtender ID="EndDate_CalendarExtender" runat="server" 
                        Enabled="True" Format="yyyy-MM-dd" TargetControlID="EndDate">
                    </asp:CalendarExtender>--%>
                        <asp:RequiredFieldValidator ID="EndDateRequired" runat="server" ControlToValidate="EndDate" 
                             CssClass="failureNotification" ErrorMessage="結束時間必填" ToolTip="End Date is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator><br>
                     <asp:CheckBox ID="initCB" runat="server" Checked="True" />使用範本初始化資料
                       
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
                <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />  
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>  
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
               <script type="text/javascript"> 
  
                   $(function () {
                       $("#<%= BeginDate.ClientID%>").datepicker({ dateFormat: "yy-mm-dd" });
                       $("#<%= EndDate.ClientID%>").datepicker({ dateFormat: "yy-mm-dd" })
                   });  </script>
            </div>
            </div>
</asp:Content>

