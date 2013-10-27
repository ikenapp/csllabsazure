using System;
using System.Collections.Generic;
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
                    Response.Redirect("~/Admin/AdminSettings.aspx");
                }
                catch (Exception ex)
                {
                    MessageLabel.Text = (ex.Message);
                }
                
            }
        }
    }
}