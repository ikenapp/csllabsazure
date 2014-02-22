using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Admin_AdminSettings : System.Web.UI.Page
{
    String lab_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        lab_id = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";
        if (!Page.IsPostBack)
        {
            String labid = "?labid=" + lab_id;
            DataImport.PostBackUrl += labid;
            Grouping.PostBackUrl += labid;
            ExerciseSettings.PostBackUrl += labid;
            SelfEvalSettings.PostBackUrl += labid;
            ExerciseSettings2.PostBackUrl += labid;
            SelfEvalSettings2.PostBackUrl += labid;
            String paras = "&title=Post&phase=Final";
            PostTestSettings.PostBackUrl += labid+paras;
            GroupCSettings.PostBackUrl += labid;
            PreTest.PostBackUrl += labid;
            FirstPhase.PostBackUrl += labid;
            SecondPhase1.PostBackUrl += labid;
            SecondPhase2.PostBackUrl += labid;
            ThirdPhase.PostBackUrl += labid;
            ExerciseExport.PostBackUrl += labid;
            SelfEvalExport.PostBackUrl += labid;
            PostTestExport.PostBackUrl += labid;
            StatusReport.PostBackUrl += labid;
        }


        if (String.IsNullOrEmpty(lab_id))
        {
            Response.Write("網路發生不可預期錯誤.請重新登入再試!");
            return;
        }
        //if (!Page.IsPostBack)
        {
            int lid = int.Parse(lab_id);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {
                    var lab = db.Labs.Where(c => c.sid == lid).First();
                    displayHandler(lab);
                }
                catch (Exception ex)
                {

                    
                }


            }
        }
    }

    private void displayHandler(dynamic lab)
    {
        String phase = "前置作業";
        if (lab.currentPhase == "INIT")
        {
            PreTest.Enabled = true;
            FirstPhase.Enabled = false;
            SecondPhase1.Enabled = false;
            SecondPhase2.Enabled = false;
            ThirdPhase.Enabled = false;

        }else if (lab.currentPhase == "Part0")
        {
            PreTest.Enabled = false;
            FirstPhase.Enabled = true;
            SecondPhase1.Enabled = false;
            SecondPhase2.Enabled = false;
            ThirdPhase.Enabled = false;
            phase = "前測";

        }
        else if (lab.currentPhase == "PartA")
        {
            PreTest.Enabled = true;
            FirstPhase.Enabled = false;
            SecondPhase1.Enabled = true;
            SecondPhase2.Enabled = false;
            ThirdPhase.Enabled = false;
            phase = "習作1";
        }
        else if (lab.currentPhase == "PartB1")
        {
            PreTest.Enabled = false;
            FirstPhase.Enabled = true;
            SecondPhase1.Enabled = false;
            SecondPhase2.Enabled = true;
            ThirdPhase.Enabled = false;
            phase = "分組2";
            String minStr = ConfigurationManager.AppSettings["Discussion_Time"];
            int min = 30;
            try
            {
                min = int.Parse(minStr);
            }
            catch (Exception)
            {
                
                //throw;
            }
            Application[lab_id + "_limit"] = UserDAO.GetNow().AddMinutes(min);
        }
        else if (lab.currentPhase == "PartB2")
        {

            PreTest.Enabled = false;
            FirstPhase.Enabled = false;
            SecondPhase1.Enabled = true;
            SecondPhase2.Enabled = false;
            ThirdPhase.Enabled = true　;
            phase = "習作2";
        }
        else if (lab.currentPhase == "Final")
        {
            PreTest.Enabled = false;
            FirstPhase.Enabled = false;
            SecondPhase1.Enabled = false;
            SecondPhase2.Enabled = true;
            ThirdPhase.Enabled = false;
            phase = "後測";
        }

        LabsInfo.Text = String.Format("場次 : {0} [ {1} ] , 時間 : {2:yyyy-MM-dd} ~ {3:yyyy-MM-dd}. 目前階段 => {4}", lab.name, lab.desc, lab.begin, lab.end, phase);
    }



    protected void FirstPhase_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        int idx = btn.TabIndex;
        if (String.IsNullOrEmpty(lab_id))
        {
            return;
        }
        int lid = int.Parse(lab_id);
        using (LabsDBEntities db = new LabsDBEntities())
        {
            try
            {
                var lab = db.Labs.Where(c => c.sid == lid).First();
                switch (idx)
                {
                    case 0:
                        lab.currentPhase = "Part0";
                        break;
                    case 1:
                        lab.currentPhase = "PartA";
                        break;
                    case 11:
                        lab.currentPhase = "PartB1";
                        break;
                    case 12:
                        lab.currentPhase = "PartB2";
                        break;
                    case 2:
                        lab.currentPhase = "Final";
                        break;
                }
                db.SaveChanges();
                displayHandler(lab);
            }
            catch (Exception ex)
            {


            }


        }
    }
}