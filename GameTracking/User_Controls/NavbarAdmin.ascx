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
                <li id="home" runat="server"><a href="../AdminPanel/Dashboard.aspx"><i class="fa fa-tachometer  fa-lg"></i> Dashboard</a></li>
         
              <li id="games" runat="server"><a href="../AdminPanel/Game.aspx"><i class="fa fa-gamepad  fa-lg" aria-hidden="true"></i> Games</a></li>
                 <li id="teams" runat="server"><a href="../AdminPanel/Team.aspx"><i class="fa fa-users fa-lg" aria-hidden="true"></i> Teams</a></li>
                <li id="gamerecord" runat="server"><a href="../AdminPanel/GameRecord.aspx"><i class="fa fa-trophy fa-lg" aria-hidden="true"></i> Game Records</a></li>
                <li id="profile" runat="server"><a href="#"><i class="fa fa-user  fa-lg"></i> Profile</a></li>
                <li id="login" runat="server"><a href="../AdminPanel/Game.aspx"><i class="fa fa-sign-out  fa-lg"></i> Logout</a></li>
                
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
