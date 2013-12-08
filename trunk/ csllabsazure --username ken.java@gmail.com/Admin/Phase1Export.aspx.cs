using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Phase1Export : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ExerciseExport_Click(object sender, EventArgs e)
    {

    }
    protected void SelfEvalExport_Click(object sender, EventArgs e)
    {
        String labid = Request.QueryString["labid"];
        if (!String.IsNullOrEmpty(labid))
        {
            int lab_id = int.Parse(labid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                Lab lab = db.Labs.Where(c => c.sid == lab_id).First();
                ReportUtils.genScaleReport(12, lab.name + "_" + lab_id + "_PHASE1_SELFEVAL");
            }
        }
        //String labid = Request.QueryString["labid"];
        //if (!String.IsNullOrEmpty(labid))
        //{
        //    int lab_id = int.Parse(labid);
        //    using (LabsDBEntities db = new LabsDBEntities())
        //    {
        //        Lab lab = db.Labs.Where(c => c.sid == lab_id).First();
        //        Survey s = db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 12).First();
        //        var dataTable = s;
        //        StringBuilder builder = new StringBuilder();
        //        List<string> columnNames = new List<string>();
        //        List<string> rows = new List<string>();
        //        List<int> qids = new List<int>();
        //        columnNames.Add("Student");
        //        columnNames.Add("Gender");
        //        int count = 0;
        //        for (int i = 0; i < s.Questions.Count; i++)
        //        {
        //            Question q = s.Questions.ElementAt(i);
        //            if (q.no % 100 != 0)
        //            {
        //                count++;
        //                columnNames.Add("Q" + count);
        //                qids.Add(q.sid);
        //            }
        //        }

        //        builder.Append(string.Join(",", columnNames.ToArray())).Append("\n");
        //        var Users = db.Users.Where(c => c.labid == lab_id);
        //        foreach (User u in Users)
        //        {
        //            rows = new List<string>();
        //            rows.Add(u.student_id);
        //            rows.Add(u.gender);
        //            foreach (int qid in qids)
        //            {
        //                String answer;
        //                try
        //                {
        //                    ScaleAnswer ans = db.ScaleAnswers.Where(c => c.labid == lab_id && c.qid == qid && c.studentid == u.sid && c.surveyid == s.sid).First();
        //                    answer = (int)ans.rank + "";
        //                }
        //                catch (Exception)
        //                {
        //                    answer = "0";
        //                }
        //                rows.Add(answer);
        //            }

        //            builder.Append(string.Join(",", rows.ToArray())).Append("\n");

        //        }

        //        Response.Clear();
        //        Response.ContentType = "text/csv";
        //        Response.AddHeader("Content-Disposition", "attachment;filename=PHASE1_SELFEVAL_" + lab.name + "_" + lab_id + ".csv");
        //        Response.Write(builder.ToString());
        //        Response.End();

        //    }
        //}
    }
}