using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Account_MainLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        MessageLabel.Text = "";
        if (Page.IsValid)
        {
            string id = UserName.Text;
            string pwd = Password.Text;
            string nickname = Nickname.Text;
            User u = UserDAO.GetUser(id, pwd);
            if (u != null)
            {
                String oNickname = u.nickname;
                if (oNickname != nickname)
                {
                    using (LabsDBEntities db = new LabsDBEntities())
                    {
                        try
                        {
                            User others = db.Users.Where(c => c.group == u.group && c.groupid == u.groupid && c.nickname == nickname).First();
                            if (others != null)
                            {
                                MessageLabel.Text = "輸入的暱稱[ "+nickname+" ]與其他人重複!請重新輸入";
                                Nickname.Text = "";
                                return;
                            }
                        }
                        catch (Exception ex)
                        {
                           
                        }
                    }
                    u.nickname = nickname;
                    UserDAO.UpdateUser(u);
                }
                Session["USER_DATA"] = u;
                Session["isLogin"] = "Y";
                Response.Redirect("~/");
            }
            else
            {
                MessageLabel.Text = "輸入的帳號或是密碼有誤!請重新輸入";
            }
        }
    }
}
