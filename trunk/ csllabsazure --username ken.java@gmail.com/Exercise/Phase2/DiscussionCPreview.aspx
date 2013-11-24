<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiscussionCPreview.aspx.cs" Inherits="Discussion_CPreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>第一部分看法</title>
    <style>
        div.preview
        {
            width:400px;
            height:800px;
            background:white;
            color:black;
            overflow:auto;
            padding:10px;
            font-size:12px;
        }
         .questionLabel
        {
            color:black;
        }
        .answerLabel
        {
            color:blue;
        }
    </style>
    <script>

    </script>
</head>
<body>
    <form id="form1" runat="server">
      <div class="preview">
       <asp:Literal ID="Preview" runat="server" Text="Data"></asp:Literal>  
            
      </div>    
    </form>
</body>
</html>
