using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Exercise2_OnlineLabDone : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (LabsDBEntities db = new LabsDBEntities())
        {
            User u = UserDAO.GetUserFromSession();
            if (u != null)
            {
                foreach (var s in db.Surveys.Where(c => c.labid == u.labid && c.surveyid == 22))
                {
                    Response.Redirect("~/Exercise/Phase2/SelfEvaluation.aspx?surveyid=" + s.sid + "&labid=" + u.labid + "&minid=200");
                    break;
                }
            }
        }

    }
}