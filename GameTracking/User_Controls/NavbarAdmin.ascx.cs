using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/*
* @File name :Admin  Navigation bar user control 
* @Author : Ritesh Patel and Parvati patel
* @Website name : GameTracking(http://gametracking.azurewebsites.net/)
* @File description : Navigation Bar with active link
*
* */

namespace GameTracking.User_Controls
{
    public partial class NavbarAdmin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"].ToString() == "admin")
                users.Visible = true;
            else
                users.Visible = false;
            SetActivePage();
        }
        /**
         * This method adds a css class of "active" to list items
         * relating to the current page
         * 
         * @private
         * @method SetActivePage
         * @return {void}
         */
        private void SetActivePage()
        {
            switch (Page.Title)
            {
                case "Dashboard":
                    home.Attributes.Add("class", "liactive");
                    break;
                case "Game Page":
                    games.Attributes.Add("class", "liactive");
                    break;
                case "Team Page":
                    teams.Attributes.Add("class", "liactive");
                    break;
                case "Game Records":
                    gamerecord.Attributes.Add("class", "liactive");
                    break;
                case "Profile":
                    profile.Attributes.Add("class", "liactive");
                    break;
                case "Users":
                    users.Attributes.Add("class", "liactive");
                    break;
            }
        }
    }
}