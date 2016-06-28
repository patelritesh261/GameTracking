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
/*
*  * @File name : Home page 
* @Author : Ritesh Patel and Parvati Patel
* @Website name : GameTracking(http://gametracking.azurewebsites.net/)
* @File description : This is public home page.
* 
* 
*/
namespace GameTracking
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //bind data to form
                bindGames();
            }
        }
        /**
       * <summary>
       * This method gets the games data from the DB
       * </summary>
       * 
       * @method bindGames
       * @returns {void}
       */
        private void bindGames()
        {
            //Connect to EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                //get current week
                CultureInfo ciCurr = CultureInfo.CurrentCulture;
                int Week = Convert.ToInt32(ciCurr.Calendar.GetWeekOfYear(DateTime.Now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday).ToString());


                //write query
                var GameRecords = (from GR in db.GameRecords1
                                   join G in db.Games1 on GR.Gid equals G.GID
                                   join T in db.Teams1 on GR.Team1 equals T.TID
                                   join T1 in db.Teams1 on GR.Team2 equals T1.TID
                                   join W in db.Teams1 on GR.WTeam equals W.TID
                                   where GR.Week==Week
                                   select new { GR.GRID, GR.Sepectators, GR.T1WinScore, GR.T2WinScore, GR.Date, GR.Team2, GR.Team1, GR.WTeam, GName = G.Name, TeamN1 = T.Name, TeamN2 = T1.Name, WTeamN = W.Name, TotalScore=GR.T1WinScore+GR.T2WinScore,GR.Week });

                if (GameRecords.Count() > 0)
                {
                    //bind result to grid view
                    rptGame.DataSource = GameRecords.ToList();
                    rptGame.DataBind();
                    Jumbotron3.Visible = false;
                }
                else {
                    Jumbotron3.Visible = true;
                }
                
            }
        }

        protected void lbGame_Click(object sender, EventArgs e)
        {
            // find link button and createe object
            LinkButton lnkBtnTags = (LinkButton)sender;
            //Connect to EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                var recordGame = (from record in db.Games1
                                  where record.Name == lnkBtnTags.Text.Trim()
                                  select record).FirstOrDefault();

                //bind data to model pop up
                lblTitle.Text = recordGame.Name;
                lblbody.Text = recordGame.Description;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
                
        }

        protected void lbTeam1_Click(object sender, EventArgs e)
        {
            // find link button and createe object
            LinkButton lnkBtnTags = (LinkButton)sender;
            //Connect to EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                var recordGame = (from record in db.Teams1
                                  where record.Name == lnkBtnTags.Text.Trim()
                                  select record).FirstOrDefault();

                //bind data to model pop up
                lblTitle.Text = recordGame.Name;
                lblbody.Text = recordGame.Description;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
        }

        protected void lbTeam2_Click(object sender, EventArgs e)
        {
            // find link button and createe object
            LinkButton lnkBtnTags = (LinkButton)sender;
            //Connect to EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                var recordGame = (from record in db.Teams1
                                  where record.Name == lnkBtnTags.Text.Trim()
                                  select record).FirstOrDefault();

                //bind data to model pop up
                lblTitle.Text = recordGame.Name;
                lblbody.Text = recordGame.Description;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
        }
    }
}