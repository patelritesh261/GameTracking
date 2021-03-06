﻿using System;
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
 * @File name : Dashboard Page
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This page provides overview of Admin Panel
 * 
 * 
 **/
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
        /**
* <summary>
* This method gets total number of records from each table.
* </summary>
* 
* @method GetData
* @returns {void}
*/
        private void GetData()
        {
            using (DefaultConnectionGM db = new DefaultConnectionGM())
            {
                //games count
                var countGame = (from count in db.Games
                                 select count).Count();

                //teams count
                var countTeam = (from count in db.Teams
                                 select count).Count();

                //games records
                var countGRecords = (from count in db.GameRecords
                                     select count).Count();

                //bind data
                lblGames.Text = countGame.ToString();
                lblTeams.Text = countTeam.ToString();
                lblGRecord.Text = countGRecords.ToString();
            }
        }
    }
}