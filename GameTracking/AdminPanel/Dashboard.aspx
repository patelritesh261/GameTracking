<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GameTracking.AdminPanel.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <h1>Dashboard</h1>
            <hr />
            <div class="col-md-4" >
                
                <bs3:Jumbotron runat="server" ID="Jumbotron1" >
        <BodyContent>
            <h3 ><center>Total No of Games</center></h3>
        </BodyContent>
    </bs3:Jumbotron>

            </div>
             <div class="col-md-4">
                
                <bs3:Jumbotron runat="server" ID="Jumbotron2">
        <BodyContent>
            <h3><center>Total No of Games</center></h3>
        </BodyContent>
    </bs3:Jumbotron>

            </div>
             <div class="col-md-4">
                
                <bs3:Jumbotron runat="server" ID="Jumbotron3">
        <BodyContent>
            <h3><center>Total No of Games</center></h3>
        </BodyContent>
    </bs3:Jumbotron>

            </div>
        </div>
    </div>
</asp:Content>
