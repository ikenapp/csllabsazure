using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Discussion_Questions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User u = UserDAO.GetUserFromSession();
        if (u != null)
        {
            using (LabsDBEntities db = new LabsDBEntities())
            {
                int feedbackId = -1;
                int.TryParse(Request.QueryString["feedbackId"], out feedbackId);
                int no = 1;
                int.TryParse(Request.QueryString["num"], out no);
                try
                {

                    var feedbackA = db.DiscussionAFeedbacks.Where(c => c.student_id == u.sid && c.discuss_id == feedbackId && c.num == no).First();
                    if (feedbackA != null)
                    {
                        if (feedbackA.qfeedback == "Y")
                        {
                            feedbackA.qfeedback = null;
                        }
                        else
                        {
                            feedbackA.qfeedback = "Y";
                        }
                        db.SaveChanges();
                    }
                }
                catch (Exception)
                {

                    if (feedbackId != -1)
                    {
                        DiscussionAFeedback feedback = new DiscussionAFeedback
                        {
                            discuss_id = feedbackId,
                            student_id = u.sid,
                            qfeedback = "Y",
                            num = no
                        };
                        db.DiscussionAFeedbacks.Add(feedback);
                        db.SaveChanges();
                    }
                }
            }
        }


    }
}