<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavbarAdmin.ascx.cs" Inherits="GameTracking.User_Controls.NavbarAdmin" %>
<%-- 
 * @File name : Admin Navabar 
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : this is user control which is use for navigation bar
 * 
 *  
--%>
<nav class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="Default.aspx"><i class="fa fa-futbol-o fa-lg"></i>GameTracking</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li id="home" runat="server"><a href="../AdminPanel/Dashboard.aspx"><i class="fa fa-home fa-lg"></i> Dashboard</a></li>
                <li class="dropdown"  >
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Game
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../AdminPanel/Game.aspx">Add Game</a></li>
          <li><a href="../AdminPanel/GameDetails.aspx">Display Games</a></li>
         
        </ul>
      </li>
                 <li class="dropdown"  >
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Team
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../AdminPanel/Team.aspx">Add Team</a></li>
          <li><a href="../AdminPanel/TeamDetails.aspx">Display Teams</a></li>
         
        </ul>
      </li>
                 <li class="dropdown"  >
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Game Record
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../AdminPanel/GameRecord.aspx">Add GameRecord</a></li>
          <li><a href="../AdminPanel/GameRecord.aspx">Display GamesRecords</a></li>
         
        </ul>
      </li>
                <li id="login" runat="server"><a href="../AdminPanel/Game.aspx"><i class="fa fa-sign-in  fa-lg"></i> Team</a></li>
                <li id="register" runat="server"><a href="#"><i class="fa fa-user-plus  fa-lg"></i> Gamerecord</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
