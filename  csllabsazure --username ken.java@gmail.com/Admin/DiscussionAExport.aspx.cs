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

public partial class Phase2_DiscussionAExport : System.Web.UI.Page
{
    string ln = "<br>";
    public String question_start = "<b style='color:red'>";
    public String question_end = "</b>";
    protected void Page_Load(object sender, EventArgs e)
    {

        StringBuilder sb = new StringBuilder();
        int lab_id = int.Parse(Request.Params["labid"]);

        using (LabsDBEntities db = new LabsDBEntities())
        {
            try
            {

               var skyegroups = db.Users.Where(c => c.labid == lab_id && c.group == "A").Select(c => c.groupid).OrderBy(c => c).Distinct();
               foreach (int gid in skyegroups)
               {
                   var users = db.Users.Where(c => c.groupid == gid && c.group == "A" && c.labid == lab_id).Select(c => c.student_id);
                   sb.Append("<b style='color:green'>第" + gid + "  組組員</b>:<b> ");
                   foreach (var uu in users)
                   {
                       sb.Append(uu + " ");
                   }
                   sb.Append("</b>" + ln);
                   for (int i = 1; i < 3; i++)
                   {
                       sb.Append(question_start + "第" + i + "題" + question_end + ln);
                       var query = from x in db.DiscussionAs
                                    let z = db.Users
                                                   .Where(y => y.sid == x.student_id)
                                                   .Select(y => y.student_id).FirstOrDefault()
                                    where x.labid == lab_id && x.groupid == gid && x.topicid == null && x.num == i
                                    orderby x.time
                                    select new
                                    {
                                        topic = "<pre style='color:blue'>" + x.topic + "</pre>",
                                        time = x.time,
                                        disid = x.sid,
                                        student_id = z,
                                        likes = db.DiscussionAFeedbacks.Where(f => f.discuss_id == x.sid && f.gfeedback == "Y").Count(),
                                        questions = db.DiscussionAFeedbacks.Where(f => f.discuss_id == x.sid && f.qfeedback == "Y").Count()
                                    };
                       
                       foreach(var mainq in query){
                           sb.Append("<b>" + mainq.student_id + "</b>[" + mainq.time + "]" + " 讚["+mainq.likes+"] 質疑["+mainq.questions+"]"+ mainq.topic+ln);
                           var subquery = from x1 in db.DiscussionAs
                                           let z1 = db.Users
                                                          .Where(y1 => y1.sid == x1.student_id)
                                                          .Select(y1 => y1.student_id).FirstOrDefault()
                                          where x1.labid == lab_id && x1.groupid == gid && x1.topicid == mainq.disid && x1.num == i
                                           select new
                                           {
                                               topic = "<pre style='color:blue;margin-left:30px;'>" + x1.topic + "</pre>",
                                               student_id = z1,
                                               time = x1.time,
                                               disid = mainq.disid,
                                               likes = db.DiscussionAFeedbacks.Where(f => f.discuss_id == mainq.disid && f.gfeedback == "Y").Count(),
                                               questions = db.DiscussionAFeedbacks.Where(f => f.discuss_id == mainq.disid && f.qfeedback == "Y").Count()
                                           };
                           foreach (var subq in subquery)
                           {
                               sb.Append("<b style='margin-left:30px;'>" + subq.student_id + "</b>[" + subq.time + "]" + " 讚[" + subq.likes + "] 質疑[" + subq.questions + "]" + subq.topic + ln);
                           }
                       }
                   }
                   sb.Append("<hr>");
                   sb.Append(ln);
               }
               Preview.Text = sb.ToString();
            }
            catch (Exception)
            {


            }
        }
    }
}
