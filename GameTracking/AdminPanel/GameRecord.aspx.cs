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
    public partial class GameRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["SortColumn"] = "GRID"; // default sort column
                Session["SortDirection"] = "ASC";
                //fill grid
                GetGameRecords();
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

            if (Session["GRMsg"] != null)
            {
                lblMsg.Text = Session["GRMsg"].ToString();
                alertMsg.Visible = true;
                Session["GRMsg"] = null;
            }

        }
        /**
       * <summary>
       * This method gets the student data from the DB
       * </summary>
       * 
       * @method GetGameRecords
       * @returns {void}
       */
        private void GetGameRecords()
        {
            try {
                //geberate sorting 
                string SortString = Session["SortColumn"] + " " + Session["SortDirection"];
                //Connect to EF DB
                using (DefaultConnectionGM db = new DefaultConnectionGM()) {
                    var GameRecords = (from GR in db.GameRecords
                                       join G in db.Games on GR.Gid equals G.GID
                                       join T in db.Teams on GR.Team1 equals T.TID
                                       join T1 in db.Teams on GR.Team2 equals T1.TID
                                       join W in db.Teams on GR.WTeam equals W.TID
                                       select new  { GR.GRID,GR.Sepectators,GR.T1WinScore,GR.T2WinScore,GR.Date,GR.Team2,GR.Team1,GR.WTeam,GName=G.Name,TeamN1=T.Name,TeamN2=T1.Name,WTeamN=W.Name} );

                    //bind result to grid view
                    gdGameRecord.DataSource = GameRecords.AsQueryable().OrderBy(SortString).ToList();
                    gdGameRecord.DataBind();

                }
            } catch (Exception e){ }
        }
        /**
        * <summary>
        * This event handler deletes a game record from the db using EF
        * </summary>
        * 
        * @method gdGameRecord_RowDeleting
        * @param {object} sender
        * @param {GridViewDeleteEventArgs} e
        * @returns {void}
        */
        protected void gdGameRecord_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // store which row was clicked
            int selectRow = e.RowIndex;

            //get id form selected row
            int GRID = Convert.ToInt32(gdGameRecord.DataKeys[selectRow].Values["GRID"]);

            //Connect to EF DB
            using (DefaultConnectionGM db = new DefaultConnectionGM())
            {
                var deleteRecord = (from record in db.GameRecords
                                    where record.GRID == GRID
                                    select record).FirstOrDefault();

                db.GameRecords.Remove(deleteRecord);

                db.SaveChanges();
                //refresh grid
                GetGameRecords();
                Session["GRMsg"] = "Your Record Delete Succeessfully.";
                getMessage();
            }
        }
        /**
        * <summary>
        * This event handler allows pagination to occur for the Gamerecords page
        * </summary>
        * 
        * @method gdGameRecord_PageIndexChanging
        * @param {object} sender
        * @param {GridViewPageEventArgs} e
        * @returns {void}
        */
        protected void gdGameRecord_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //get page index
            gdGameRecord.PageIndex = e.NewPageIndex;

            //refresh grid
            GetGameRecords();

        }
        /**
        * <summary>
        * This event handler allows sorting to occur for the Gamerecords page
        * </summary>
        * 
        * @method gdGameRecord_Sorting
        * @param {object} sender
        * @param {GridViewSortEventArgs} e
        * @returns {void}
        */
        protected void gdGameRecord_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get column name
            Session["SortColumn"] = e.SortExpression;

            //refresh grid
            GetGameRecords();

            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }
        /**
       * <summary>
       * This event handler allows show icon according to sorting direction
       * </summary>
       * 
       * @method gdGameRecord_RowDataBound
       * @param {object} sender
       * @param {GridViewRowEventArgs} e
       * @returns {void}
       */
        protected void gdGameRecord_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                LinkButton linkbutton = new LinkButton();
                for (int i = 0; i < gdGameRecord.Columns.Count - 1; i++)
                {
                    if (gdGameRecord.Columns[i].SortExpression==Session["SortColumn"].ToString())
                    {
                        if (Session["SortDirection"].ToString()=="ASC")
                        {
                            linkbutton.Text = " <i class='fa fa-caret-up fa-lg'></i>";
                        }
                        else
                        {
                            linkbutton.Text = " <i class='fa fa-caret-down fa-lg'></i>";
                        }
                        e.Row.Cells[i].Controls.Add(linkbutton);
                    }
                }
            }
        }
        /**
       * <summary>
       * This event handler allows change page size according dropdown list
       * </summary>
       * 
       * @method PageSizeDropDownList_SelectedIndexChanged
       * @param {object} sender
       * @param {EventArgs} e
       * @returns {void}
       */
        protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get page size from selected dropdpwn
            gdGameRecord.PageSize = Convert.ToInt32(PageSizeDropDownList.SelectedValue);

            //refresh grid
            GetGameRecords();
        }
    }
}