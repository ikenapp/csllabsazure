﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class DiscussionDPreview : System.Web.UI.Page
{
    
    public String[] options = { "", "具實證基礎", "專家個人看法", "個人假設", "未經查證的資料", "無法判斷" };
    public string pre = "<pre>";
    public string pre_end = "</pre>";
    public String label_rank = "(我對此說法的認同強度為";
    public String label_rank_end = ")";
    public String label_content = "內容:(可以用複製/貼上的功能)";
    public String label_source = "資料來源(含：作者/網站名稱/網址)";
    public String label_attributes = "我認為這個說法包含了以下那些屬性(可單選或多選)：";
    public String label_opinons = "我對此說法的看法(包括此說法的「優點」與「缺點」，請參考學習單的範例)";
    public String[] ranks = { "", "非常不認同", "大部分不認同", "普通", "大部分認同", "非常認同" };

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
                    var answers = db.Answers.Where(c => c.surveyid == survey_id && c.labid == lab_id && c.studentid == u.sid && c.phase == "PartB1D" && c.rank != null).OrderBy(c => c.optionid);

                    string ln = "<br>";
                    foreach (var ans in answers)
                    {

                        sb.Append("看法" + ans.optionid + ln);
                        String rank = "";
                        if (ans.rank != null)
                        {
                            rank = ranks[(int)ans.rank];
                        }
                        sb.Append(label_rank + " <b style='color:red;'>" + rank + "</b> " + label_rank_end + ln);
                        sb.Append(label_content + pre + ans.contents + pre_end + ln);
                        sb.Append(label_source + pre + ans.links + pre_end + ln);
                        String attrs = ans.attributes;
                        if (attrs != null)
                        {
                            for (int i = 1; i <= 5; i++)
                            {
                                if (attrs.IndexOf("" + i) != -1)
                                {
                                    attrs = attrs.Replace("" + i, options[i]);
                                }
                            }
                        }
                        else
                        {
                            attrs = "";
                        }
                        sb.Append(label_attributes + pre + attrs + pre_end + ln);
                        sb.Append(label_opinons + pre + ans.opinions + pre_end + ln);
                        sb.Append("<hr>");
                        sb.Append(ln);

                    }


                }
                Session["PartB1D"] = sb.ToString();
            }

            Preview.Text = Session["PartB1D"].ToString();

        }
    }
}