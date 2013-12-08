using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for ReportUtils
/// </summary>
public class ReportUtils
{
	public ReportUtils()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void genScaleReport(int surveyid,String fileName)
    {
        String labid = HttpContext.Current.Request.QueryString["labid"];
        if (!String.IsNullOrEmpty(labid))
        {
            int lab_id = int.Parse(labid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                Lab lab = db.Labs.Where(c => c.sid == lab_id).First();
                Survey s = db.Surveys.Where(c => c.labid == lab_id && c.surveyid == surveyid).First();
                var dataTable = s;
                StringBuilder builder = new StringBuilder();
                List<string> columnNames = new List<string>();
                List<string> rows = new List<string>();
                List<int> qids = new List<int>();
                columnNames.Add("Student");
                columnNames.Add("Gender");
                int count = 0;
                for (int i = 0; i < s.Questions.Count; i++)
                {
                    Question q = s.Questions.ElementAt(i);
                    if (q.no % 100 != 0)
                    {
                        count++;
                        columnNames.Add("Q" + count);
                        qids.Add(q.sid);
                    }
                }

                builder.Append(string.Join(",", columnNames.ToArray())).Append("\n");
                var Users = db.Users.Where(c => c.labid == lab_id);
                foreach (User u in Users)
                {
                    rows = new List<string>();
                    rows.Add(u.student_id);
                    rows.Add(u.gender);
                    foreach (int qid in qids)
                    {
                        String answer;
                        try
                        {
                            ScaleAnswer ans = db.ScaleAnswers.Where(c => c.labid == lab_id && c.qid == qid && c.studentid == u.sid && c.surveyid == s.sid).First();
                            answer = (int)ans.rank + "";
                        }
                        catch (Exception)
                        {
                            answer = "0";
                        }
                        rows.Add(answer);
                    }

                    builder.Append(string.Join(",", rows.ToArray())).Append("\n");

                }

                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.ContentType = "text/csv";
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName + ".csv");
                HttpContext.Current.Response.Write(builder.ToString());
                HttpContext.Current.Response.End();

            }
        }
    }
}