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
                using (DefaultConnection db = new DefaultConnection())
                {
                    // populate a game object instance with the GID from the URL Parameter
                    Games updatedStudent = (from game in db.Games1
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

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int rowCount;
            // Use EF to connect to the server
            using (DefaultConnection db = new DefaultConnection())
            {
                // use the Games model to create a new game object and
                // save a new record
                Games newGame = new Games();

                int GID = 0;

                if (Request.QueryString.Count > 0) // our URL has a StudentID in it
                {
                    // get the id from the URL
                    GID = Convert.ToInt32(Request.QueryString["GID"]);

                    // get the current student from EF DB
                    newGame = (from game in db.Games1
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
                        db.Games1.Add(newGame);

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
* @returns {int
    }
*/
        private int checkAlready(Games newGame)
        {
            int rowCount = 0;
            try
            {

                using (DefaultConnection db = new DefaultConnection())
                {
                    //write query
                    var recordAlready = (from record in db.Games1
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Redirect back to Games page
            Response.Redirect("~/AdminPanel/Game.aspx");
        }
    }
}