using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// required for EF DB Access
using GameTracking.Models;
using System.Web.ModelBinding;
namespace GameTracking.AdminPanel
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    //Get userdetails
                    GetUserDetails();
                }
            }
        }

        private void GetUserDetails()
        {
            //Connect to EF DB
            using (UserConnection db = new UserConnection())
            {
                string UserName = Session["UserName"].ToString();
                //write query
                var user = (from record in db.AspNetUsers
                            where record.UserName == UserName
                            select record).FirstOrDefault();

                UserNameTextBox.Text = user.UserName;
                PhoneNumberTextBox.Text = user.PhoneNumber;
                EmailTextBox.Text = user.Email;
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            //redirect page to dashboard
            Response.Redirect("/AdminPanel/Dashboard.aspx");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            //Connect to EF DB
            using (UserConnection db = new UserConnection())
            {
                string UserName = Session["UserName"].ToString();
                //write query
                var user = (from record in db.AspNetUsers
                            where record.UserName == UserName
                            select record).FirstOrDefault();

                user.UserName= UserNameTextBox.Text.Trim() ;
                user.PhoneNumber= PhoneNumberTextBox.Text.Trim();
                user.Email = EmailTextBox.Text.Trim();

                //save data
                db.SaveChanges();

                //redirect page to dashboard
                Response.Redirect("/AdminPanel/Dashboard.aspx");
            }
        }
    }
}