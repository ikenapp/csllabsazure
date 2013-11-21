using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PreviewScale : System.Web.UI.Page
{
    String labid = "";
    String surveyid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        labid = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";
        surveyid = Request.QueryString["surveyid"] != null ? Request.QueryString["surveyid"].ToString() : "";
        if (String.IsNullOrEmpty(labid))
        {
            ScaleInfo.Text = "網路發生不可預期錯誤.請重新登入再試!";
            return;
        }
        //if (!Page.IsPostBack)
        {
            String qStr = "";
            if (Request.QueryString["title"] != null)
            {
                qStr = "&title=" + Request.QueryString["title"];
            }
            if (Request.QueryString["phase"] != null)
            {
                qStr += "&phase=" + Request.QueryString["phase"];
            }
            BackLink.NavigateUrl = "~/Admin/Phase1/Scale.aspx?labid=" + labid + qStr;
            int lab_id = int.Parse(this.labid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {
                    var lab = db.Labs.Where(c => c.sid == lab_id).First();
                    ScaleInfo.Text = String.Format("場次 : {0} [ {1} ] , 時間 : {2:yyyy-MM-dd} ~ {3:yyyy-MM-dd} {4}", lab.name, lab.desc, lab.begin, lab.end, lab.currentPhase);
                }
                catch (Exception ex)
                {

                    
                }

                try
                {
                    int survey_id = int.Parse(surveyid);
                    var survey = db.Surveys.Where(c => c.sid == survey_id).First();
                    ScaleInfo.Text += String.Format("<br> {0} [ {1} ] : {2} 點量表 ", survey.name, survey.phase, survey.scale);
                }
                catch (Exception ex)
                {


                }


            }
        }

    }
}