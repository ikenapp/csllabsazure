using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PostTestExport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String labid = Request.QueryString["labid"];
        if (!String.IsNullOrEmpty(labid))
        {
            int lab_id = int.Parse(labid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                Survey s = db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 24).First();
                

            }
        }
        
    }
}