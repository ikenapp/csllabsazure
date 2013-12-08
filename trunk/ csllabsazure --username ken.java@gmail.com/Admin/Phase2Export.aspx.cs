using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Phase2Export : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SelfEvalExport_Click(object sender, EventArgs e)
    {
        String labid = Request.QueryString["labid"];
        if (!String.IsNullOrEmpty(labid))
        {
            int lab_id = int.Parse(labid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                Lab lab = db.Labs.Where(c => c.sid == lab_id).First();
                ReportUtils.genScaleReport(22, lab.name + "_" + lab_id + "_PHASE2_SELFEVAL");
            }
        }
    }
}