using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Lab_Phase2_OnlineLabExport : System.Web.UI.Page
{
    public String[] options = { "","具實證基礎","專家個人看法","個人假設","未經查證的資料","無法判斷"};
    public string pre = "<pre class='answerLabel'>";
    public string pre_end = "</pre>"; 
    public String label_rank = "3. 您給予該說法的認同強度為 ";
    public String label_rank_end = "";
    public String label_content = "1.摘錄該說法的內容(可以用複製/貼上的功能)：";
    public String label_source = "2.該說法的資料來源(含：作者/網站名稱/網址)";
    public String label_attributes = "4. 這個說法包含了以下那些屬性(可單選或多選)：";
    public String option_attr_1 = "具實證基礎";
    public String option_attr_2 = "專家個人看法";
    public String option_attr_3 = "個人假設";
    public String option_attr_4 = "未經查證的資料";
    public String option_attr_5 = "無法判斷";
    public String label_opinons = "5. 您對於此說法的看法(包括「優點」與「缺點」，請參考學習單的範例)";
    public String[] ranks = { "","非常不認同","大部分不認同","普通","大部分認同","非常認同"};
    public String question_start = "<b class='questionLabel'>";
    public String question_end = "</b>";
    public String title_start = "<b class='titleLabel'>";
    public String title_end = "</b>";

    protected void Page_Load(object sender, EventArgs e)
    {

        String labid = Request.QueryString["labid"];
        if (!String.IsNullOrEmpty(labid))
        {
            StringBuilder sb = new StringBuilder();
            int lab_id = int.Parse(labid);
            int survey_id = -1; ;
            using (LabsDBEntities db = new LabsDBEntities())
            {
                foreach (var s in db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 21))
                {
                    survey_id = s.sid;
                    break;
                }

                var users = db.Users.Where(c => c.labid == lab_id).OrderBy(c => c.student_id);
                foreach (User u in users)
                {
                    
                    string ln = "<br>";
                    sb.Append("學號: " + u.student_id + ln);
                    var answers = db.Answers.Where(c => c.surveyid == survey_id && c.labid == lab_id && c.studentid == u.sid && c.phase == "PartB2").OrderBy(c => c.qid);
                    int count = 1;
                    foreach (var ans in answers)
                    {

                        sb.Append(question_start + "題目" + count++ + question_end + ln);
                        
                        sb.Append(question_start + "回答:" + question_end + pre + ans.contents + pre_end + ln);
                        
                    }
                    sb.Append("<hr>");
                    sb.Append(ln);

                }
                String msg = sb.ToString();
                if (msg.Trim() == "")
                {
                    msg = "<b style='color:red;'>查無資料!</b>";
                }
                //Session["PartA1Export"] = msg;
                Preview.Text = msg;//Session["PartA1Export"].ToString();

            }
        }
    }
}