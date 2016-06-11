using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// using statements required for EF DB access
using GameTracking.Models;
using System.Web.ModelBinding;
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
                using (DefaultConnection db = new DefaultConnection())
                {
                    // populate a team object instance with the TID from the URL Parameter
                    var Team = (from team in db.Teams1
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
                using (DefaultConnection db = new DefaultConnection())
                {
                   

                    //Write query
                    ddlGameName.DataSource = (from allGames in db.Games1
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

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            // Use EF to connect to the server
            using (DefaultConnection db = new DefaultConnection())
            {
                // use the Teams model to create a new team object and
                // save a new record
                Teams newTeam = new Teams();

                int TID = 0;

                if (Request.QueryString.Count > 0)
                {
                        TID=Convert.ToInt32( Request.QueryString["TeamID"]);
                    //write query
                     newTeam = (from teamRecord in db.Teams1
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
                    db.Teams1.Add(newTeam);

                    Session["TeamMsg"] = "Your Record Added Succeessfully.";
                }

                //save our change
                db.SaveChanges();

                // Redirect back to the updated games page
                Response.Redirect("~/AdminPanel/Team.aspx");
            }
        }
    }
}