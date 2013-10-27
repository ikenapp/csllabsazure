using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PreviewSurvey : System.Web.UI.Page
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
        if (!Page.IsPostBack)
        {
            BackLink.NavigateUrl = "~/Admin/Phase1/Survey.aspx?labid=" + labid;
            int lab_id = int.Parse(this.labid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {
                    var lab = db.Labs.Where(c => c.sid == lab_id).First();
                    LabInfo.Text = String.Format("場次 : {0} [ {1} ] , 時間 : {2:yyyy-MM-dd} ~ {3:yyyy-MM-dd} {4}.<Br>第一階段習作題目", lab.name, lab.desc, lab.begin, lab.end,lab.currentPhase);
                }
                catch (Exception ex)
                {

                    throw;
                }


            }
        }

    }
}