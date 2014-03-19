<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SkypeTask1.aspx.cs" Inherits="Discussion_SkypeTask1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        div{
		display: inline-block;
		font-size: 16px;
		/*text-transform: uppercase;*/
		font-weight: 150;
		color: #000;
	}
    body
    {
        /*background: rgba(59,89,152,1);*/  
        background: #2372DE url(images/bg01.png) repeat;  
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    逐一對同組同學所張貼「最認同的說法」：
    <ol>
   <li>您認為對方資料(說法) 實證基礎的屬性(請參考Levels of Evidence (SIGN)的標準作判斷，若未能符合任一標準，可以提出您的問題做討論)</li>
<li>您認為該被張貼說法的優點與缺點有哪些? (例如：是否存在已知的錯誤觀念? 已知確實正確的觀念有哪些?)</li>
<li>評價您對該說法的認同強度(例如：非常不認同、大部分不認同、普通、大部分認同、非常認同)</li>
<li>嘗試以您已知的證據資料為您自己「最認同的說法」做辯護，必要時可以提供您已知的相關資訊連結讓同組同學做即時的線上參考。</li>
<li>請互相討論各說法間您心中尚有的疑惑? 並嘗試幫助其他組員找尋解決疑惑的方式</li>
<li>同組同學間可以彼此嘗試做共同的結論，並試者擬出同組同學都認同的說法。</li>
        </ol>

    
    </div>
    </form>
</body>
</html>
