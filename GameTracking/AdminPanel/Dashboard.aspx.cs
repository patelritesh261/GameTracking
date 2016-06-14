using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// using statements that are required to connect to EF DB
using GameTracking.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;
using System.Globalization;
namespace GameTracking.AdminPanel
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //get data
                GetData();
            }
        }

        private void GetData()
        {
            using (DefaultConnection db = new DefaultConnection())
            {
                //games count
                var countGame = (from count in db.Games1
                                 select count).Count();

                //teams count
                var countTeam = (from count in db.Teams1
                                 select count).Count();

                //games records
                var countGRecords = (from count in db.GameRecords1
                                     select count).Count();

                //bind data
                lblGames.Text = countGame.ToString();
                lblTeams.Text = countTeam.ToString();
                lblGRecord.Text = countGRecords.ToString();
            }
        }
    }
}