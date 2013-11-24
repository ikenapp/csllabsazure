<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiscussionDPreview.aspx.cs" Inherits="DiscussionDPreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>第一部分看法</title>
    <link rel="stylesheet" href="../../Styles/Preview.css" />
</head>
<body>
    <form id="form1" runat="server">
      <div class="preview">
       <asp:Literal ID="Preview" runat="server" Text="Data"></asp:Literal>  
            
      </div>    
    </form>
</body>
</html>
