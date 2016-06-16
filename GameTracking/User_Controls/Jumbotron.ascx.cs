using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/*
 * @File name : Jumbotron
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : this is user control which is use for Dashboard
 * 
 * 
 */
namespace GameTracking.User_Controls
{
    public partial class Jumbotron : System.Web.UI.UserControl
    {
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public PlaceHolder BodyContent { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            content.Controls.Add(BodyContent);
        }
    }
}