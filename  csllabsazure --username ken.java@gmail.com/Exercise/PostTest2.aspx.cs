using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Exercise_PostTest2 : System.Web.UI.Page
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
            if (Session["isLogin"] != null && Session["isLogin"].ToString() == "Y")
            {
                if (Session["USER_DATA"] != null)
                {
                    User u = Session["USER_DATA"] as User;
                    if (u != null)
                    {
                        LabInfo.Text = String.Format("姓名 : {0} 學號 : {1} 學校 : {2} 系所 : {3}", u.name, u.student_id, u.school, u.dept);
                        isError = false;
                        student_id = u.sid;
                    }
                    int svid = int.Parse(surveyid);
                    using (LabsDBEntities db = new LabsDBEntities())
                    {
                        var question = db.Questions.Where(c => c.survryid == svid & c.no == 200).First();
                        desc.Text = question.question1;
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
    protected void FinishButton_Click(object sender, EventArgs e)
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
                RadioButtonList rlist = row.FindControl("RadioButtonList1") as RadioButtonList;
                HiddenField hf = row.FindControl("questionid") as HiddenField;
                int q_id = int.Parse(hf.Value);
                if (rlist.SelectedIndex == -1)
                {
                    sb.Append(no + ", ");
                }
                else
                {
                    int val = int.Parse(rlist.SelectedValue);

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
                if (Session["isLogin"] != null && Session["isLogin"].ToString() == "Y")
                {
                    if (Session["USER_DATA"] != null)
                    {
                        User u = Session["USER_DATA"] as User;
                        if (u != null)
                        {
                            try
                            {

                                var status = db.Status.Where(c => c.labid == lab_id && c.studentid == u.sid && c.phase == "Final").First();
                                status.done = true;
                            }
                            catch (Exception ex)
                            {

                                Status ans = new Status
                                {
                                    labid = lab_id,
                                    studentid = u.sid,
                                    phase = "Final",
                                    done = true
                                    
                                };
                                db.Status.Add(ans);
                            }
                        }

                    }

                }
                db.SaveChanges();
                Response.Redirect("~/Exercise/PostTest3.aspx?surveyid=" + surveyid + "&labid=" + labid);
            }
        }
    }
}