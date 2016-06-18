using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// using statements required for EF DB access
using GameTracking.Models;
using System.Web.ModelBinding;
/*
 * @File name : Team Details Page
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This page provides add and update functionality of Team
 * 
 */
namespace GameTracking.AdminPanel
{
    public partial class TeamDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //bind game dropdown
                ddlBindData();
                if (Request.QueryString.Count > 0)
                {
                    /*
            * @method GetTeam()
            * @return void
            * 
            * This methos use for get particular team form DB which we want to Update
            */
                    this.GetTeam();
                }
            }
        }

        private void GetTeam()
        {
            try
            {
                //populate form with existing data
                int TID = Convert.ToInt32(Request.QueryString["TeamID"].ToString());

                //connect to EF DB
                using (DefaultConnectionGM db = new DefaultConnectionGM())
                {
                    // populate a team object instance with the TID from the URL Parameter
                    var Team = (from team in db.Teams
                                where team.TID == TID
                                select team).FirstOrDefault();
                    // map the team properties to the form controls
                    if (Team != null)
                    {
                        txtTeamName.Text = Team.Name;
                        txtshortdesc.Text = Team.Description;
                        ddlGameName.SelectedValue = Team.Gid.ToString();
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
* @method ddlBindData
* @returns {void}
*/
        private void ddlBindData()
        {
            try
            {
                using (DefaultConnectionGM db = new DefaultConnectionGM())
                {
                   

                    //Write query
                    ddlGameName.DataSource = (from allGames in db.Games
                                 orderby allGames.Name
                                 select new { allGames.GID,allGames.Name}).ToList();

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
    * This event handler update or add record to DB
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
            // Use EF to connect to the server
            using (DefaultConnectionGM db = new DefaultConnectionGM())
            {
                // use the Teams model to create a new team object and
                // save a new record
                Models.Team newTeam = new Models.Team();

                int TID = 0;

                if (Request.QueryString.Count > 0)
                {
                        TID=Convert.ToInt32( Request.QueryString["TeamID"]);
                    //write query
                     newTeam = (from teamRecord in db.Teams
                                where teamRecord.TID == TID
                                select teamRecord).FirstOrDefault();

                    Session["TeamMsg"] = "Your Record Updated Succeessfully."; 
                }

                //add data to DB
                newTeam.Name = txtTeamName.Text.ToString().Trim();
                newTeam.Description = txtshortdesc.Text.ToString().Trim();
                newTeam.Gid = Convert.ToInt32(ddlGameName.SelectedValue);

                //check operation insert or update
                if (TID == 0)
                {
                    //check record is already in DB
                    rowCount = checkAlready(newTeam);
                    if (rowCount == 0)
                    {
                        db.Teams.Add(newTeam);

                        Session["TeamMsg"] = "Your Record Added Succeessfully.";
                        //save our change
                        db.SaveChanges();

                        // Redirect back to the updated games page
                        Response.Redirect("~/AdminPanel/Team.aspx");
                    }
                    else {
                        lblMsg.Text = "Record has been already added.";
                        alertMsg.Visible = true;
                    }
                }
                else
                {
                    //save our change
                    db.SaveChanges();

                    // Redirect back to the updated games page
                    Response.Redirect("~/AdminPanel/Team.aspx");
                }
            }
        }
        /* <summary>
* This method check if record already have in table.
* </summary>
* 
* @method checkAlready
* @returns {int
    }
*/
        private int checkAlready(Models.Team newGame)
        {
            int rowCount = 0;
            try
            {

                using (DefaultConnectionGM db = new DefaultConnectionGM())
                {
                    //write query
                    var recordAlready = (from record in db.Teams
                                         where record.Name == newGame.Name
                                         select record).First();
                    if (recordAlready != null)
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