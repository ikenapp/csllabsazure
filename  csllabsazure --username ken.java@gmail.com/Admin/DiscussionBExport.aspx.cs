using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class DiscussionBExport : System.Web.UI.Page
{
    string ln = "<br>";
    public String question_start = "<b style='color:red'>";
    public String question_end = "</b>";
    protected void Page_Load(object sender, EventArgs e)
    {

        StringBuilder sb = new StringBuilder();
        int lab_id = int.Parse(Request.Params["labid"]);

        using (LabsDBEntities db = new LabsDBEntities())
        {
            try
            {

                var skyegroups = db.Users.Where(c => c.labid == lab_id && c.group == "B").Select(c => c.groupid).OrderBy(c => c).Distinct();

                //int count = 1;
                foreach (int gid in skyegroups)
                {
                    var users = db.Users.Where(c => c.groupid == gid && c.group == "B" && c.labid == lab_id).Select(c => c.student_id);
                    sb.Append("<b style='color:green'>第" + gid + "  組組員</b>:<b> ");
                    foreach (var uu in users)
                    {
                        sb.Append(uu + " ");
                    }
                    sb.Append("</b>"+ln);
                    for (int i = 1; i < 3; i++)
                    {
                        sb.Append(question_start + "第" + i + "題"+question_end + ln);
                        try
                        {
                            var query = from x in db.DiscussionBs
                                        let z = db.Users
                                                       .Where(y => y.sid == x.student_id)
                                                       .Select(y => y.student_id).FirstOrDefault()
                                        where x.labid == lab_id && x.groupid == gid && x.num == i
                                        orderby x.time
                                        select new
                                        {
                                            topic = "<pre style='color:blue'>" + x.topic + "</pre>",
                                            student_id = z,
                                            time = x.time
                                        };

                            foreach (var q in query)
                            {
                                sb.Append("<b>"+q.student_id +"</b>["+q.time+"]" +q.topic+ ln);
                       
                            }
                        }
                        catch (Exception)
                        {


                        }
                    }
                    sb.Append("<hr>");
                    sb.Append(ln);

                }

                Preview.Text = sb.ToString();
            }
            catch (Exception)
            {


            }
        }
    }




}