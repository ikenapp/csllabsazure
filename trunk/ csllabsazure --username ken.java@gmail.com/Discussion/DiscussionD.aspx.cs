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
    protected void Page_Load(object sender, EventArgs e)
    {
        labid = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";
        if (String.IsNullOrEmpty(labid))
        {
            LabInfo.Text = "網路發生不可預期錯誤.請重新登入再試!";
            return;
        }
        //BackLink.Visible = true;
        //BackLink.NavigateUrl = "~/Exercise/Phase1/Phase1.aspx?labid=" + labid;

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
        View view = MultiView1.FindControl("View" + idx) as View;
        DropDownList ddl = view.FindControl("DropDownList" + idx) as DropDownList;
        TextBox content = view.FindControl("ContentTB" + idx) as TextBox;
        TextBox source = view.FindControl("SourceTB" + idx) as TextBox;
        TextBox opinion = view.FindControl("OpinionTB" + idx) as TextBox;
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
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {
                    var answer = db.Answers.Where(c => c.surveyid == survey_id && c.labid == lab_id && c.studentid == u.sid && c.phase == "PartB1D" && c.optionid == idx).First();
                    answer.opinions = opinionStr;
                    answer.contents = contentStr;
                    answer.links = sourceStr;
                    answer.rank = rankVal;
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
                        qid = question1.sid

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
        //Check all
        int count = 0;
        for (int idx = 1; idx <= 7; idx++)
        {
            View view = MultiView1.FindControl("View" + idx) as View;
            TextBox content = view.FindControl("ContentTB" + idx) as TextBox;
            TextBox source = view.FindControl("SourceTB" + idx) as TextBox;
            TextBox opinion = view.FindControl("OpinionTB" + idx) as TextBox;
            String contentStr = content.Text.Trim();
            String sourceStr = source.Text.Trim();
            String opinionStr = opinion.Text.Trim();
            if (contentStr.Length != 0 && sourceStr.Length != 0 && opinionStr.Length != 0)
            {
                count++;
            }

        }
        if (count < 3)
        {
            isShow = true;
            message = "至少填寫三個想法/意見!";
        }
        else
        {
            for (int idx = 1; idx <= 7; idx++)
            {
                SaveOpinion(idx);
            }
            Session["PartB1D"] = null;
            Response.Redirect("~/Discussion/DiscussionD2.aspx?labid=" + labid + "&surveyid=" + Request.QueryString["surveyid"] + "&minid=200");
        }

    }
}