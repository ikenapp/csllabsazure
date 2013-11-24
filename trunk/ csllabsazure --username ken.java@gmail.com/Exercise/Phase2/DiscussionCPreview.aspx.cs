using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Discussion_CPreview : System.Web.UI.Page
{
    public string pre = "<pre class='answerLabel'>";
    public string pre_end = "</pre>";
    public String question_start = "<b class='questionLabel'>";
    public String question_end = "</b>";
    protected void Page_Load(object sender, EventArgs e)
    {

        User u = UserDAO.GetUserFromSession();
        if (u != null)
        {
            if (Session["PartB1C"] == null)
            {
                StringBuilder sb = new StringBuilder();
                int lab_id = u.labid;
                int survey_id = -1; ;
                string ln = "<br>";
                int count = 1;
                using (LabsDBEntities db = new LabsDBEntities())
                {
                    foreach (var s in db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 23))
                    {
                        survey_id = s.sid;
                        break;
                    }
                    var answers = db.Answers.Where(c => c.surveyid == survey_id && c.labid == lab_id && c.studentid == u.sid && c.phase == "PartB1" && c.rank == null).OrderBy(c => c.qid);
                    foreach (var ans in answers)
                    {                   
                        {
                            var q = db.Questions.Where(c => c.sid == ans.qid).First();
                            sb.Append(question_start + "題目" + count + " :　" + q.question1 + question_end + ln);
                            sb.Append(question_start + "內容 : " +question_end + pre + ans.contents + pre_end + ln);
                            sb.Append("<hr>");
                            sb.Append(ln);
                            count++;
                        }

                        sb.Append(ln);

                    }

                }
                Session["PartB1C"] = sb.ToString();
            }

            Preview.Text = Session["PartB1C"].ToString();

        }
    }
}