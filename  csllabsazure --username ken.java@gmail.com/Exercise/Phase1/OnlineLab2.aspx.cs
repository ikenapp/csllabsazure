using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Execise_OnlineLab2 : System.Web.UI.Page
{
    String labid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        labid = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";
        if (String.IsNullOrEmpty(labid))
        {
            LabInfo.Text = "網路發生不可預期錯誤.請重新登入再試!";
            return;
        }
        BackLink.Visible = true;
        BackLink.NavigateUrl = "~/Exercise/Phase1/OnlineLab.aspx?labid=" + labid + "&surveyid=" + Request.QueryString["surveyid"];
            
        if (!Page.IsPostBack)
        {
            bool isError = false;
            int lab_id = int.Parse(this.labid);
            if (Session["isLogin"] != null && Session["isLogin"].ToString() == "Y")
            {
                if (Session["USER_DATA"] != null)
                {
                    User u = Session["USER_DATA"] as User;
                    if (u != null)
                    {
                        LabInfo.Text = String.Format("姓名 : {0} 學號 : {1} 學校 : {2} 系所 : {3}", u.name, u.student_id, u.school, u.dept);
                        using (LabsDBEntities db = new LabsDBEntities())
                        {
                            try
                            {
                                var survey = db.Surveys.Where(c => c.labid == u.labid && c.surveyid ==11).First();
                                //var question1 = db.Questions.Where(c => c.survryid == survey.sid && c.no == 100).First();
                                //Part1Title.Text = "一、" + question1.question1;
                                var question2 = db.Questions.Where(c => c.survryid == survey.sid && c.no == 200).First();
                                Part2Title.Text = "二、" + question2.question1;
                                
                                isError = false;
                        
                            }
                            catch (Exception)
                            {


                            }
                        }
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
    protected void SaveButton1_Click(object sender, EventArgs e)
    {

    }




    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ROW_SAVE")
        {
            Response.Write(e.CommandName + ":" + e.CommandArgument);
        }
        //Response.Write(e.CommandName + ":" + e.CommandArgument);
    }
}