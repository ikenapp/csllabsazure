using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Discussion_Phase1Preview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        User u = UserDAO.GetUserFromSession();
        if (u != null)
        {
            if (Session["PartB1D"] == null)
            {
                StringBuilder sb = new StringBuilder();
                int lab_id = u.labid;
                int survey_id = -1; ;
                using (LabsDBEntities db = new LabsDBEntities())
                {
                    foreach (var s in db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 11))
                    {
                        survey_id = s.sid;
                        break;
                    }
                    var answers = db.Answers.Where(c => c.surveyid == survey_id && c.labid == lab_id && c.studentid == u.sid && c.phase == "PartA").OrderBy(c => c.optionid);

                    string ln = "<br>";
                    foreach (var ans in answers)
                    {
                        sb.Append("看法 : " + ans.optionid + ln);
                        sb.Append("強度 : " + ans.rank + " 分" + ln);
                        sb.Append("內容 : " + ans.contents + ln);
                        sb.Append("出處 : " + ans.links + ln);
                        sb.Append("屬性 : " + ans.attributes+ln);
                        sb.Append("看法 : " + ans.opinions + ln);
                        sb.Append(ln);

                    }


                }
                Session["PartA"] = sb.ToString();
            }

            Preview.Text = Session["PartA"].ToString();

        }
    }
}