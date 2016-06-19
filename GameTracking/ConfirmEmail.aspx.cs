using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// required for EF DB Access
using GameTracking.Models;
using System.Web.ModelBinding;
/*
 * @File name : Confirm Email page 
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This is user for confirm email message.
 */
namespace GameTracking
{
    public partial class ConfirmEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString.Count>0) {
                using (UserConnection db = new UserConnection())
                {
                    //get id from query string
                    string Id = Request.QueryString["UID"];
                    //write query
                    var user = (from record in db.AspNetUsers
                                where record.Id == Id
                                select record).FirstOrDefault();

                    user.EmailConfirmed = true;
                    db.SaveChanges();
                    confirmMsg.Visible = true;
                }
            }
        }
    }
}