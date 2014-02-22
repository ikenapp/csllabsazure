﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Lib;

public partial class Discussion_DiscussionD : System.Web.UI.Page
{
    String labid = "";
    public bool isShow = false;
    public String message = "";
    public String label_rank = "3. 請就系統提供的選框選項，選擇您給予該說法的認同強度為 ";
    public String label_rank_end = "";
    public String label_content = "1.請摘錄該說法的內容(可以用複製/貼上的功能)：";
    public String label_source = "2.請標示該說法的資料來源(含：作者/網站名稱/網址)";
    public String label_attributes = "4. 請判斷這個說法包含了以下那些屬性(可單選或多選)：";
    public String option_attr_1 = "具實證基礎";
    public String option_attr_2 = "專家個人看法";
    public String option_attr_3 = "個人假設";
    public String option_attr_4 = "未經查證的資料";
    public String option_attr_5 = "無法判斷";
    public String label_opinons = "5. 請寫下您對於此說法的看法(包括「優點」與「缺點」，請參考學習單的範例)";

    protected void Page_Load(object sender, EventArgs e)
    {
        labid = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";
        if (String.IsNullOrEmpty(labid))
        {
            LabInfo.Text = "網路發生不可預期錯誤.請重新登入再試!";
            return;
        }
        //BackLink.Visible = true;
        BackLink.NavigateUrl = "~/Exercise/Phase2.aspx?labid=" + labid;

        if (!Page.IsPostBack)
        {
            bool isError = false;
            int lab_id = int.Parse(this.labid);
            User u = UserDAO.GetUserFromSession();
            if (u != null)
            {
                LabInfo.Text = String.Format("姓名 : {0} 學號 : {1} 學校 : {2} 系所 : {3}", u.name, u.student_id, u.school, u.dept);
                using (LabsDBEntities db = new LabsDBEntities())
                {
                    try
                    {
                        var survey = db.Surveys.Where(c => c.labid == u.labid && c.surveyid == 11).First();
                        var question1 = db.Questions.Where(c => c.survryid == survey.sid && c.no == 100).First();
                        Part1Title.Text = "一、" + question1.question1;
                        String surveyid = Request.QueryString["surveyid"];

                        NextButton.PostBackUrl += "?surveyid=" + surveyid + "&labid=" + labid + "&minid=200";
                        isError = false;

                    }
                    catch (Exception)
                    {


                    }

                }
            }
            if (isError)
            {
                Response.Write("網路發生不可預期錯誤.請重新登入再試!");
                return;
            }
        }

    }
    protected void SaveButton1_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        int idx = int.Parse(btn.ID.Substring(btn.ID.Length - 1));
        SaveOpinion(idx);
        Session["PartB1D"] = null;

    }
    private void SaveOpinion(int idx)
    {
        bool s;
        SaveOpinion(idx, out s);
    }

    private void SaveOpinion(int idx, out bool result)
    {
        result = true;
        View view = MultiView1.FindControl("View" + idx) as View;
        DropDownList ddl = view.FindControl("DropDownList" + idx) as DropDownList;
        TextBox content = view.FindControl("ContentTB" + idx) as TextBox;
        TextBox source = view.FindControl("SourceTB" + idx) as TextBox;
        TextBox opinion = view.FindControl("OpinionTB" + idx) as TextBox;
        RadioButtonList attrcb = view.FindControl("AttrList" + idx) as RadioButtonList;
        Label msg = view.FindControl("MsgLabel" + idx) as Label;
        msg.Text = "";
        int rankVal = int.Parse(ddl.SelectedValue);
        String contentStr = content.Text.Trim();
        String sourceStr = source.Text.Trim();
        String opinionStr = opinion.Text.Trim();
        User u = UserDAO.GetUserFromSession();
        if (u != null)
        {
            int lab_id = int.Parse(labid);
            int survey_id = int.Parse(Request.QueryString["surveyid"]);
            String attrs = "";
            bool flag = false;
            foreach (ListItem item in attrcb.Items)
            {
                if (item.Selected)
                {
                    flag = true;
                    attrs += item.Value + ",";
                }
            }
            int count = 0;
            if (String.IsNullOrEmpty(contentStr))
            {
                msg.Text += "內容欄位必填, ";
                count++;
            }
            if (String.IsNullOrEmpty(sourceStr))
            {
                msg.Text += "資料來源必填, ";
                count++;
            }
            if (!flag)
            {
                msg.Text += "資料屬性至少選一項, ";
                count++;
            }
            if (String.IsNullOrEmpty(opinionStr))
            {
                msg.Text += "我的看法必填 ";
                count++;
            }
            if (msg.Text != "")
            {
                if (count != 4)
                {
                    result = false;
                }
                else
                {
                    result = true;
                }

                return;
            }
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {
                    var answer = db.Answers.Where(c => c.surveyid == survey_id && c.labid == lab_id && c.studentid == u.sid && c.phase == "PartB1D" && c.optionid == idx).First();
                    answer.opinions = opinionStr;
                    answer.contents = contentStr;
                    answer.links = sourceStr;
                    answer.rank = rankVal;
                    answer.attributes = attrs;
                }
                catch (Exception)
                {
                    var survey = db.Surveys.Where(c => c.labid == u.labid && c.surveyid == 11).First();
                    var question1 = db.Questions.Where(c => c.survryid == survey.sid && c.no == 100).First();
                    Answer ans = new Answer
                    {
                        labid = lab_id,
                        surveyid = survey_id,
                        studentid = u.sid,
                        rank = rankVal,
                        contents = contentStr,
                        links = sourceStr,
                        opinions = opinionStr,
                        optionid = idx,
                        phase = "PartB1D",
                        qid = question1.sid,
                        attributes = attrs
                    };
                    db.Answers.Add(ans);
                }
                db.SaveChanges();
                msg.Text = "儲存成功";
            }
        }

    }


    protected void NextButton_Click(object sender, EventArgs e)
    {
        int count = 0;
        for (int idx = 1; idx <= 7; idx++)
        {
            View view = MultiView1.FindControl("View" + idx) as View;
            TextBox content = view.FindControl("ContentTB" + idx) as TextBox;
            TextBox source = view.FindControl("SourceTB" + idx) as TextBox;
            TextBox opinion = view.FindControl("OpinionTB" + idx) as TextBox;
            RadioButtonList attrcb = view.FindControl("AttrList" + idx) as RadioButtonList;
            String contentStr = content.Text.Trim();
            String sourceStr = source.Text.Trim();
            String opinionStr = opinion.Text.Trim();
            String attrs = "";
            bool flag = false;
            foreach (ListItem item in attrcb.Items)
            {
                if (item.Selected)
                {
                    flag = true;
                    attrs += item.Value + ",";
                }
            }
            if (contentStr.Length != 0 && sourceStr.Length != 0 && opinionStr.Length != 0 && flag)
            {
                SaveOpinion(idx);
                count++;
            }

        }
        if (count < 2)
        {
            isShow = true;
            message = "至少填寫兩個想法/意見!";
        }
        else
        {
            bool status;
            SaveOpinion(7, out status);
            if (status)
            {
                 Session["PartB1D"] = null;
                Response.Redirect("~/Discussion/DiscussionD2.aspx?labid=" + labid + "&surveyid=" + Request.QueryString["surveyid"] + "&minid=200");
               
            }
            
        }
       
    }
}