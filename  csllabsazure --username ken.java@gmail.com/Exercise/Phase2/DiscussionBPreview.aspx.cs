using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class DiscussionBPreview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        User u = UserDAO.GetUserFromSession();
        if (u != null)
        {
            if (Session["PartB1B"] == null)
            {
                StringBuilder sb = new StringBuilder();
                int lab_id = u.labid;
                int survey_id = -1; ;
                using (LabsDBEntities db = new LabsDBEntities())
                {
                    foreach (var s in db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 11))
                    {
                        survey_id = s.sid;
                        break;
                    }
                    //var answers = db.DiscussionBs.Where(c => c.labid == lab_id && c.student_id == u.sid && c.groupid == u.groupid).OrderByDescending(c => c.time);
                     var query = from x in db.DiscussionBs
                                        let z = db.Users
                                                       .Where(y => y.sid == x.student_id)
                                                       .Select(y => y.nickname).FirstOrDefault()
                                        where x.labid==u.labid && x.groupid==u.groupid
                                        select new
                                        {
                                            topic = x.topic,
                                            time = x.time,
                                            nickname = z
                                        };
                    string ln = "<br>";
                    foreach (var ans in query)
                    {
                        sb.Append(" <b>"+ans.nickname+"</b> : <pre>" + ans.topic + "</pre>"+ln);
                        sb.Append(ln);

                    }
                    

                }
                Session["PartB1B"] = sb.ToString();
            }

            Preview.Text = Session["PartB1B"].ToString();
            
        }
    }
}