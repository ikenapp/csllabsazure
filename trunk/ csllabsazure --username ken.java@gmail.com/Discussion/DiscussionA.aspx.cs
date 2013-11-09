using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Discussion_DiscussionA : System.Web.UI.Page
{
    string hln = "<br>";
    public int timeLeft = 89;
    protected void Page_Load(object sender, EventArgs e)
    {
        User u = UserDAO.GetUserFromSession();

        bool isError = true;
        if (u != null)
        {
            if (Application[u.labid + "_limit"] != null)
            {
                DateTime limit = (DateTime)Application[u.labid + "_limit"];
                if (limit != null)
                {
                    timeLeft = (int)((limit - DateTime.Now).TotalSeconds);
                }
            }
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {
                    if (!Page.IsPostBack)
                    {
                        //From DB?
                        TitleLabel.Text = ConfigurationManager.AppSettings["Discussion_A_Title"];
                        var users = db.Users.Where(c => c.groupid == u.groupid && c.group == u.group && c.labid == u.labid).Select(c => c.nickname);
                        GroupInfo.Text = "本組成員 : " + hln;
                        foreach (var uu in users)
                        {
                            GroupInfo.Text += "&nbsp;&nbsp;" + uu + hln;
                        }

                        UserDAO.SaveStatusB1(u, db);

                        isError = false;
                    }
                    if (String.IsNullOrEmpty(Request.Form[Button1.ClientID]))
                    {
                        //try
                        //{
                        //    var query = from x in db.DiscussionBs
                        //                let z = db.Users
                        //                               .Where(y => y.sid == x.student_id)
                        //                               .Select(y => y.nickname).FirstOrDefault()
                        //                where x.labid == u.labid && x.groupid == u.groupid
                        //                select new
                        //                {
                        //                    topic = "<pre>" + x.topic + "</pre>",
                        //                    student_id = x.student_id,
                        //                    time = x.time,
                        //                    nickname = z
                        //                };
                        //    GridView1.DataSource = query.OrderByDescending(c => c.time).ToList();
                        //    GridView1.DataBind();

                        //}
                        //catch (Exception)
                        //{


                        //}
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



    protected void Button1_Click(object sender, EventArgs e)
    {
        string input = TextBox1.Text;
        if (!String.IsNullOrEmpty(input))
        {
            User u = UserDAO.GetUserFromSession();
            if (u != null)
            {
                using (LabsDBEntities db = new LabsDBEntities())
                {
                    try
                    {
                        //DiscussionB b = new DiscussionB
                        //{
                        //    labid = u.labid,
                        //    student_id = u.sid,
                        //    topic = input,
                        //    time = DateTime.Now,
                        //    groupid = (int)u.groupid

                        //};
                        //db.DiscussionBs.Add(b);
                        //db.SaveChanges();
                        //TextBox1.Text = "";
                        //try
                        //{
                        //    var query = from x in db.DiscussionBs
                        //                let z = db.Users
                        //                               .Where(y => y.sid == x.student_id)
                        //                               .Select(y => y.nickname).FirstOrDefault()
                        //                where x.labid == u.labid && x.groupid == u.groupid
                        //                select new
                        //                {
                        //                    topic = "<pre>" + x.topic + "</pre>",
                        //                    student_id = x.student_id,
                        //                    time = x.time,
                        //                    nickname = z
                        //                };
                        //    GridView1.DataSource = query.OrderByDescending(c => c.time).ToList();
                        //    GridView1.DataBind();

                        //}
                        //catch (Exception)
                        //{


                        //}

                    }
                    catch (Exception)
                    {


                    }
                }
            }
        }
    }
}