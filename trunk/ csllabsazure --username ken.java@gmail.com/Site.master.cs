using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    List<string> ShowMenu = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        {
            ShowMenu.Clear();
            ShowMenu.Add("首頁");
            if (Session["isLogin"] != null && Session["isLogin"].ToString() == "Y")
            {
                //ShowMenu.Add("首頁/個人設定");
                if (Session["USER_DATA"] != null)
                {
                    User u = Session["USER_DATA"] as User;
                    if (u != null)
                    {
                        int labid = u.labid;
                        using (LabsDBEntities db = new LabsDBEntities())
                        {
                            try
                            {
                                var lab = db.Labs.Where(c => c.sid == labid).First();
                                if (lab.currentPhase == "INIT" || lab.currentPhase == "PartA")
                                {
                                    ShowMenu.Add("首頁/第一階段(第一週)");
                                }
                                else if (lab.currentPhase == "PartB1" || lab.currentPhase == "PartB2")
                                {
                                    ShowMenu.Add("首頁/第二階段(第二週)");
                                }
                                else if (lab.currentPhase == "Final")
                                {

                                    ShowMenu.Add("首頁/第三階段(第三週)");
                                }
                            }
                            catch (Exception ex)
                            {


                            }


                        }
                    }
                    if (u != null && u.group == "admin")
                    {
                        //For Testing
                        ShowMenu.Add("首頁/第一階段(第一週)");
                        ShowMenu.Add("首頁/第二階段(第二週)");
                        ShowMenu.Add("首頁/第三階段(第三週)");
                        ShowMenu.Add("首頁/管理者設定");
                    }
                    
                }
                LoginLink.Visible = false;
                LogoutLink.Visible = true;
            }
            else
            {
                LoginLink.Visible = true;
                LogoutLink.Visible = false;
            }
           
            
        }
    }
    protected void NavigationMenu_MenuItemDataBound(object sender, MenuEventArgs e)
    {
        bool IsShowMenu = false;
        foreach (string MenuValuePath in ShowMenu)
        {
            if (e.Item.ValuePath == MenuValuePath)
            {
                IsShowMenu = true;
                break;
            }
        }

        if (IsShowMenu == false)
        {
            if (e.Item.Parent != null)
            {
                e.Item.Parent.ChildItems.Remove(e.Item);
            }
        }

    }
}
