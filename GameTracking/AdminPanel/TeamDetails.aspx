<%@ Page Title="Team Details" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="TeamDetails.aspx.cs" EnableEventValidation="false" Inherits="GameTracking.AdminPanel.TeamDetails" %>
<%-- 
 * @File name : Team Details Page
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This page provides add and update functionality of Team
 * 
 *  
--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
         <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-8">
                <h1>Add Team</h1>
                 <h5><span>All Fields are Required</span></h5>


                <hr />
                 <div id="alertMsg" runat="server" visible="false" class="alert btn-sample btn-sm alert-dismissible " role="alert">
                    <button type="button" class="close btn-sm" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </div>
      <!-- start Team form -->
                <form role="form" method="post" >
                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label" for="exampleInputEmail">Team Name : </label>
                        </div>
                        <div class="col-md-6 ">
                            <asp:TextBox ID="txtTeamName" runat="server" required="true" CssClass="form-control" placeholder="Team Name"  CausesValidation="True"></asp:TextBox>
                        </div>
                        <div class="col-md-offset-1 ">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTeamName" SetFocusOnError="true"  CssClass="btn btn-sample" ErrorMessage="Enter Team Name"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label" for="exampleInputEmail">Game Name : </label>
                        </div>
                        <div class="col-md-6 ">
                           <asp:DropDownList ID="ddlGameName" CssClass="btn btn-default btn-sm  dropdown-toggle" Width="100%" runat="server">
                               <asp:ListItem Text="<!--Select -->" Value="0"></asp:ListItem>
                                <asp:ListItem Text="b" Value="2"></asp:ListItem>
                           </asp:DropDownList>
                        </div>
                        <div class="col-md-offset-1 ">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlGameName" InitialValue="0" SetFocusOnError="true" CssClass="btn btn-sample" ErrorMessage="Select Game Name"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label" for="exampleInputEmail">Short Description</label>
                        </div>
                        <div class="col-md-6 ">
                            <asp:TextBox TextMode="MultiLine" Rows="5" CssClass="form-control" ID="txtshortdesc" placeholder="Short Description" required="true" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-offset-1 ">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtshortdesc" SetFocusOnError="true"  CssClass="btn btn-sample" ErrorMessage="Enter Team Description"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                   

                    <div class="form-group">
                         <div class="col-md-6">

                              <asp:Button ID="btnsubmit" CssClass="btn btn-sample" runat="server" Text="Add" OnClick="btnsubmit_Click" />
                            &nbsp;  &nbsp;
                                <a href="Team.aspx" class="btn btn-sample-inverse">Cancel</a>
                        </div>
                     
                     
                    </div>
                    <br />
                </form>
                 <!-- end Game form -->
                </div>
            </div></div>
</asp:Content>
