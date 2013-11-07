using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

/// <summary>
/// Summary description for UserDAO
/// </summary>
/// 
namespace Lib
{
    public class UserDAO
    {
        private static LabsDBEntities db = new LabsDBEntities();
        public UserDAO()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static User GetUser(string id, String pwd)
        {
            User u = null;
            try
            {
                u = (from c in db.Users where c.student_id == id & c.passsword == pwd select c).First();
            }
            catch (Exception ex)
            {


            }
            return u;
        }

        public static void UpdateUser(User u)
        {
            try
            {
                db.SaveChanges();

            }
            catch (Exception ex)
            {


            }
        }

        public static User GetUserFromSession()
        {
            User ret = null;
            HttpSessionState Session = HttpContext.Current.Session;
            if (Session["isLogin"] != null && Session["isLogin"].ToString() == "Y")
            {
                if (Session["USER_DATA"] != null)
                {
                    ret= Session["USER_DATA"] as User;
                }
            }
            return ret;
        }
    }
}