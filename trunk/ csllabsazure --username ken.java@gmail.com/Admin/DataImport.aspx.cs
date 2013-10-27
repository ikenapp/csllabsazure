using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_DataImport : System.Web.UI.Page
{
    String labid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        labid = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";
        DataImport.Visible = false;
        MsgLabel2.Visible = false;
        GroupingLink.Visible = false;
        Preview.Visible = false;
        if (!Page.IsPostBack)
        {
            GroupingLink.PostBackUrl += "?labid=" + labid + "&preview=true";
            BackLink.NavigateUrl = "~/Admin/LabsSettings.aspx?labid=" + labid;
            int lab_id = int.Parse(labid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                foreach (var s in db.Users.Where(c => c.labid == lab_id ))
                {
                    Preview.NavigateUrl = "~/Admin/Grouping.aspx?labid=" + labid + "&preview=true";
                    Preview.Visible = true;
                    break;
                }
            }
        }

        GridView1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MsgLabel.Text = "";;
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

        if (FileUpload1.PostedFile.ContentLength <= 3036)
        {
            FileUpload1.SaveAs(Server.MapPath(@"~/Upload/Lab_" +labid+"_Students.csv"));
            MsgLabel.Text = "檔案上傳成功";
            DataImport.Visible = true;
        }
        else
        {
            MsgLabel.Text = "檔案不可超過3M";
        }

    }
    protected void DataImport_Click(object sender, EventArgs e)
    {
        DataImport.Visible = true;
        MsgLabel2.Visible = true;
        MsgLabel2.Text = "";
        bool isError = false;
        clearUsers();
        int acount = 0;
        int bcount = 0;
        int agroupcount = 1;
        int bgroupcount = 1;
        String[] group = { "A", "B", "C" };
        String gStr = "N";
        int gid = 0;
        int r = new Random().Next() % 10;
        using (LabsDBEntities db = new LabsDBEntities())
        {
            using (StreamReader sr = new StreamReader(Server.MapPath(@"~/Upload/Lab_" + labid + "_Students.csv"), System.Text.Encoding.Default))
            {
                //讀取文字檔
                string txt = sr.ReadToEnd().Trim();
                string[] data = txt.Split('\n');
                for (int i = 1; i < data.Length; i++)
                {
                    try
                    {
                        String[] userData = data[i].Split(',');
                        if (userData != null && userData.Length == 6)
                        {
                            String student_idStr = userData[0];
                            String nameStr = userData[1];
                            String birthStr = userData[2];
                            DateTime birth = DateTime.ParseExact(birthStr,"yyyy/MM/dd",null);
                            String genderStr = userData[3];
                            String schoolStr = userData[4];
                            String deptStr = userData[5];
                            int num = i + r;
                            gStr = group[(num % 3)];
                            if (num % 3 == 0)
                            {
                                //Group A
                                acount++;
                                if (acount > 4)
                                {
                                    agroupcount++;
                                    acount = 1;
                                }
                                gid = agroupcount;
                                  
                            }
                            else if (num % 3 == 1)
                            {
                                //Group B
                                bcount++;
                                if (bcount > 4)
                                {
                                    bgroupcount++;
                                    bcount = 1;
                                }
                                gid = bgroupcount;
                            }
                            else
                            {
                                //Group C
                                gid = 1;
                            }
                            User u = new User
                            {
                                name = nameStr,
                                nickname = student_idStr,
                                student_id = student_idStr,
                                passsword = student_idStr,
                                birthday = birth,
                                age = (int)((DateTime.Now - birth).TotalDays / 365),
                                school = schoolStr,
                                dept = deptStr,
                                group=gStr,
                                groupid = gid,
                                gender = genderStr,
                                labid = int.Parse(this.labid)
                            };
                            db.Users.Add(u); 

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
            clearUsers();
        }
        else
        {
            GroupingLink.Visible = true;
            MsgLabel2.Text = "資料匯入完畢";
        }

        
    }

    private void clearUsers()
    {
        int lab_id = int.Parse(this.labid);
        using (LabsDBEntities db = new LabsDBEntities())
        {
            foreach (var u in db.Users.Where(c => c.labid == lab_id))
            {
                if (u.group != "admin")
                {
                    db.Users.Remove(u);
                }
            }
            db.SaveChanges();
        }
    }
}