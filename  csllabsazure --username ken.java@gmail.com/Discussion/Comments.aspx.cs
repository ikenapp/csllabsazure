using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Discussion_Comments : System.Web.UI.Page
{
    String feedback = "<tr><td><tr>" +
                 "<th width='90' scope='col' valign='top'><p><img src='icon.jpg' width='80' height='70'/>" +
                   "<p>&nbsp;</p></th>" +
                 "<th width='560' scope='col'><table width='560' border='0' align='left'>" +
                   "<tr >" +
                     "<th scope='col'>" +
                     "<div class='reply-name' align='left' >{0}</div>" +//Nickname
                     "</th>" +
                   "</tr>" +
                   "<tr>" +
                     "<td>" +
                     "<div class='reply-cont' align='left' >{1}</div>" +//Feedback
                     "</td>" +
                   "</tr>" +
                   "<tr>" +
                      "<td align='left'>{7:tt hh:mm:ss}&nbsp;&nbsp;&nbsp" + 
                      "<a href='javascript:void()' onclick='pressLike(this,\"{2}\")'>{3}</a> <img src='like.png' height='20' width='20'> <span class='display'>{4}</span>&nbsp;&nbsp;&nbsp;" +
                     "<a href='javascript:void()' onclick='pressQuestions(this,\"{2}\")'>{5}</a> <img src='question.png' height='16' width='16'> <span class='display'>{6}</span>&nbsp;&nbsp;&nbsp;" +
                     "</td></tr>" +
                 "</table></th>" +
               "</tr></td></tr>";
    protected void Page_Load(object sender, EventArgs e)
    {
        User u = UserDAO.GetUserFromSession();
        if (u != null)
        {
            using (LabsDBEntities db = new LabsDBEntities())
            {
                int feedbackId = -1;
                int.TryParse(Request.QueryString["feedbackId"], out feedbackId);
                if (feedbackId != -1)
                {

                    String input = Request.QueryString["comments"];
                    if (String.IsNullOrEmpty(input))
                    {
                        return;
                    }
                    try
                    {
                        DateTime now = UserDAO.GetNow();
                        DiscussionA sub = new DiscussionA
                        {
                            labid = u.labid,
                            student_id = u.sid,
                            topic = input,
                            time = now,
                            topicid = feedbackId,
                            groupid = (int)u.groupid

                        };
                        db.DiscussionAs.Add(sub);
                        db.SaveChanges();
                        Response.AddHeader("content-type", "application/text");
                        Response.Write(String.Format(feedback, u.nickname, sub.topic, sub.sid, "讚", 0 , "質疑", 0, sub.time));
                                

                    }
                    catch (Exception)
                    {


                    }

                }
            }
        }

    }
}