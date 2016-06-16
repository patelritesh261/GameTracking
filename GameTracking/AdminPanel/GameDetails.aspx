<%@ Page Title="Game Details" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="GameDetails.aspx.cs" Inherits="GameTracking.AdminPanel.GameDetails" %>
<%--
 *
 * @File name : Game Details Page
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This page shows all the games in table and allows to pagging and sorting
 * 
 **--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-8">
                <h1>Add Game</h1>
                <h5><span>All Fields are Required</span></h5>


                <hr />
                 <div id="alertMsg" runat="server" visible="false" class="alert btn-sample btn-sm alert-dismissible " role="alert">
                    <button type="button" class="close btn-sm" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </div>
                <!-- start Game form -->

                <form role="form" method="post">

                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label" for="exampleInputEmail">Game Name : </label>
                        </div>
                        <div class="col-md-6 ">
                            <asp:TextBox ID="txtGameName" runat="server" required="true" CssClass="form-control" placeholder="Game Name" CausesValidation="True"></asp:TextBox>
                        </div>
                        <div class="col-md-offset-1 ">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGameName" CssClass="btn btn-sample" ErrorMessage="Enter Game Name"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label" for="exampleInputEmail">Short Description :</label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox TextMode="MultiLine" Rows="5" CssClass="form-control" ID="txtshortdesc" placeholder="Short Description" required="true" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-offset-1 ">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtshortdesc" CssClass="btn btn-sample" ErrorMessage="Enter Game Description"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <br />
                    <div class="form-group">
                        
                        <div class="col-md-6">

                            <asp:Button ID="btnsubmit" CssClass="btn btn-sample" runat="server" Text="Add" OnClick="btnsubmit_Click" />
                            &nbsp;  &nbsp;
                                <a href="Game.aspx" class="btn btn-sample-inverse">Cancel</a>
                        </div>
                       
                    </div>
                </form>
                <!-- end Game form -->
            </div>
        </div>
    </div>
</asp:Content>
