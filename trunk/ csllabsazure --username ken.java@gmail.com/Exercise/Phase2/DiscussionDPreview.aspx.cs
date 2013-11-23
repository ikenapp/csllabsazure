using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Discussion_DPreview : System.Web.UI.Page
{
    public String[] options = { "", "具實證基礎", "專家個人看法", "個人假設", "未經查證的資料", "無法判斷" };
    public string pre = "<pre>";
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
    public String[] ranks = { "", "非常不認同", "大部分不認同", "普通", "大部分認同", "非常認同" };
    
    protected void Page_Load(object sender, EventArgs e)
    {

        User u = UserDAO.GetUserFromSession();
        if (u != null)
        {
            if (Session["PartB1D2"] == null)
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
                    var answers = db.Answers.Where(c => c.surveyid == survey_id && c.labid == lab_id && c.studentid == u.sid && c.phase == "PartB1D" && c.rank != null).OrderBy(c => c.optionid);

                    string ln = "<br>";
                    int count = 1;
                    foreach (var ans in answers)
                    {
                        if (ans.rank != null)
                        {
                            sb.Append("看法" + ans.optionid + ln);
                            String rank = "";
                            if (ans.rank != null)
                            {
                                rank = ranks[(int)ans.rank];
                            }
                            sb.Append(label_content + pre + ans.contents + pre_end + ln);
                            sb.Append(label_source + pre + ans.links + pre_end + ln);
                            sb.Append(label_rank + " <b style='color:red;'>" + rank + "</b> " + label_rank_end + ln);
                            String attrs = ans.attributes;
                            for (int i = 1; i <= 5; i++)
                            {
                                if (attrs.IndexOf("" + i) != -1)
                                {
                                    attrs = attrs.Replace("" + i, options[i]);
                                }
                            }
                            sb.Append(label_attributes + pre + attrs + pre_end + ln);
                            sb.Append(label_opinons + pre + ans.opinions + pre_end + ln);
                            sb.Append("<hr>");
                            sb.Append(ln);
                        }
                        //else
                        //{
                        //    var q = db.Questions.Where(c => c.sid == ans.qid).First();
                        //    sb.Append("題目"+count+" :　" + q.question1+ln);
                        //    sb.Append(label_content + pre + ans.contents + pre_end + ln);
                        //    sb.Append("<hr>");
                        //    sb.Append(ln);
                        //    count++;
                        //}
                       
                        sb.Append(ln);

                    }

                    answers = db.Answers.Where(c => c.surveyid == survey_id && c.labid == lab_id && c.studentid == u.sid && c.phase == "PartB1D" && c.rank == null).OrderBy(c => c.qid);
                    foreach (var ans in answers)
                    {                   
                        {
                            var q = db.Questions.Where(c => c.sid == ans.qid).First();
                            sb.Append("題目" + count + " :　" + q.question1 + ln);
                            sb.Append("內容 : " + pre + ans.contents + pre_end + ln);
                            sb.Append("<hr>");
                            sb.Append(ln);
                            count++;
                        }

                        sb.Append(ln);

                    }

                }
                Session["PartB1D2"] = sb.ToString();
            }

            Preview.Text = Session["PartB1D2"].ToString();

        }
    }
}