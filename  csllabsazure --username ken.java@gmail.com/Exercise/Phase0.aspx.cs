using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Execise_Phase0 : System.Web.UI.Page
{
    int lab_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool isError = true;
        if (!Page.IsPostBack)
        {
            User u = UserDAO.GetUserFromSession();
            if (u != null)
            {
                lab_id = u.labid;
                LabsInfo.Text = String.Format("姓名 : {0} 學號 : {1} 學校 : {2} 系所 : {3}", u.name, u.student_id, u.school, u.dept);
                isError = false;
                using (LabsDBEntities db = new LabsDBEntities())
                {
                    try
                    {
                        var survey = db.Surveys.Where(c => c.labid == u.labid && c.surveyid == 00).First();
                        PostTest.PostBackUrl = "~/Exercise/PreTest1.aspx?labid=" + lab_id + "&surveyid=" + survey.sid;
                        Response.Redirect(PostTest.PostBackUrl);
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
            else
            {
                Response.Redirect(PostTest.PostBackUrl);
            }
                        


        }

    }
        
}