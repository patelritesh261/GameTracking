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
 * @File name : Game Record Details Page
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This page provides add and update functionality of game records
 * 
 *  */
namespace GameTracking.AdminPanel
{
    public partial class GameRecordDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                //bind game dropdown
                ddlBindGameData();

                if (Request.QueryString.Count > 0)
                {
                    GetGameRecord();
                }
            }
        }
        /**
* <summary>
* This method gets gamesrecords from DB and bind to form
* </summary>
* 
* @method GetGameRecord
* @returns {void}
*/
        private void GetGameRecord()
        {
            try
            {
                int GRID = Convert.ToInt32(Request.QueryString["GRID"]);
                if (GRID > 0) {
                    //connect to EF DB
                    using (DefaultConnection db = new DefaultConnection())
                    {
                        var gameRecords = (from records in db.GameRecords1
                                           where records.GRID == GRID
                                           select records).FirstOrDefault();

                        //bind data to form
                        txtGameDate.Text = gameRecords.Date.ToString("yyyy-MM-dd");
                        txtWinTeamScore.Text = gameRecords.T1WinScore.ToString();
                        txtLoseTeamScore.Text = gameRecords.T2WinScore.ToString();
                        txtSpectators.Text = gameRecords.Sepectators.ToString();
                        ddlGameName.SelectedValue = gameRecords.Gid.ToString();
                        //fill team drop down
                        ddlTeamData(gameRecords.Gid);
                        //set selected value to team dropdowns
                        ddlTeamName1.SelectedValue = gameRecords.Team1.ToString();
                        ddlTeamName2.SelectedValue = gameRecords.Team2.ToString();
                        ddlTeamName2.Enabled = true;
                        //bind value to win dropdown
                        ddlWinTeam.Items.Clear();
                        ddlWinTeam.Items.Insert(0, new ListItem("Select Winning Team", "0"));
                        ddlWinTeam.Items.Insert(1, new ListItem(ddlTeamName1.SelectedItem.Text.ToString(), ddlTeamName1.SelectedValue));
                        ddlWinTeam.Items.Insert(2, new ListItem(ddlTeamName2.SelectedItem.Text.ToString(), ddlTeamName2.SelectedValue));
                        ddlWinTeam.SelectedValue = gameRecords.WTeam.ToString();
                        ddlWinTeam.Enabled = true;

                        btnsubmit.Text = "Update";

                    }
                }
            }
            catch (Exception e)
            {

            }
        }

        /**
* <summary>
* This method gets games from DB and bind to dropdown
* </summary>
* 
* @method ddlBindGameData
* @returns {void}
*/
        private void ddlBindGameData()
        {
            try
            {
                using (DefaultConnection db = new DefaultConnection())
                {


                    //Write query
                    ddlGameName.DataSource = (from allGames in db.Games1
                                              orderby allGames.Name
                                              select new { allGames.GID, allGames.Name }).ToList();

                    //bind data to dropdown
                    ddlGameName.DataTextField = "Name";
                    ddlGameName.DataValueField = "GID";
                    //ddlGameName.DataSource = Games;
                    ddlGameName.DataBind();

                    //first item
                    ddlGameName.Items.Insert(0, new ListItem("Select Game", "0"));
                }
            }
            catch (Exception e) { }
        }
        /**
        * <summary>
        * This event handler use for bind team1 and team 2 dropdown
        * </summary>
        * 
        * @method ddlGameName_SelectedIndexChanged
        * @param {object} sender
        * @param {EventArgs} e
        * @returns {void}
        */
        protected void ddlGameName_SelectedIndexChanged(object sender, EventArgs e)
        {
            int GID = Convert.ToInt32(ddlGameName.SelectedValue);

            //bind team1 and team2 drop down
            ddlTeamData(GID);
        }
        /**
* <summary>
* This method gets teams from DB and bind to dropdown
* </summary>
* 
* @method ddlTeamData
* @parameters {GID}
* @returns {void}
*/
        private void ddlTeamData(int GID)
        {
            try {
                //connect to database
                using (DefaultConnection db = new DefaultConnection()) {

                    //write query
                    var TeamRecords = (from records in db.Teams1
                                       where records.Gid == GID
                                       select new { records.Name, records.TID }).ToList();

                    //bind data in team1 drop down
                    ddlTeamName1.DataTextField = "Name";
                    ddlTeamName1.DataValueField = "TID";
                    ddlTeamName1.DataSource = TeamRecords;
                    ddlTeamName1.DataBind();
                    ddlTeamName1.Enabled = true;
                    //first item
                    ddlTeamName1.Items.Insert(0, new ListItem("Select Team", "0"));

                    //bind data in team2 drop down
                    ddlTeamName2.DataTextField = "Name";
                    ddlTeamName2.DataValueField = "TID";
                    ddlTeamName2.DataSource = TeamRecords;
                    ddlTeamName2.DataBind();
                   

                    //first item
                    ddlTeamName2.Items.Insert(0, new ListItem("Select Team", "0"));
                }
            }
            catch (Exception e) { }
        }
        /**
        * <summary>
        * This event handler allows to bind winner dropdown
        * </summary>
        * 
        * @method ddlTeamName2_SelectedIndexChanged
        * @param {object} sender
        * @param {EventArgs} e
        * @returns {void}
        */
        protected void ddlTeamName2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //bind Winner dropdown
            if (ddlTeamName1.SelectedValue != ddlTeamName2.SelectedValue)
            {
                ddlWinTeam.Items.Clear();
                ddlWinTeam.Items.Insert(0, new ListItem("Select Winning Team", "0"));
                ddlWinTeam.Items.Insert(1, new ListItem(ddlTeamName1.SelectedItem.Text.ToString(),ddlTeamName1.SelectedValue));
                ddlWinTeam.Items.Insert(2, new ListItem(ddlTeamName2.SelectedItem.Text.ToString(), ddlTeamName2.SelectedValue));
                ddlWinTeam.Enabled = true;
            }
        }
        /**
        * <summary>
        * This event handler allows to enable team2 dropdown
        * </summary>
        * 
        * @method ddlTeamName1_SelectedIndexChanged
        * @param {object} sender
        * @param {EventArgs} e
        * @returns {void}
        */
        protected void ddlTeamName1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlTeamName2.Enabled = true;
        }
        /**
        * <summary>
        * This event handler allows to save or update data
        * </summary>
        * 
        * @method btnsubmit_Click
        * @param {object} sender
        * @param {EventArgs} e
        * @returns {void}
        */
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int rowCount;
            //connect to EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                if (Convert.ToInt32(txtWinTeamScore.Text)>Convert.ToInt32(txtLoseTeamScore.Text )) {
                    if ((ddlTeamName1.SelectedValue != ddlTeamName2.SelectedValue))
                    {
                        int GRID = 0;
                        //define onject of Game record model
                        GameRecords newGameRecord = new GameRecords();

                        if (Request.QueryString.Count > 0)
                        {
                            GRID = Convert.ToInt32(Request.QueryString["GRID"]);
                            newGameRecord = (from record in db.GameRecords1
                                             where record.GRID == GRID
                                             select record).FirstOrDefault();
                          
                            Session["GRMsg"] = "Your Record Updated Succeessfully.";
                        }

                        newGameRecord.Date = Convert.ToDateTime(txtGameDate.Text.ToString());
                        newGameRecord.Gid = Convert.ToInt32(ddlGameName.SelectedValue);
                        newGameRecord.Team1 = Convert.ToInt32(ddlTeamName1.SelectedValue);
                        newGameRecord.Team2 = Convert.ToInt32(ddlTeamName2.SelectedValue);
                        newGameRecord.WTeam = Convert.ToInt32(ddlWinTeam.SelectedValue);
                        newGameRecord.Sepectators = Convert.ToInt32(txtSpectators.Text.ToString().Trim());
                        newGameRecord.T1WinScore = Convert.ToInt32(txtWinTeamScore.Text.ToString().Trim());
                        newGameRecord.T2WinScore = Convert.ToInt32(txtLoseTeamScore.Text.ToString().Trim());
                        newGameRecord.T1LoseScore = Convert.ToInt32(txtLoseTeamScore.Text.ToString().Trim());
                        newGameRecord.T2LoseScore = Convert.ToInt32(txtWinTeamScore.Text.ToString().Trim());
                        newGameRecord.TotalScore = Convert.ToInt32(txtWinTeamScore.Text.ToString().Trim()) + Convert.ToInt32(txtLoseTeamScore.Text.ToString().Trim());
                        CultureInfo ciCurr = CultureInfo.CurrentCulture;
                        newGameRecord.Week = Convert.ToInt32(ciCurr.Calendar.GetWeekOfYear(Convert.ToDateTime(txtGameDate.Text.ToString()), CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday).ToString());

                        //check insert of update operation
                        if (GRID == 0)
                        {

                            //check record is already in DB
                            rowCount = checkAlready(newGameRecord);
                            if (rowCount == 0)
                            {
                                db.GameRecords1.Add(newGameRecord);
                                Session["GRMsg"] = "Your Record Added Succeessfully.";
                                //save our change
                                db.SaveChanges();

                                // Redirect back to the updated games page
                                Response.Redirect("~/AdminPanel/GameRecord.aspx");
                            }
                            else
                            {
                                lblMsg.Text = "Record has been already added.";
                                alertMsg.Visible = true;

                            }



                        }
                        else
                        {
                            //save our change
                            db.SaveChanges();

                            // Redirect back to the updated games page
                            Response.Redirect("~/AdminPanel/GameRecord.aspx");
                        }
                    }
                    else {
                        lblMsg.Text = "Team1 and Team2 have different value.";
                        ddlTeamName1.Focus();
                        alertMsg.Visible = true;
                    }

               
            }
            else{
                    lblMsg.Text = "Winning team has always higher score.";
                    txtWinTeamScore.Focus();
                    alertMsg.Visible = true;
            }

            }
        }
        /**
* <summary>
* This method check if record already have in table.
* </summary>
* 
* @method checkAlready
* @returns {int}
*/
        private int checkAlready(GameRecords newGameRecord)
        {
            int rowCount = 0;
            try {
               
                using (DefaultConnection db =new DefaultConnection())
                {
                    //write query
                    var recordAlready=(from record in db.GameRecords1
                                      where record.Date==newGameRecord.Date
                                      && record.Gid==newGameRecord.Gid
                                      && record.Team1==newGameRecord.Team1
                                      && record.Team2==newGameRecord.Team2
                                      && record.WTeam==newGameRecord.WTeam
                                      select record).First();
                    if (recordAlready != null )
                    {
                        rowCount = 1;

                    }
                }
               
                    
            }
            catch (Exception e)
            { }
            return rowCount;
        }
    }
    
}