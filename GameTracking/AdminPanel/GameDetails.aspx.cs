// using statements required for EF DB access
using GameTracking.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
 /*
 * @File name : Game Details Page
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This page shows all the games in table and allows to pagging and sorting
 */
namespace GameTracking.AdminPanel
{
    public partial class GameDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                /*
                 * @method GetGame()
                 * @return void
                 * 
                 * This methos use for get particular game form DB which we want to Update
                 */
                this.GetGame();
            }
        }
        private void GetGame()
        {
            try
            {
                // populate teh form with existing data from the database
                int GID = Convert.ToInt32(Request.QueryString["GID"]);

                // connect to the EF DB
                using (DefaultConnectionGM db = new DefaultConnectionGM())
                {
                    // populate a game object instance with the GID from the URL Parameter
                    Models.Game updatedStudent = (from game in db.Games
                                            where game.GID == GID
                                            select game).FirstOrDefault();

                    // map the student properties to the form controls
                    if (updatedStudent != null)
                    {
                        txtGameName.Text = updatedStudent.Name;
                        txtshortdesc.Text = updatedStudent.Description;
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
     * This event handler allows to add or update records to DB
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
                // use the Games model to create a new game object and
                // save a new record
                Models.Game newGame = new Models.Game();

                int GID = 0;

                if (Request.QueryString.Count > 0) // our URL has a StudentID in it
                {
                    // get the id from the URL
                    GID = Convert.ToInt32(Request.QueryString["GID"]);

                    // get the current student from EF DB
                    newGame = (from game in db.Games
                               where game.GID == GID
                               select game).FirstOrDefault();
                   
                    Session["GameMsg"] = "Your Record Updated Succeessfully.";
                }

                // add form data to the new game record
                newGame.Name = txtGameName.Text;
                newGame.Description = txtshortdesc.Text;


                // use LINQ to ADO.NET to add / insert new student into the database

                if (GID == 0)
                {

                    //check record is already in DB
                    rowCount = checkAlready(newGame);
                    if (rowCount == 0)
                    {
                        db.Games.Add(newGame);

                        Session["GameMsg"] = "Your Record Added Succeessfully.";
                        // save our changes - also updates and inserts
                        db.SaveChanges();

                        // Redirect back to the updated games page
                        Response.Redirect("~/AdminPanel/Game.aspx");
                    }
                    else
                    {
                        lblMsg.Text = "Record has been already added.";
                        alertMsg.Visible = true;

                    }



                }
                else {
                    // save our changes - also updates and inserts
                    db.SaveChanges();

                    // Redirect back to the updated games page
                    Response.Redirect("~/AdminPanel/Game.aspx");
                }


                
            }
        }
        /* <summary>
        * This method check if record already have in table.
        * </summary>
        * 
        * @method checkAlready
        * @returns {int }
        */
        private int checkAlready(Models.Game newGame)
        {
            int rowCount = 0;
            try
            {

                using (DefaultConnectionGM db = new DefaultConnectionGM())
                {
                    //write query
                    var recordAlready = (from record in db.Games
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
        /**
     * <summary>
     * This event handler redirect to Games
     * </summary>
     * 
     * @method btnCancel_Click
     * @param {object} sender
     * @param {EventArgs} e
     * @returns {void}
     */
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Redirect back to Games page
            Response.Redirect("~/AdminPanel/Game.aspx");
        }
    }
}