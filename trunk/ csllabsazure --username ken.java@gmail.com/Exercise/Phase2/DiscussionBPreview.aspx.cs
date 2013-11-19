using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class DiscussionBPreview : System.Web.UI.Page
{
    string hln = "<br>";
    protected void Page_Load(object sender, EventArgs e)
    {
        User u = UserDAO.GetUserFromSession();
        GridView1.GridLines = GridLines.None;
        bool isError = true;
        if (u != null)
        {
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {

                    {
                        //From DB?
                        TitleLabel.Text = ConfigurationManager.AppSettings["Discussion_B_Title"];
                        var users = db.Users.Where(c => c.groupid == u.groupid && c.group == u.group && c.labid == u.labid).Select(c => c.nickname);
                        GroupInfo.Text = "聯絡人 : " + hln;
                        foreach (var uu in users)
                        {
                            if (uu == u.nickname)
                            {
                                continue;
                            }
                            GroupInfo.Text += "&nbsp;&nbsp;" + uu + hln;
                        }
                        if (!Page.IsPostBack)
                            UserDAO.SaveStatusB1(u, db);

                        isError = false;
                    }

                    try
                    {
                        var query = from x in db.DiscussionBs
                                    let z = db.Users
                                                   .Where(y => y.sid == x.student_id)
                                                   .Select(y => y.nickname).FirstOrDefault()
                                    where x.labid == u.labid && x.groupid == u.groupid
                                    select new
                                    {
                                        topic = "<pre>" + x.topic + "</pre>",
                                        student_id = x.student_id,
                                        time = x.time,
                                        nickname = z
                                    };
                        GridView1.DataSource = query.OrderByDescending(c => c.time).ToList();
                        GridView1.DataBind();
                    }
                    catch (Exception)
                    {


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