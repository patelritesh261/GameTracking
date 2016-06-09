<%@ Page Title="Game Page" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="GameTracking.AdminPanel.Game" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <h1>Add Game</h1>

                <hr style="width: 100%; color: black; height: 3px; background-color: black;" />
      <!-- start Game form -->
                <form role="form" method="post" >
                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label" for="exampleInputEmail">Game Name : </label>
                        </div>
                        <div class="col-md-offset-3 ">
                            <asp:TextBox ID="txtGameName" runat="server" required="true" CssClass="form-control" placeholder="Game Name"  CausesValidation="True"></asp:TextBox>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label" for="exampleInputEmail">Short Description</label>
                        </div>
                        <div class="col-md-offset-3 ">
                            <asp:TextBox TextMode="MultiLine" Rows="5" CssClass="form-control" ID="txtshortdesc" placeholder="Short Description" required="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                   

                    <div class="form-group">
                        <asp:Button ID="btnsubmit" CssClass="btn btn-sample" runat="server" Text="Add" />
                         <asp:Button ID="btnCancel" CssClass="btn btn-sample-inverse" runat="server" Text="Cancel" />
                    </div>
                </form>
                 <!-- end Game form -->
                </div>
            </div></div>
</asp:Content>
