﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Discussion_DiscussionB : System.Web.UI.Page
{

    string hln = "<br>";
    public int timeLeft=89;
    public int no = 1;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        User u = UserDAO.GetUserFromSession();
        GridView1.GridLines = GridLines.None;
        bool isError = true;
        if (u != null)
        {
            if (Application[u.labid + "_limit"] != null)
            {
                DateTime limit = (DateTime)Application[u.labid + "_limit"];
                if (limit != null)
                {
                    timeLeft = (int)((limit - UserDAO.GetNow()).TotalSeconds);
                    timeLeft = timeLeft < 0 ? 0 : timeLeft;
                }
            }
            Literal1.Text = u.nickname+"<br>"; 
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {
                    
                    {
                        if (!Page.IsPostBack)
                        {
                            Button2.ForeColor = Color.Red;
                        }
                        if (!String.IsNullOrEmpty(Request.Form[Button3.ClientID]) || Request.Form[HiddenField1.ClientID] == "2" && String.IsNullOrEmpty(Request.Form[Button2.ClientID]))
                        {
                            no = 2;
                            HiddenField1.Value = "2";
                            Button3.ForeColor = Color.Red;
                            Button2.ForeColor = Color.Black;
                            Button3.Visible = false;
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
                        TitleLabel.Text = ConfigurationManager.AppSettings["Discussion_B_Title"+no];
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
                        if (!Page.IsPostBack)
                            UserDAO.SaveStatusB1(u, db);

                        isError = false;
                    }
                    if (String.IsNullOrEmpty(Request.Form[Button1.ClientID]) && String.IsNullOrEmpty(Request.Form[Button2.ClientID]) && String.IsNullOrEmpty(Request.Form[Button3.ClientID]))
                    {
                        try
                        {
                            var query = from x in db.DiscussionBs
                                        let z = db.Users
                                                       .Where(y => y.sid == x.student_id)
                                                       .Select(y => y.nickname).FirstOrDefault()
                                        where x.labid==u.labid && x.groupid==u.groupid && x.num == no
                                        select new
                                        {
                                            topic = "<pre>" + x.topic + "</pre>",
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
                        DateTime now = UserDAO.GetNow();
                        DiscussionB b = new DiscussionB
                        {
                            labid= u.labid,
                            student_id = u.sid,
                            topic= input,
                            time = now,
                            groupid=(int)u.groupid,
                            num = no

                        };
                        db.DiscussionBs.Add(b);
                        db.SaveChanges();
                        TextBox1.Text = "";
                        try
                        {
                            var query = from x in db.DiscussionBs
                                        let z = db.Users
                                                       .Where(y => y.sid == x.student_id)
                                                       .Select(y => y.nickname).FirstOrDefault()
                                        where x.labid == u.labid && x.groupid == u.groupid && x.num == no
                                        select new
                                        {
                                            topic = "<pre>" + x.topic + "</pre>",
                                            student_id = x.student_id,
                                            time =  x.time ,
                                            nickname = z
                                        };
                            GridView1.DataSource = query.OrderBy(c => c.time).ToList();
                            GridView1.DataBind();

                        }
                        catch (Exception)
                        {


                        }
        
                    }
                    catch (Exception)
                    {


                    }
                }
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button2.ForeColor = Color.Red;
        Button3.ForeColor = Color.Black;
        no = 1;
        HiddenField1.Value = "1";
        Page_Load2(sender, e);
    }

    private void Page_Load2(object sender, EventArgs e)
    {
        User u = UserDAO.GetUserFromSession();
        if (u != null)
        {
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {
                    var query = from x in db.DiscussionBs
                                let z = db.Users
                                               .Where(y => y.sid == x.student_id)
                                               .Select(y => y.nickname).FirstOrDefault()
                                where x.labid == u.labid && x.groupid == u.groupid && x.num == no
                                select new
                                {
                                    topic = "<pre>" + x.topic + "</pre>",
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
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button3.ForeColor = Color.Red;
        Button2.ForeColor = Color.Black;
        no = 2;
        HiddenField1.Value = "2";
        Page_Load2(sender, e);
        (sender as Button).Visible = false;
    }
}