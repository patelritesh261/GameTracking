using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
* @File name : Navigation bar user control 
* @Author : Ritesh Patel and Parvati patel
* @Website name : 
* @File description : Navigation Bar
*
* */

namespace GameTracking
{
    public partial class Navbar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                case "Home Page":
                    home.Attributes.Add("class", "liactive");
                    break;
                case "Contact":
                    contact.Attributes.Add("class", "liactive");
                    break;
            }
        }
    }
}