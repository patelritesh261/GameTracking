<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GameTracking.AdminPanel.Dashboard" %>
<%-- 
 * @File name : Dashboard Page
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This page provides overview of Admin Panel
 * 
 *  
--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <h1>Dashboard</h1>
            <hr />
            <div class="col-md-4" >
                
                <bs3:Jumbotron runat="server" ID="Jumbotron1"  >
        <BodyContent>
            <h3 ><a href="Game.aspx" > <asp:Label ID="lblGames" runat="server"></asp:Label> <br /><i class="fa fa-gamepad  fa-lg" aria-hidden="true"></i></a></h3>
          
        </BodyContent>
    </bs3:Jumbotron>

            </div>
             <div class="col-md-4">
                
                <bs3:Jumbotron runat="server" ID="Jumbotron2">
        <BodyContent>
            <h3><a href="Team.aspx"> <asp:Label ID="lblTeams" runat="server"></asp:Label><br /><i class="fa fa-users  fa-lg" aria-hidden="true"></i></a></h3>
        </BodyContent>
    </bs3:Jumbotron>

            </div>
             <div class="col-md-4">
                
                <bs3:Jumbotron runat="server" ID="Jumbotron3">
        <BodyContent>
            <h3><a href="GameRecord.aspx" > <asp:Label ID="lblGRecord" runat="server"></asp:Label><br /> <i class="fa fa-trophy  fa-lg" aria-hidden="true"></i></a></h3>
        </BodyContent>
    </bs3:Jumbotron>

            </div>
        </div>
    </div>
</asp:Content>
