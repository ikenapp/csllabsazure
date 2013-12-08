<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LabPhase1Export.aspx.cs" Inherits="Lab_Phase1_OnlineLabExport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>第一階段資料匯出</title>
    <link rel="stylesheet" href="../../Styles/Preview.css" /> 
</head>
<body>
    <form id="form1" runat="server">
      <div class="export">
       <asp:Literal ID="Preview" runat="server" Text="Data"></asp:Literal>  
            
      </div>    
    </form>
</body>
</html>
