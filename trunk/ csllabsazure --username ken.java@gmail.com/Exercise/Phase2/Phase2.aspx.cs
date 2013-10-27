using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Execise_Phase1 : System.Web.UI.Page
{
    int lab_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool isError = true;
        if (!Page.IsPostBack)
        {
            if (Session["isLogin"] != null && Session["isLogin"].ToString() == "Y")
            {
                if (Session["USER_DATA"] != null)
                {
                    User u = Session["USER_DATA"] as User;
                    if (u != null)
                    {
                        lab_id = u.labid;
                        LabsInfo.Text = String.Format("姓名 : {0} 學號 : {1} 學校 : {2} 系所 : {3}", u.name, u.student_id, u.school, u.dept);
                        isError = false;
                        using (LabsDBEntities db = new LabsDBEntities())
                        {
                            var lab = db.Labs.Where(c => c.sid == lab_id).First();
                            if (lab.currentPhase == "PartB1")
                            {

                                String url = "";
                                //分組討論
                                if (u.group == "A")
                                {
                                    url = String.Format("~/Discussion/Discussion{0}.aspx?labid={1}&groupid={2}", u.group, lab_id,u.groupid);
                                }
                                else if (u.group == "B")
                                {
                                    url = String.Format("~/Discussion/Discussion{0}.aspx?labid={1}&groupid={2}", u.group, lab_id, u.groupid);
                                }
                                else if (u.group == "C")
                                {
                                    var survey = lab.Surveys.Where(c=>c.surveyid==5).First();
                                    url = String.Format("~/Discussion/Discussion{0}.aspx?labid={1}&surveyid={2}&minid=100", u.group, lab_id, survey.sid);
                                }
                                Response.Redirect(url);
                                return;
                            }
                            else if (lab.currentPhase == "PartB2")
                            {
                                //習作與自評
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
            String labid = "?labid=" + lab_id;
            OnlineLab.PostBackUrl += labid;
            SelfEval.PostBackUrl += labid;
        }


    }
}