using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Exercise_Phase2_SelfEvaluation3 : System.Web.UI.Page
{
    String labid = "";
    int survey_id;
    public bool isShow = false;
    public String message = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        labid = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";
        if (String.IsNullOrEmpty(labid))
        {
            LabInfo.Text = "網路發生不可預期錯誤.請重新登入再試!";
            return;
        }
        //BackLink.Visible = true;
        //BackLink.NavigateUrl = "~/Exercise/Phase1/SelfEvalution2.aspx?labid=" + labid + "&surveyid=" + Request.QueryString["surveyid"];

        survey_id = int.Parse(Request.QueryString["surveyid"]);
        if (!Page.IsPostBack)
        {
            bool isError = false;
            int lab_id = int.Parse(this.labid);
            User u = UserDAO.GetUserFromSession();
            if (u != null)
            {
                LabInfo.Text = String.Format("姓名 : {0} 學號 : {1} 學校 : {2} 系所 : {3}", u.name, u.student_id, u.school, u.dept);
                using (LabsDBEntities db = new LabsDBEntities())
                {
                    try
                    {
                        var survey = db.Surveys.Where(c => c.labid == u.labid && c.surveyid == 22).First();
                        var question2 = db.Questions.Where(c => c.survryid == survey.sid && c.no == 300).First();
                        Part2Title.Text = "三、" + question2.question1;

                        isError = false;

                    }
                    catch (Exception)
                    {


                    }
                }
            }
            if (isError)
            {
                Response.Write("網路發生不可預期錯誤.請重新登入再試!");
                return;
            }
        }

    }



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ROW_SAVE")
        {
            int row = int.Parse(e.CommandArgument.ToString());
            saveRow(row);
        }

    }

    private void saveRow(int row)
    {
        GridViewRow gRow = GridView1.Rows[row];
        Label msg = gRow.FindControl("MsgLabel") as Label;
        msg.Text = "";
        User u = UserDAO.GetUserFromSession();
        if (u != null)
        {
            HiddenField hf = gRow.FindControl("qid") as HiddenField;
            int q_id = int.Parse(hf.Value);
            TextBox answerTB = gRow.FindControl("Answer") as TextBox;
            string answerText = HttpUtility.HtmlEncode(answerTB.Text);
            int lab_id = int.Parse(labid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {
                    var ans = db.Answers.Where(c => c.labid == lab_id && c.surveyid == survey_id && c.studentid == u.sid && c.qid == q_id && c.phase == "PartB2E").First();
                    ans.contents = answerText;
                }
                catch (Exception)
                {
                    Answer ans = new Answer
                    {
                        labid = lab_id,
                        surveyid = survey_id,
                        studentid = u.sid,
                        qid = q_id,
                        phase = "PartB2E",
                        contents = answerText
                    };
                    db.Answers.Add(ans);
                }
                db.SaveChanges();
                msg.Text = "儲存成功";
            }
        }
    }
    protected void SaveAll_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();
        int rows = GridView1.Rows.Count;
        bool isError = false;
        for (int i = 0; i < rows; i++)
        {
            GridViewRow gRow = GridView1.Rows[i];
            TextBox answerTB = gRow.FindControl("Answer") as TextBox;
            if (answerTB.Text.Trim() != "")
            {
                saveRow(i);
            }
            else
            {
                isError = true;
                sb.Append((i + 1) + ", ");

            }
        }
        if (isError)
        {
            isShow = true;
            message = "題號 : " + sb.ToString() + " 請記得填寫!";
        }
        else
        {
            User u = UserDAO.GetUserFromSession();
            if (u != null)
            {
                int lab_id2 = int.Parse(labid);
                using (LabsDBEntities db = new LabsDBEntities())
                {
                    UserDAO.SaveStatus(u, db, "PartB2E");
                }
            }
            Response.Redirect("~/Exercise/Phase2/SelfEvalDone.aspx");
        }

    }
}