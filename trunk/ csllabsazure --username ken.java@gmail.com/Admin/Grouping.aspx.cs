using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Grouping : System.Web.UI.Page
{
    String labid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        labid = Request.QueryString["labid"] != null ? Request.QueryString["labid"].ToString() : "";
        if (String.IsNullOrEmpty(labid))
        {
            LabInfo.Text = "網路發生不可預期錯誤.請重新登入再試!";
            return;
        }
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["preview"] == null)
            {
                BackLink.NavigateUrl = "~/Admin/LabsSettings.aspx?labid=" + labid;
            }
            else
            {
                BackLink.NavigateUrl = "~/Admin/DataImport.aspx?labid=" + labid;
            }
            int lab_id = int.Parse(this.labid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                try
                {
                    var lab = db.Labs.Where(c => c.sid == lab_id).First();
                    LabInfo.Text = String.Format("場次 : {0} [ {1} ] , 時間 : {2:yyyy-MM-dd} ~ {3:yyyy-MM-dd}.<br>學生群組列表", lab.name, lab.desc, lab.begin, lab.end);
                }
                catch (Exception ex)
                {

                    //throw;
                }

                
                


            }
        }
        
    }
}