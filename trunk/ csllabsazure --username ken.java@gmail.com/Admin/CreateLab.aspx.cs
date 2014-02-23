using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CreateLab : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BackLink.NavigateUrl = "~/Admin/AdminSettings.aspx";
    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            using (LabsDBEntities db = new LabsDBEntities())
            {
                String nameStr = LabName.Text;
                String descStr = Desc.Text;
                String beginDayStr = BeginDate.Text;
                String endDayStr = EndDate.Text;
                Lab lab = new Lab
                {
                    name= nameStr,
                    desc = descStr,
                    currentPhase = "INIT",
                    begin = DateTime.ParseExact(beginDayStr,"yyyy-MM-dd",null),
                    end = DateTime.ParseExact(endDayStr,"yyyy-MM-dd",null)
                   
                };
                try
                {
                    db.Labs.Add(lab);
                    db.SaveChanges();
                    int labid = lab.sid;
                    try
                    {
                        if (initCB.Checked)
                        {
                            initSettings(labid);
                        }
                    }
                    catch
                    {
                    }
                    
                    Response.Redirect("~/Admin/AdminSettings.aspx");
                }
                catch (Exception ex)
                {
                    MessageLabel.Text = (ex.Message);
                }
                
            }
        }
    }

    private void initSettings(int labid)
    {
        using (LabsDBEntities db = new LabsDBEntities())
        {
            int surveyId = -1;
            //11
            using (StreamReader sr = new StreamReader(Server.MapPath(@"~/INITTemplate/init11_survey.csv"), System.Text.Encoding.Default))
            {
                //讀取文字檔
                string txt = sr.ReadToEnd().Trim();
                string[] data = txt.Split('\n');
                Survey survey = new Survey
                {
                    name = "第一階段線上習作",
                    phase = "PartA",
                    type = "SURVEY",
                    labid = labid,
                    surveyid = 11

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

                    }
                }
                db.SaveChanges();
            }


            //12
            using (StreamReader sr = new StreamReader(Server.MapPath(@"~/INITTemplate/init12_selfeval.csv"), System.Text.Encoding.Default))
            {
                //讀取文字檔
                string txt = sr.ReadToEnd().Trim();
                string[] data = txt.Split('\n');
                Survey survey = new Survey
                {
                    name = "第一階段學習自評",
                    phase = "PartA",
                    type = "SCALE",
                    labid = labid,
                    surveyid = 12,
                    scale = "5"

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
                        
                    }
                }
                db.SaveChanges();
            }
           
            //21
            using (StreamReader sr = new StreamReader(Server.MapPath(@"~/INITTemplate/init21_survey.csv"), System.Text.Encoding.Default))
            {
                //讀取文字檔
                string txt = sr.ReadToEnd().Trim();
                string[] data = txt.Split('\n');
                Survey survey = new Survey
                {
                    name = "第二階段線上習作",
                    phase = "PartB2",
                    type = "SURVEY",
                    labid = labid,
                    surveyid = 21

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
                        
                    }
                }
                db.SaveChanges();
            }
            //22
            using (StreamReader sr = new StreamReader(Server.MapPath(@"~/INITTemplate/init22_selfeval.csv"), System.Text.Encoding.Default))
            {
                //讀取文字檔
                string txt = sr.ReadToEnd().Trim();
                string[] data = txt.Split('\n');
                Survey survey = new Survey
                {
                    name = "第二階段學習自評",
                    phase = "PartB2",
                    type = "SCALE",
                    labid = labid,
                    surveyid = 22,
                    scale = "5"

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
                        //isError = true;
                    }
                }
                db.SaveChanges();
            }
            //23
            using (StreamReader sr = new StreamReader(Server.MapPath(@"~/INITTemplate/init23_groupc.csv"), System.Text.Encoding.Default))
            {
                //讀取文字檔
                string txt = sr.ReadToEnd().Trim();
                string[] data = txt.Split('\n');
                Survey survey = new Survey
                {
                    name = "GroupC線上習作",
                    phase = "PartB1",
                    type = "SURVEY",
                    labid = labid,
                    surveyid = 23

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
                        //isError = true;
                    }
                }
                db.SaveChanges();
            }
            //24
            using (StreamReader sr = new StreamReader(Server.MapPath(@"~/INITTemplate/init24_posttest.csv"), System.Text.Encoding.Default))
            {
                //讀取文字檔
                string txt = sr.ReadToEnd().Trim();
                string[] data = txt.Split('\n');
                Survey survey = new Survey
                {
                    name = "後測",
                    phase = "Final",
                    type = "SCALE",
                    scale = "6",
                    labid = labid,
                    surveyid = 24

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
                        //isError = true;
                    }
                }
                db.SaveChanges();
            }
            //00
            using (StreamReader sr = new StreamReader(Server.MapPath(@"~/INITTemplate/init24_posttest.csv"), System.Text.Encoding.Default))
            {
                //讀取文字檔
                string txt = sr.ReadToEnd().Trim();
                string[] data = txt.Split('\n');
                Survey survey = new Survey
                {
                    name = "前測",
                    phase = "Part0",
                    type = "SCALE",
                    scale = "6",
                    labid = labid,
                    surveyid = 00

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
                        //isError = true;
                    }
                }
                db.SaveChanges();
            }
        }
    }
}