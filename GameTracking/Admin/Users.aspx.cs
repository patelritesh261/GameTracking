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
 * 
 * @File name : Users Page
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This page provides access to admin to delete and  show all users.
 * 
 * 
 * 
 */
namespace GameTracking.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GetUsers();
            }
        }
        /**
* <summary>
* This method gets users  from table.
* </summary>
* 
* @method GetUsers
* @returns {void}
*/

        protected void GetUsers()
        {
            using (UserConnection db = new UserConnection())
            {
                var Users = (from users in db.AspNetUsers
                             select users);

                UsersGridView.DataSource = Users.ToList();
                UsersGridView.DataBind();
            }
        }
        /**
     * <summary>
     * This event handler deletes a user from the db using EF
     * </summary>
     * 
     * @method UsersGridView_RowDeleting
     * @param {object} sender
     * @param {GridViewDeleteEventArgs} e
     * @returns {void}
     */
        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int selectedRow = e.RowIndex;

            string UserID = UsersGridView.DataKeys[selectedRow].Values["Id"].ToString();

            using (UserConnection db = new UserConnection())
            {
                AspNetUser deletedUser = (from users in db.AspNetUsers
                                          where users.Id == UserID
                                          select users).FirstOrDefault();

                db.AspNetUsers.Remove(deletedUser);
                db.SaveChanges();
            }

            // refresh the grid
            this.GetUsers();
        }
    }
}