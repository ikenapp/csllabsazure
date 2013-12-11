using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Discussion_CExport : System.Web.UI.Page
{
    public string pre = "<pre class='answerLabel'>";
    public string pre_end = "</pre>";
    public String question_start = "<b class='questionLabel'>";
    public String question_end = "</b>";
    protected void Page_Load(object sender, EventArgs e)
    {

        StringBuilder sb = new StringBuilder();
        int lab_id = int.Parse(Request.Params["labid"]);
        int survey_id = -1; ;
        string ln = "<br>";

        using (LabsDBEntities db = new LabsDBEntities())
        {
            foreach (var s in db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 23))
            {
                survey_id = s.sid;
                break;
            }
            var users = db.Users.Where(c => c.labid == lab_id && c.group == "C").OrderBy(c => c.student_id);
            foreach (User user in users)
            {
                sb.Append("學號: " + user.student_id+ln);
                var answers = db.Answers.Where(c => c.surveyid == survey_id && c.labid == lab_id && c.studentid == user.sid && c.phase == "PartB1" && c.rank == null).OrderBy(c => c.qid);
                int count = 1;
                foreach (var ans in answers)
                {
                    {
                        var q = db.Questions.Where(c => c.sid == ans.qid).First();
                        sb.Append(question_start + "題目" + count + " :　" + q.question1 + question_end + ln);
                        sb.Append(question_start + "內容 : " + question_end + pre + ans.contents + pre_end + ln);
                        count++;
                    }

                    sb.Append(ln);

                }
                sb.Append("<hr>");
                sb.Append(ln);

            }
        }


        Preview.Text = sb.ToString();


    }
}