using System;
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
    public String label_content = "1.請扼要摘錄該說法的論點內容(500字為上限，可以用複製/貼上的功能)：";
    public String label_source = "2.請標示該說法的資料來源(含：作者/網站名稱/網址)";
    public String label_attributes = "4.請參考Levels of Evidence (SIGN)的標準，判斷該論點資料的實證強度：";
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
            String surveyid = Request.QueryString["surveyid"];
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

            int survey_id = int.Parse(surveyid);
            for (int i = 1; i <= 5; i++)
            {
                using (LabsDBEntities db = new LabsDBEntities())
                {
                    try
                    {
                        var answer = db.Answers.Where(c => c.surveyid == survey_id && c.labid == lab_id && c.studentid == u.sid && c.phase == "PartB1D" && c.optionid == i).First();
                        View view = MultiView1.FindControl("View" + i) as View;
                        DropDownList ddl = view.FindControl("DropDownList" + i) as DropDownList;
                        TextBox content = view.FindControl("ContentTB" + i) as TextBox;
                        TextBox source = view.FindControl("SourceTB" + i) as TextBox;
                        TextBox opinion = view.FindControl("OpinionTB" + i) as TextBox;
                        RadioButtonList attrcb = view.FindControl("AttrList" + i) as RadioButtonList;
                        RadioButtonList attrlevel = view.FindControl("AttrLevel" + i) as RadioButtonList;
                        String attr1 = "", attr2 = "";
                        if (answer.attributes.IndexOf(" ") != -1)
                        {
                            String[] data = answer.attributes.Split(' ');
                            attr1 = data[0];
                            attr2 = data[1];
                        }
                        else
                        {
                            attr1 = answer.attributes;
                            attr2 = "1++";
                        }
                        ddl.SelectedValue = answer.rank.ToString();
                        content.Text = answer.contents;
                        source.Text = answer.links;
                        opinion.Text = answer.opinions;
                        attrcb.SelectedValue = attr1;
                        attrlevel.SelectedValue = attr2;
                    }
                    catch (Exception)
                    {
                    }
                }
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
        RadioButtonList attrlevel = view.FindControl("AttrLevel" + idx) as RadioButtonList;
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
            if (attrcb.SelectedIndex == -1)
            {
                msg.Text += "實證強度必填, ";
                count++;
            }
            else if (attrcb.SelectedIndex == 0)
            {
                attrs += " " + attrlevel.SelectedValue;
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
        for (int idx = 1; idx <= 5; idx++)
        {
            View view = MultiView1.FindControl("View" + idx) as View;
            TextBox content = view.FindControl("ContentTB" + idx) as TextBox;
            TextBox source = view.FindControl("SourceTB" + idx) as TextBox;
            TextBox opinion = view.FindControl("OpinionTB" + idx) as TextBox;
            RadioButtonList attrcb = view.FindControl("AttrList" + idx) as RadioButtonList;
            String contentStr = content.Text.Trim();
            String sourceStr = source.Text.Trim();
            String opinionStr = opinion.Text.Trim();
            if (attrcb.SelectedIndex!=-1 && contentStr.Length != 0 && sourceStr.Length != 0 && opinionStr.Length != 0)
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
            isShow = false;
            bool status;
            SaveOpinion(5, out status);
            if (status)
            {
                Session["PartB1D"] = null;
                Response.Redirect("~/Discussion/DiscussionD2.aspx?labid=" + labid + "&surveyid=" + Request.QueryString["surveyid"] + "&minid=200");
               
            }
            
        }
       
    }
}