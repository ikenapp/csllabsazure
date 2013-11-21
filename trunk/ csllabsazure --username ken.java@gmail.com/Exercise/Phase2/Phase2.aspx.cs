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
    int survey_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool isError = true;
        //if (!Page.IsPostBack)
        {
            User u = UserDAO.GetUserFromSession();
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
                            url = String.Format("~/Discussion/Discussion{0}.aspx?labid={1}&groupid={2}", u.group, lab_id, u.groupid);
                        }
                        else if (u.group == "B")
                        {
                            url = String.Format("~/Discussion/Discussion{0}.aspx?labid={1}&groupid={2}", u.group, lab_id, u.groupid);
                        }
                        else
                        {
                            //Check Status
                            if (CheckGroupC(u, db))
                            {
                                u.group = "C";
                                try
                                {
                                    var survey = lab.Surveys.Where(c => c.labid == u.labid && c.surveyid == 23).First();
                                    survey_id = survey.sid;
                                    //Group C
                                    url = String.Format("~/Discussion/Discussion{0}.aspx?labid={1}&surveyid={2}&minid=100", u.group, lab_id, survey.sid);

                                }
                                catch (Exception)
                                {

                                    //throw;
                                }
                            }
                            else
                            {
                                u.group = "D";
                                try
                                {
                                    var survey = lab.Surveys.Where(c => c.labid == u.labid && c.surveyid == 11).First();
                                    survey_id = survey.sid;
                                    //Group D
                                    url = String.Format("~/Discussion/Discussion{0}.aspx?labid={1}&surveyid={2}&minid=100", u.group, lab_id, survey.sid);

                                }
                                catch (Exception)
                                {

                                    //throw;
                                }
                            }
                        }
                        Response.Redirect(url);
                        return;
                    }
                    else if (lab.currentPhase == "PartB2")
                    {
                        //習作與自評
                        try
                        {
                            var survey = lab.Surveys.Where(c => c.surveyid == 21).First();
                            survey_id = survey.sid;
                            OnlineLab.PostBackUrl += "?labid=" + lab_id + "&surveyid=" + survey_id; 
                        }
                        catch (Exception)
                        {
                            OnlineLab.Enabled = false;
                            //throw;
                        }
                        try
                        {
                            var survey = lab.Surveys.Where(c => c.surveyid == 22).First();
                            survey_id = survey.sid;
                            SelfEval.PostBackUrl += "?labid=" + lab_id + "&surveyid=" + survey_id; ;
                        }
                        catch (Exception)
                        {
                            SelfEval.Enabled = false;
                            //throw;
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

    private bool CheckGroupC(global::User u, LabsDBEntities db)
    {
        bool ret = true;
        try
        {
            bool flag1 = db.Status.Where(c => c.labid == u.labid && c.studentid == u.sid && c.phase == "PartAE").First().done;
            ret = flag1 && ret;
        }
        catch
        {
            ret = false;
        }

        try
        {
            bool flag1 = db.Status.Where(c => c.labid == u.labid && c.studentid == u.sid && c.phase == "PartA").First().done;
            ret = flag1 && ret;
        }
        catch
        {
            ret = false;
        }

        try
        {
            User u1 = db.Users.Where(c => c.sid == u.sid).First();
            u1.group = ret ? "C" : "D";
            db.SaveChanges();
        }
        catch
        {
            ret = false;
        }
        return ret;
    }

   
}