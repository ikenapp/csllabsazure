using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NicknameLabel.Text = "";
        if (Session["isLogin"] != null && Session["isLogin"].ToString() == "Y")
        {
            if (Session["USER_DATA"] != null)
            {
                User u = Session["USER_DATA"] as User;
                if (u != null)
                {
                    NicknameLabel.Text = u.nickname + " , 你好! ";
                }
            }
        }
        else
        {
            NicknameLabel.Text = "請用帳號(學號),密碼(出生西元年月日)登入!";
        }

    }
}
