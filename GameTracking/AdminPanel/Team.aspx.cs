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
namespace GameTracking.AdminPanel
{
    public partial class Team : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if loading the page for the first time, populate the game grid
            if (!IsPostBack)
            {
                lblMsg.Text = "";
                Session["SortColumn"] = "TID"; // default sort column
                Session["SortDirection"] = "ASC";
                // Get the teaM data
                this.GetTeams();
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

            if (Session["TeamMsg"] != null)
            {
                lblMsg.Text = Session["TeamMsg"].ToString();
                alertMsg.Visible = true;
                Session["TeamMsg"] = null;
            }

        }
        /**
* <summary>
* This method gets the teams data from the DB
* </summary>
* 
* @method GetTeams
* @returns {void}
*/
        private void GetTeams()
        {
            // connect to EF
            using (DefaultConnection db = new DefaultConnection())
            {
                string SortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

                // query the Teams Table using EF and LINQ
                var Teams = (from allTeams in db.Teams1
                             join allGames in db.Games1
                             on allTeams.Gid equals allGames.GID
                             select new { allTeams.Name,allTeams.Description,GName=allGames.Name,allTeams.TID,allTeams.Gid,allGames.GID});

                // bind the result to the GridView
                gdTeams.DataSource = Teams.AsQueryable().OrderBy(SortString).ToList();

                gdTeams.DataBind();
            }
        }
        /**
      * <summary>
      * This event handler deletes a game from the db using EF
      * </summary>
      * 
      * @method gdTeams_RowDeleting
      * @param {object} sender
      * @param {GridViewDeleteEventArgs} e
      * @returns {void}
      */
        protected void gdTeams_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // store which row was clicked
            int selectRow = e.RowIndex;

            //GET TID From selected row
            int TID = Convert.ToInt32(gdTeams.DataKeys[selectRow].Values["TID"]);

            // use EF to find the selected team in the DB and remove it
            using (DefaultConnection db = new DefaultConnection())
            {
                // create object of the team class and store the query string inside of it
                Teams deletedTeam = (from teamRecords in db.Teams1
                                     where teamRecords.TID == TID
                                     select teamRecords).FirstOrDefault();

                // remove the selected game from the db
                db.Teams1.Remove(deletedTeam);

                // save my changes back to the database
                db.SaveChanges();
                Session["TeamMsg"] = "Your Record Deleted Succeessfully.";
                // refresh the grid
                this.GetTeams();
                getMessage();




            }
        }
        /**
       * <summary>
       * This event handler allows pagination to occur for the team page
       * </summary>
       * 
       * @method gdTeams_PageIndexChanging
       * @param {object} sender
       * @param {GridViewPageEventArgs} e
       * @returns {void}
       */
        protected void gdTeams_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Set the new page number
            gdTeams.PageIndex = e.NewPageIndex;

            // refresh the grid
            this.GetTeams();
        }

        protected void gdTeams_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header) // if header row has been clicked
                {
                    LinkButton linkbutton = new LinkButton();

                    for (int index = 0; index < gdTeams.Columns.Count - 1; index++)
                    {
                        if (gdTeams.Columns[index].SortExpression == Session["SortColumn"].ToString())
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

        protected void gdTeams_Sorting(object sender, GridViewSortEventArgs e)
        {
            // get the column to sorty by
            Session["SortColumn"] = e.SortExpression;

            // Refresh the Grid
            this.GetTeams();

            // toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }
        protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Set the new Page size
            gdTeams.PageSize = Convert.ToInt32(PageSizeDropDownList.SelectedValue);

            // refresh the grid
            this.GetTeams();
        }
    }
}