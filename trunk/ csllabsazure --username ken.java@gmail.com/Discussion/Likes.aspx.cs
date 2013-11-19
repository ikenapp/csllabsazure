using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Discussion_Likes : System.Web.UI.Page
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
                try
                {

                    var feedbackA = db.DiscussionAFeedbacks.Where(c => c.student_id == u.sid && c.discuss_id == feedbackId).First();
                    if (feedbackA != null)
                    {
                        if (feedbackA.gfeedback == "Y")
                        {
                            feedbackA.gfeedback = null;
                        }
                        else
                        {
                            feedbackA.gfeedback = "Y";
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
                            gfeedback = "Y"
                        };
                        db.DiscussionAFeedbacks.Add(feedback);
                        db.SaveChanges();
                    }
                }
            }
        }
      

    }
}