using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_Scale2 : System.Web.UI.Page
{
    String labid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        labid = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";
        SurveyImport.Visible = false;
        MsgLabel2.Visible = false;
        PreviewLink.Visible = false;
        Preview.Visible = false;
        if (!Page.IsPostBack)
        {
            int lab_id = int.Parse(labid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                foreach (var s in db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 22))
                {
                    Preview.NavigateUrl = "~/Admin/Phase2/PreviewScale.aspx?surveyid=" + s.sid + "&labid=" + labid + "&preview=true";
                    Preview.Visible = true;
                    break;
                }
            }
            BackLink.NavigateUrl = "~/Admin/LabsSettings.aspx?labid=" + labid;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MsgLabel.Text = ""; ;
        if (String.IsNullOrEmpty(labid))
        {
            MsgLabel.Text = "網路發生不可預期錯誤.請重新登入再試!";
            return;
        }
        if (FileUpload1.PostedFile.FileName.IndexOf(".csv") == -1)
        {
            MsgLabel.Text = "上傳檔案格式不正確";
            return;
        }

        if (FileUpload1.PostedFile.ContentLength <= 900000)
        {
            FileUpload1.SaveAs(Server.MapPath(@"~/Upload/Lab_" + labid + "_SelfEval2.csv"));
            MsgLabel.Text = "檔案上傳成功";
            SurveyImport.Visible = true;
        }
        else
        {
            MsgLabel.Text = "檔案不可超過3M";
        }

    }
    protected void SurveyImport_Click(object sender, EventArgs e)
    {
        SurveyImport.Visible = true;
        MsgLabel2.Visible = true;
        MsgLabel2.Text = "";
        bool isError = false;
        clearSurveys();
        int surveyId = -1;
        using (LabsDBEntities db = new LabsDBEntities())
        {
            using (StreamReader sr = new StreamReader(Server.MapPath(@"~/Upload/Lab_" + labid + "_SelfEval2.csv"), System.Text.Encoding.Default))
            {
                //讀取文字檔
                string txt = sr.ReadToEnd().Trim();
                string[] data = txt.Split('\n');
                Survey survey = new Survey
                {
                    name = "第二階段學習自評",
                    phase = "PartB2",
                    type = "SCALE",
                    labid = int.Parse(labid),
                    surveyid = 22,
                    scale = "6"

                };
                db.Surveys.Add(survey);
                db.SaveChanges();
                surveyId = survey.sid;
                for (int i = 1; i < data.Length; i++)
                {
                    try
                    {
                        if (data[i].IndexOf(",") != -1)
                        {
                            int idx = data[i].IndexOf(",");
                            String noStr = data[i].Substring(0, idx);
                            String questionStr = data[i].Substring(idx + 1);
                            questionStr = questionStr.Trim();
                            if (questionStr.StartsWith("\""))
                            {
                                questionStr = questionStr.Substring(1);
                            }
                            if (questionStr.EndsWith("\""))
                            {
                                questionStr = questionStr.Substring(0, questionStr.Length - 1);
                            }

                            Question q = new Question
                            {
                                no = int.Parse(noStr),
                                question1 = questionStr,
                                survryid = survey.sid

                            };
                            db.Questions.Add(q);
                        }
                    }
                    catch (Exception ex)
                    {
                        //Response.Write(ex.Message+"<BR>");
                        isError = true;
                    }
                }
            }
            if (!isError)
            {
                db.SaveChanges();
            }
        }
        if (isError)
        {
            MsgLabel2.Text = "資料匯入有誤,請重新匯入";
            clearSurveys();
        }
        else
        {
            PreviewLink.Visible = true;
            PreviewLink.PostBackUrl = "~/Admin/Phase2/PreviewScale.aspx?surveyid=" + surveyId + "&labid=" + labid;
            MsgLabel2.Text = "資料匯入完畢";
        }


    }

    private void clearSurveys()
    {
        int lab_id = int.Parse(this.labid);
        using (LabsDBEntities db = new LabsDBEntities())
        {
            int surveyid = -1;
            foreach (var s in db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 22))
            {
                surveyid = s.sid;
                db.Surveys.Remove(s);

            }
            foreach (var q in db.Questions.Where(c => c.survryid == surveyid))
            {

                db.Questions.Remove(q);

            }
            db.SaveChanges();
        }
    }
}