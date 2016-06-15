<%@ Page Title="Game Records" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="GameRecordDetails.aspx.cs" Inherits="GameTracking.AdminPanel.GameRecordDetails" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-7">
                <h1>Game Record</h1>

                <hr />
                  <div id="alertMsg" runat="server" visible="false" class="alert btn-sample btn-sm alert-dismissible " role="alert">
                    <button type="button" class="close btn-sm" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </div>
      <!-- start Game Record form -->
                <form role="form" method="post" >
                    <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Game Date : </label>
                        </div>
                        <div class="col-md-5 ">
                           <asp:TextBox runat="server" TextMode="Date"  CssClass="form-control" ID="txtGameDate" placeholder="Enrollment Date Format: mm/dd/yyyy" required="true"></asp:TextBox>
                        </div>
                        <div class="col-md-offset-0 ">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGameDate" SetFocusOnError="true"  CssClass="btn btn-sample" ErrorMessage="Select Date"></asp:RequiredFieldValidator>
                             <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Invalid Date! Format: mm/dd/yyyy"
                        ControlToValidate="txtGameDate" MinimumValue="01/01/2000" MaximumValue="01/01/2999"  CssClass="btn btn-sample" 
                        Type="Date" Display="Dynamic" BackColor="Red" ForeColor="White" Font-Size="Large"></asp:RangeValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Game Name : </label>
                        </div>
                        <div class="col-md-5 ">
                            <asp:DropDownList ID="ddlGameName"  runat="server" CssClass="btn btn-default btn-sm  dropdown-toggle"
                                 Width="100%" OnSelectedIndexChanged="ddlGameName_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Text="Select Game" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-offset-0 ">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlGameName" InitialValue="0" SetFocusOnError="true"  CssClass="btn btn-sample" ErrorMessage="Enter Team Name"></asp:RequiredFieldValidator>
                        </div>

                    </div>
                    
                     <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Team 1 : </label>
                        </div>
                        <div class="col-md-5 ">
                           <asp:DropDownList ID="ddlTeamName1" Enabled="false"  runat="server" 
                               CssClass="btn btn-default btn-sm  dropdown-toggle" Width="100%"
                               AutoPostBack="true" OnSelectedIndexChanged="ddlTeamName1_SelectedIndexChanged">
                               <asp:ListItem Text="Select Team" Value="0"></asp:ListItem>
                           </asp:DropDownList>
                           
                        </div>
                         <div class="col-md-offset-0 ">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlTeamName1" InitialValue="0" SetFocusOnError="true"   CssClass="btn btn-sample" ErrorMessage="Select Team"></asp:RequiredFieldValidator>
                          

                        </div>

                    </div>
                       
                     <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Team 2 : </label>
                        </div>
                        <div class="col-md-5 ">
                           <asp:DropDownList ID="ddlTeamName2" Enabled="false" runat="server"
                                CssClass="btn btn-default btn-sm  dropdown-toggle" Width="100%" AutoPostBack="true"
                               OnSelectedIndexChanged="ddlTeamName2_SelectedIndexChanged">
                                <asp:ListItem Text="Select Team" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                         <div class="col-md-offset-0 ">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlTeamName2" InitialValue="0" SetFocusOnError="true"  CssClass="btn btn-sample" ErrorMessage="Select Team"></asp:RequiredFieldValidator>

                        </div>

                    </div>
                     <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Winning Team : </label>
                        </div>
                        <div class="col-md-5 ">
                           <asp:DropDownList ID="ddlWinTeam" Enabled="false"  runat="server" CssClass="btn btn-default btn-sm  dropdown-toggle" Width="100%">
                               <asp:ListItem Text="Select Winning Team" Value="0"></asp:ListItem>
                           </asp:DropDownList>
                           
                        </div>
                         <div class="col-md-offset-0 ">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlWinTeam" InitialValue="0" SetFocusOnError="true"  CssClass="btn btn-sample" ErrorMessage="Select Winning Team"></asp:RequiredFieldValidator>
                           

                        </div>
                    </div>
                 
                     <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Spectators : </label>
                        </div>
                        <div class="col-md-5 ">
                            <asp:TextBox ID="txtSpectators" TextMode="Number" runat="server" required="true"  CssClass="form-control" placeholder="Spectators"  CausesValidation="True"></asp:TextBox> 
                        </div>
                          <div class="col-md-offset-0 ">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="txtSpectators" SetFocusOnError="true"  CssClass="btn btn-sample" ErrorMessage="Enter Spectators"></asp:RequiredFieldValidator>
                           

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Winning Team Score : </label>
                        </div>
                        <div class="col-md-5 ">
                            <asp:TextBox ID="txtWinTeamScore" TextMode="Number" runat="server" required="true" CssClass="form-control"  placeholder="Winning Team Score"  CausesValidation="True"></asp:TextBox> 
                            
                        </div>
                        <div class="col-md-offset-0 ">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtWinTeamScore"  SetFocusOnError="true"  CssClass="btn btn-sample" ErrorMessage="Enter Score"></asp:RequiredFieldValidator>
                           

                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Loosing Team Score : </label>
                        </div>
                        <div class="col-md-5 ">
                        <asp:TextBox ID="txtLoseTeamScore" TextMode="Number" runat="server" required="true" CssClass="form-control" placeholder="Loosing Team Score"  CausesValidation="True"></asp:TextBox> 
                        </div>
                        <div class="col-md-offset-0 ">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtLoseTeamScore"  SetFocusOnError="true"  CssClass="btn btn-sample" ErrorMessage="Enter Score"></asp:RequiredFieldValidator>
                           

                        </div>

                    </div>
                       <div class="form-group">
                        <asp:Button ID="btnsubmit" CssClass="btn btn-sample" runat="server" Text="Add" OnClick="btnsubmit_Click" />
                           &nbsp;&nbsp;
                           <a href="GameRecord.aspx" class="btn btn-sample-inverse">Cancel</a>
                        
                    </div>
                </form>
                 <!-- end Game form -->
                </div>
            </div></div>
</asp:Content>
