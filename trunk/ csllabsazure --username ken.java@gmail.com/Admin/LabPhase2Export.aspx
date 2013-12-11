<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LabPhase2Export.aspx.cs" Inherits="Lab_Phase2_OnlineLabExport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="servevr">
    <title>第二階段線上習作資料匯出</title>
    <link rel="stylesheet" href="../Styles/Preview.css" /> 
</head>
<body>
    <form id="form1" runat="server">
      <div class="export">
       <asp:Literal ID="Preview" runat="server" Text="Data"></asp:Literal>  
            
      </div>    
    </form>
</body>
</html>
