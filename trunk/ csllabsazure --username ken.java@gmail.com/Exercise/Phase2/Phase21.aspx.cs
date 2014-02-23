using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lib;

public partial class Execise_Phase21 : System.Web.UI.Page
{
    int lab_id;
    int survey_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        Server.Transfer("Phase2.aspx");
    }
   
}