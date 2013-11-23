using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Execise_SelfEvaluation : System.Web.UI.Page
{
    String labid = "";
    public bool isShow = false;
    public String message = "";
    int student_id = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        labid = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";
        if (String.IsNullOrEmpty(labid))
        {
            LabInfo.Text = "網路發生不可預期錯誤.請重新登入再試!";
            return;
        }
        //if (!Page.IsPostBack)
        {
            bool isError = true;
            String surveyid = Request.QueryString["surveyid"];
            //NextButton.PostBackUrl += "?surveyid=" + surveyid + "&labid=" + labid;
            User u = UserDAO.GetUserFromSession();
            if (u != null)
            {
                LabInfo.Text = String.Format("姓名 : {0} 學號 : {1} 學校 : {2} 系所 : {3}", u.name, u.student_id, u.school, u.dept);
                isError = false;
                student_id = u.sid;
            }
            int svid = int.Parse(surveyid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                var question = db.Questions.Where(c => c.survryid == svid & c.no == 100).First();
                desc.Text = question.question1;
            }


            if (isError)
            {
                Response.Write("網路發生不可預期錯誤.請重新登入再試!");
                return;
            }


        }




    }
    protected void NextButton_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();
        int no = 1;
        String surveyid = Request.QueryString["surveyid"];
        int svid = int.Parse(surveyid);
        int lab_id = int.Parse(labid);
        using (LabsDBEntities db = new LabsDBEntities())
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                Label hf = row.FindControl("questionid") as Label;
                int q_id = -1;
                try
                {
                    q_id = int.Parse(hf.Text);
                }
                catch
                {
                    q_id = int.Parse(hf.Text.Split(',')[0]);
                }
                bool flag = false;
                int idx = -1;
                for (int i = 1; i <= 6; i++)
                {
                    RadioButton rb = row.FindControl("RadioButton" + i) as RadioButton;
                    if (rb != null && rb.Checked)
                    {
                        flag = true;
                        idx = int.Parse(rb.Text);
                        break;
                    }

                }
                if (!flag)
                {
                    sb.Append(no + ", ");
                }
                else
                {
                    int val = idx;

                    try
                    {

                        var answer = db.ScaleAnswers.Where(c => c.labid == lab_id && c.qid == q_id && c.surveyid == svid).First();
                        answer.rank = val;
                    }
                    catch (Exception ex)
                    {

                        ScaleAnswer ans = new ScaleAnswer
                        {
                            labid = lab_id,
                            surveyid = svid,
                            studentid = student_id,
                            qid = q_id,
                            rank = val
                        };
                        db.ScaleAnswers.Add(ans);
                        //db.SaveChanges();
                    }
                }
                no++;
            }
            if (sb.ToString().Length != 0)
            {
                isShow = true;
                message = "題號 : " + sb.ToString() + " 請記得填寫!";
            }
            else
            {
                isShow = false;
                message = "";
                db.SaveChanges();
                User u = UserDAO.GetUserFromSession();
                if (u != null)
                {
                    int lab_id2 = int.Parse(labid);

                    try
                    {
                        var ans = db.Status.Where(c => c.labid == lab_id2 && c.studentid == u.sid && c.phase == "PartAE").First();
                        ans.done = true;

                    }
                    catch (Exception)
                    {
                        Status ans = new Status
                        {
                            labid = lab_id2,
                            studentid = u.sid,
                            phase = "PartAE",
                            done = true
                        };
                        db.Status.Add(ans);

                    }
                    db.SaveChanges();

                }
                //Response.Redirect("~/Exercise/Phase1/SelfEvaluation2.aspx?surveyid=" + surveyid + "&labid=" + labid);
                Response.Redirect("~/Exercise/Phase1/SelfEvalDone.aspx");
            }
        }
    }
}