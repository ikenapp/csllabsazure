using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DeleteLab : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String lab_id = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";
        Label1.Text = "";
        String ln = "<br>";
        if (!Page.IsPostBack)
        {
            if (String.IsNullOrEmpty(lab_id)) {
                Label1.Text += "Use ?labid=xx to delete lab settings";
                return;
            }
            
            int lid = int.Parse(lab_id);
            Label1.Text += "Delete Labid = "+lab_id+ln;
            using (LabsDBEntities db = new LabsDBEntities())
            {
                var lab = db.Labs.Where(c => c.sid == lid).First();
                
                try
                {
                    Label1.Text += "Delete Answers : " + db.Answers.Where(c => c.labid == lid).Count() + " records." + ln;
                    foreach (Answer ans in db.Answers.Where(c => c.labid == lid))
                    {
                        db.Answers.Remove(ans);
                    }
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    Label1.Text +="Delete Answers Error: "+ ex.Message+ln;

                }

                try
                {
                    Label1.Text += "Delete Scale Answers : " + db.ScaleAnswers.Where(c => c.labid == lid).Count() + " records." + ln;
                    foreach (ScaleAnswer ans in db.ScaleAnswers.Where(c => c.labid == lid))
                    {
                        db.ScaleAnswers.Remove(ans);
                    }
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    Label1.Text += "Delete Scale Answers Error: " + ex.Message + ln;

                }

                try
                {
                    Label1.Text += "Delete Status : " + db.Status.Where(c => c.labid == lid).Count() + " records." + ln;
                    foreach (Status status in db.Status.Where(c => c.labid == lid))
                    {
                        db.Status.Remove(status);
                    }
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    Label1.Text += "Delete Status Error: " + ex.Message + ln;

                }

                try
                {
                    Label1.Text += "Delete Discussion B : " + db.DiscussionBs.Where(c => c.labid == lid).Count() + " records." + ln;
                    foreach (DiscussionB b in db.DiscussionBs.Where(c => c.labid == lid))
                    {
                        db.DiscussionBs.Remove(b);
                    }
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    Label1.Text += "Delete Discussion B Error: " + ex.Message + ln;

                }
                try
                {
                    Label1.Text += "Delete Discussion A : " + db.DiscussionAs.Where(c => c.labid == lid).Count() + " records." + ln;
                    foreach (DiscussionA a in db.DiscussionAs.Where(c => c.labid == lid))
                    {
                        try
                        {
                            foreach (DiscussionAFeedback afb in db.DiscussionAFeedbacks.Where(c => c.discuss_id == a.sid))
                            {
                                db.DiscussionAFeedbacks.Remove(afb);
                            }
                            db.SaveChanges();
                        }
                        catch (Exception ex)
                        {
                            Label1.Text += "Delete DiscussionAFeedback Error: " + ex.Message + ln;

                        }
                        db.DiscussionAs.Remove(a);
                        
                    }
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    Label1.Text += "Delete Discussion A Error: " + ex.Message + ln;

                }

                try
                {
                    Label1.Text += "Delete Surveys : " + db.Surveys.Where(c => c.labid == lid).Count() + " records." + ln;
                    foreach (Survey a in db.Surveys.Where(c => c.labid == lid))
                    {
                        try
                        {
                            Label1.Text += "Delete Questions[ "+a.surveyid+"] : " + db.Questions.Where(c => c.survryid == a.sid).Count() + " records." + ln;
                            foreach (Question q in db.Questions.Where(c => c.survryid == a.sid))
                            {
                                db.Questions.Remove(q);
                            }
                            db.SaveChanges();
                        }
                        catch (Exception ex)
                        {
                            Label1.Text += "Delete Surveys Error: " + ex.Message + ln;

                        }
                        db.Surveys.Remove(a);

                    }
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    Label1.Text += "Delete Surveys Error: " + ex.Message + ln;

                }

                try
                {
                    Label1.Text += "Delete Users : " + db.Users.Where(c => c.labid == lid).Count() + " records." + ln;
                    foreach (User a in db.Users.Where(c => c.labid == lid))
                    {
                        db.Users.Remove(a);
                    }
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    Label1.Text += "Delete Surveys Error: " + ex.Message + ln;

                }

                try
                {
                    Label1.Text += "Delete Lab : LabId = " + lid+ ln;
                    Lab lab1 = db.Labs.Where(c => c.sid == lid).First();
                    db.Labs.Remove(lab1);
                    
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    Label1.Text += "Delete Surveys Error: " + ex.Message + ln;

                }
            }
        }


      
    }
}