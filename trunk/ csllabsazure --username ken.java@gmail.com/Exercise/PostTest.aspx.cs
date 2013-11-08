using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Exercise_PostTest : System.Web.UI.Page
{
    String labid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        labid = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";

        if (!Page.IsPostBack)
        {
            bool isError = true;
            String surveyid = Request.QueryString["surveyid"];
            StartButton.PostBackUrl += "?surveyid=" + surveyid + "&labid=" + labid;
            User u = UserDAO.GetUserFromSession();

            if (u != null)
            {
                //LabInfo.Text = String.Format("姓名 : {0} 學號 : {1} 學校 : {2} 系所 : {3}", u.name, u.student_id, u.school, u.dept);
                isError = false;
            }



            if (isError)
            {
                Response.Write("網路發生不可預期錯誤.請重新登入再試!");
                return;
            }


        }
        
        
            

    }
}