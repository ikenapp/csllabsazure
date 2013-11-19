using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Exercise_Phase2_DiscussionAPreview : System.Web.UI.Page
{
    string hln = "<br>";
    string maintopic = "<div class='post' align='left'>" +
             "<table width='977' border='0' >" +
               "<tr valign='top'>" +
                 "<th width='90' height='80'  scope='col'><img src='../../Discussion/icon.jpg' width='85' height='75'/></th>" +
                 "<th width='850' scope='col'  align='left'>" +
                 "<table  border='0'>" +
                   "<tr>" +
                     "<th width='856' scope='col'>" +
                     "<div class='fbpost-name' align='left' >" +
                     "{0}" +//NickName
                     "</div>" +
                     "</th>" +
                   "</tr>" +
                   "<tr>" +
                     "<td>" +
                     "<div class='fbpost-cont' align='left' >" +
                     "{1}" +//Topic
                     "</td>" +
                   "</tr>" +
                   "<tr>" +
                     "<td>" +
                     "<div align='left' class='fb'>" +
                     "{3} <img src='../../Discussion/like.png' height='20' width='20'> <span class='display'>{4}</span>&nbsp;&nbsp;&nbsp;" +
                     "{5} <img src='../../Discussion/question.png' height='16' width='16'> <span class='display'>{6}</span>&nbsp;&nbsp;&nbsp;{7:tt hh:mm:ss}" +
                     "<p>&nbsp;</p>" +
                     "</td>" +
                   "</tr>" +
                 "</table>" +
                 "</th>" +
               "</tr>" +
               "</table>" +
           "</div>";

    string feedbackStart = "<div class='reply' align='left'><table width='560'border='0'>";
    string feedback = "<tr>" +
                 "<th width='90' scope='col' valign='top'><p><img src='../../Discussion/icon.jpg' width='80' height='70'/>" +
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
                      "{3} <img src='../../Discussion/like.png' height='20' width='20'> <span class='display'>{4}</span>&nbsp;&nbsp;&nbsp;" +
                     "{5} <img src='../../Discussion/question.png' height='16' width='16'> <span class='display'>{6}</span>&nbsp;&nbsp;&nbsp;" +
                     "</td></tr>" +
                 "</table></th>" +
               "</tr>";
    string feedbackEnd = " </table></div>";
    protected void Page_Load(object sender, EventArgs e)
    {
        User u = UserDAO.GetUserFromSession();
        //GridView1.GridLines = GridLines.None;
        //bool isError = true;
        if (u != null)
        {

            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {

                    //From DB?
                    if (Session["GROUP"] == null)
                    {
                        TitleLabel.Text = ConfigurationManager.AppSettings["Discussion_A_Title"];
                        var users = db.Users.Where(c => c.groupid == u.groupid && c.group == u.group && c.labid == u.labid).Select(c => c.nickname);
                        GroupInfo.Text = "<br>";//"本組成員 : " + hln;
                        foreach (var uu in users)
                        {
                            GroupInfo.Text += "&nbsp;&nbsp;" + uu + hln;
                        }
                        Session["GROUP"] = GroupInfo.Text;
                        UserDAO.SaveStatusB1(u, db);

                    }
                    else
                    {
                        TitleLabel.Text = ConfigurationManager.AppSettings["Discussion_A_Title"];
                        GroupInfo.Text = Session["GROUP"] as String;
                    }





                    try
                    {
                        if (Session["DISPLAYTEXT"] == null)
                        {
                            var query = from x in db.DiscussionAs
                                        let z = db.Users
                                                       .Where(y => y.sid == x.student_id)
                                                       .Select(y => y.nickname).FirstOrDefault()
                                        where x.labid == u.labid && x.groupid == u.groupid && x.topicid == null
                                        select new
                                        {
                                            topic = x.topic,
                                            student_id = x.student_id,
                                            time = x.time,
                                            disid = x.sid,
                                            nickname = z,
                                            selflikes = db.DiscussionAFeedbacks.Where(f => f.discuss_id == x.sid && f.student_id == u.sid && f.gfeedback == "Y").Count() == 0 ? "讚" : "收回讚",
                                            likes = db.DiscussionAFeedbacks.Where(f => f.discuss_id == x.sid && f.gfeedback == "Y").Count(),
                                            selfquestions = db.DiscussionAFeedbacks.Where(f => f.discuss_id == x.sid && f.student_id == u.sid && f.qfeedback == "Y").Count() == 0 ? "質疑" : "不質疑",
                                            questions = db.DiscussionAFeedbacks.Where(f => f.discuss_id == x.sid && f.qfeedback == "Y").Count()
                                        };
                            Literal1.Text = "";
                            foreach (var main in query.OrderByDescending(c => c.time))
                            {
                                Literal1.Text += String.Format(maintopic, main.nickname, main.topic, main.disid, main.selflikes, main.likes, main.selfquestions, main.questions, main.time);
                                var subquery = from x1 in db.DiscussionAs
                                               let z1 = db.Users
                                                              .Where(y1 => y1.sid == x1.student_id)
                                                              .Select(y1 => y1.nickname).FirstOrDefault()
                                               where x1.labid == u.labid && x1.groupid == u.groupid && x1.topicid == main.disid
                                               select new
                                               {
                                                   topic = x1.topic,
                                                   student_id = x1.student_id,
                                                   time = x1.time,
                                                   disid = main.disid,
                                                   nickname = z1,
                                                   selflikes = db.DiscussionAFeedbacks.Where(f => f.discuss_id == main.disid && f.student_id == u.sid && f.gfeedback == "Y").Count() == 0 ? "讚" : "收回讚",
                                                   likes = db.DiscussionAFeedbacks.Where(f => f.discuss_id == main.disid && f.gfeedback == "Y").Count(),
                                                   selfquestions = db.DiscussionAFeedbacks.Where(f => f.discuss_id == main.disid && f.student_id == u.sid && f.qfeedback == "Y").Count() == 0 ? "質疑" : "不質疑",
                                                   questions = db.DiscussionAFeedbacks.Where(f => f.discuss_id == main.disid && f.qfeedback == "Y").Count()
                                               };
                                if (subquery != null && subquery.Count() > 0)
                                {
                                    Literal1.Text += feedbackStart;
                                    foreach (var sub in subquery.OrderByDescending(c => c.time))
                                    {
                                        Literal1.Text += String.Format(feedback, sub.nickname, sub.topic, sub.disid, sub.selflikes, sub.likes, sub.selfquestions, sub.questions, sub.time);

                                    }
                                    Literal1.Text += feedbackEnd;
                                }
                                Session["DISPLAYTEXT"] = Literal1.Text;
                            }

                        }
                        else
                        {
                            Literal1.Text = Session["DISPLAYTEXT"] as String;
                        }

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
                






   