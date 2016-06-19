<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfitmMessage.aspx.cs" Inherits="GameTracking.ConfitmMessage" %>
<%-- 
   * @File name : Confirm Email page 
   * @Author : Ritesh Patel and Parvati Patel
   * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
   * @File description : This is user for confirm email message.
      --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <br />
                <br />
                <bs3:Jumbotron runat="server" ID="Jumbotron3">
                    <BodyContent>
                        <h3>Please check your mail and confirm your account.</h3>
                    </BodyContent>
                </bs3:Jumbotron>

            </div>

        </div>
    </div>
</asp:Content>
