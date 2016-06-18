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
/*
 * @File name : Game Page
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This page provides add and update functionality of game
 * 
 * 
 * 
 **/
namespace GameTracking.AdminPanel
{
    public partial class Game : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if loading the page for the first time, populate the game grid
            if (!IsPostBack)
            {
                lblMsg.Text = "";
               Session["SortColumn"] = "GID"; // default sort column
                Session["SortDirection"] = "ASC";
                // Get the game data
                this.GetGames();
                //check Message
                getMessage();
            }
        }
        /**
* <summary>
* This method gets message from gamedetails page
* </summary>
* 
* @method getMessage
* @returns {void}
*/
        private void getMessage()
        {
           
                if (Session["GameMsg"] != null) {
                    lblMsg.Text = Session["GameMsg"].ToString();
                    alertMsg.Visible = true;
                Session["GameMsg"] = null;
                }
            
        }

        /**
* <summary>
* This method gets the games data from the DB
* </summary>
* 
* @method GetGames
* @returns {void}
*/
        protected void GetGames()
        {
            // connect to EF
            using (DefaultConnectionGM db = new DefaultConnectionGM())
            {
                string SortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

                // query the Games Table using EF and LINQ
                var Games = (from allGames in db.Games
                                select allGames);

                // bind the result to the GridView
                gdGames.DataSource = Games.AsQueryable().OrderBy(SortString).ToList();
              
                gdGames.DataBind();
            }
        }
        /**
       * <summary>
       * This event handler deletes a game from the db using EF
       * </summary>
       * 
       * @method gdGames_RowDeleting
       * @param {object} sender
       * @param {GridViewDeleteEventArgs} e
       * @returns {void}
       */
        protected void gdGames_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // store which row was clicked
            int selectedRow = e.RowIndex;

            // get the selected GID using the Grid's DataKey collection
            int GID = Convert.ToInt32(gdGames.DataKeys[selectedRow].Values["GID"]);

            // use EF to find the selected game in the DB and remove it
            using (DefaultConnectionGM db = new DefaultConnectionGM())
            {
                // create object of the Game class and store the query string inside of it
                Models.Game deletedGame = (from gameRecords in db.Games
                                          where gameRecords.GID == GID
                                          select gameRecords).FirstOrDefault();

                // remove the selected game from the db
                db.Games.Remove(deletedGame);

                // save my changes back to the database
                db.SaveChanges();
                Session["GameMsg"] = "Your Record Deleted Succeessfully.";
                // refresh the grid
                this.GetGames();
                getMessage();




            }
        }
        /**
        * <summary>
        * This event handler allows pagination to occur for the game page
        * </summary>
        * 
        * @method gdGames_PageIndexChanging
        * @param {object} sender
        * @param {GridViewPageEventArgs} e
        * @returns {void}
        */
        protected void gdGames_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            // Set the new page number
            gdGames.PageIndex = e.NewPageIndex;

            // refresh the grid
            this.GetGames();
        }
        /**
        * <summary>
        * This event handler allows to sort according column clicked
        * </summary>
        * 
        * @method gdGames_Sorting
        * @param {object} sender
        * @param {GridViewPageEventArgs} e
        * @returns {void}
        */
        protected void gdGames_Sorting(object sender, GridViewSortEventArgs e)
        {
            // get the column to sorty by
            Session["SortColumn"] = e.SortExpression;

            // Refresh the Grid
            this.GetGames();

            // toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }
        /**
        * <summary>
        * This event handler allows to bind font-awesome icon according to sorting 
        * </summary>
        * 
        * @method gdGames_RowDataBound
        * @param {object} sender
        * @param {GridViewPageEventArgs} e
        * @returns {void}
        */
        protected void gdGames_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header) // if header row has been clicked
                {
                    LinkButton linkbutton = new LinkButton();

                    for (int index = 0; index < gdGames.Columns.Count - 1; index++)
                    {
                        if (gdGames.Columns[index].SortExpression == Session["SortColumn"].ToString())
                        {
                            if (Session["SortDirection"].ToString() == "ASC")
                            {
                                linkbutton.Text = " <i class='fa fa-caret-up fa-lg'></i>";
                            }
                            else
                            {
                                linkbutton.Text = " <i class='fa fa-caret-down fa-lg'></i>";
                            }

                            e.Row.Cells[index].Controls.Add(linkbutton);
                        }
                    }
                }
            }
        }
        /**
        * <summary>
        * This event handler allows change pageSize
        * </summary>
        * 
        * @method PageSizeDropDownList_SelectedIndexChanged
        * @param {object} sender
        * @param {EventArgs} e
        * @returns {void}
        */
        protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Set the new Page size
            gdGames.PageSize = Convert.ToInt32(PageSizeDropDownList.SelectedValue);

            // refresh the grid
            this.GetGames();
        }
    }
}