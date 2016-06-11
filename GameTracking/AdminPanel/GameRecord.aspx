<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="GameRecord.aspx.cs" Inherits="GameTracking.AdminPanel.GameRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <h1>Add Team</h1>

                <hr style="width: 100%; color: black; height: 3px; background-color: black;" />
      <!-- start Game Record form -->
                <form role="form" method="post" >
                    <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Game Date : </label>
                        </div>
                        <div class="col-md-offset-2 ">
                            <asp:Calendar ID="clGameDate" runat="server"></asp:Calendar>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Game Name : </label>
                        </div>
                        <div class="col-md-offset-2 ">
                            <asp:DropDownList ID="ddlGameName" CssClass="dropdown-toggle" runat="server"></asp:DropDownList>
                        </div>

                    </div>
                    
                     <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Teams : </label>
                        </div>
                        <div class="col-md-offset-2 ">
                           <asp:DropDownList ID="ddlTeamName1" CssClass="dropdown-toggle" runat="server"></asp:DropDownList> V/S
                            <asp:DropDownList ID="ddlTeamName2" CssClass="dropdown-toggle" runat="server"></asp:DropDownList>
                        </div>

                    </div>
                     <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Winning Team : </label>
                        </div>
                        <div class="col-md-offset-2 ">
                           <asp:DropDownList ID="ddlTeamList" CssClass="dropdown-toggle" runat="server"></asp:DropDownList>
                           
                        </div>

                    </div>
                 
                     <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Spectators : </label>
                        </div>
                        <div class="col-md-offset-2 ">
                            <asp:TextBox ID="txtSpectators" runat="server" required="true" Width="50%" CssClass="form-control" placeholder="Spectators"  CausesValidation="True"></asp:TextBox> 
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Win Team Score : </label>
                        </div>
                        <div class="col-md-offset-2 ">
                            <asp:TextBox ID="txtWinTeamScore" runat="server" required="true" CssClass="form-control" Width="50%" placeholder="Winning Team Score"  CausesValidation="True"></asp:TextBox> 
                            
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Lose Team Score : </label>
                        </div>
                        <div class="col-md-offset-2 ">
                        <asp:TextBox ID="txtLoseTeamScore" runat="server" required="true" CssClass="form-control" Width="50%" placeholder="loosing Team Score"  CausesValidation="True"></asp:TextBox> 
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
