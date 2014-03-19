using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class DiscussionBPreview : System.Web.UI.Page
{
    string hln = "<br>";
    public int timeLeft = 89;
    public int no = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
        User u = UserDAO.GetUserFromSession();
        GridView1.GridLines = GridLines.None;
        bool isError = true;
        if (u != null)
        {
            Literal1.Text = u.nickname + "<br>";
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {

                    {
                        if (!String.IsNullOrEmpty(Request.Form[Button3.ClientID]) || Request.Form[HiddenField1.ClientID] == "2" && String.IsNullOrEmpty(Request.Form[Button2.ClientID]))
                        {
                            no = 2;
                            HiddenField1.Value = "2";
                            Button3.ForeColor = Color.Red;
                            Button2.ForeColor = Color.Black;
                        }
                        else
                        {
                            no = 1;
                            HiddenField1.Value = "1";
                            Button2.ForeColor = Color.Red;
                            Button3.ForeColor = Color.Black;
                        }
                        no = int.Parse(HiddenField1.Value);
                        //From DB?
                        TitleLabel.Text = ConfigurationManager.AppSettings["Discussion_B_Title" + no];
                        var users = db.Users.Where(c => c.groupid == u.groupid && c.group == u.group && c.labid == u.labid).Select(c => c.nickname);
                        GroupInfo.Text = "<br>本組組員 : " + hln;
                        foreach (var uu in users)
                        {
                            if (uu == u.nickname)
                            {
                                continue;
                            }
                            GroupInfo.Text += "&nbsp;&nbsp;" + uu + hln;
                        }
                      
                        isError = false;
                    
                        try
                        {
                            var query = from x in db.DiscussionBs
                                        let z = db.Users
                                                       .Where(y => y.sid == x.student_id)
                                                       .Select(y => y.nickname).FirstOrDefault()
                                        where x.labid == u.labid && x.groupid == u.groupid && x.num == no
                                        select new
                                        {
                                            topic =  x.topic ,
                                            student_id = x.student_id,
                                            time = x.time,
                                            nickname = z
                                        };
                            GridView1.DataSource = query.OrderBy(c => c.time).ToList();
                            GridView1.DataBind();

                        }
                        catch (Exception)
                        {


                        }
                    }
                    isError = false;
                }
                catch (Exception)
                {


                }
            }
        }
        if (isError)
        {
            Response.Write("網路發生不可預期錯誤.請重新登入再試!");
            return;
        }



    }

   
   
}