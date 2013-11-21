using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Execise_Phase1 : System.Web.UI.Page
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

            }

            if (isError)
            {
                Response.Write("網路發生不可預期錯誤.請重新登入再試!");
                return;
            }
            using (LabsDBEntities db = new LabsDBEntities())
            {
                foreach (var s in db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 11))
                {
                    OnlineLab.PostBackUrl += "?surveyid=" + s.sid + "&labid=" + lab_id + "&minid=200";
                    Server.Transfer(OnlineLab.PostBackUrl);
                    break;
                }
                //foreach (var s in db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 12))
                //{
                //    SelfEval.PostBackUrl += "?surveyid=" + s.sid + "&labid=" + lab_id + "&minid=200";
                //    break;
                //}
            }

        }
    }
}