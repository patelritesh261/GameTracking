<%@ Page Title="User Details Page" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="GameTracking.Admin.UserDetails" %>
<%-- 
 * @File name : User Details Page
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This page provides access to admin to update and add new user.
 * 
 *  
--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">

        <div class="row">

            <div class="col-md-offset-4 col-md-4">

                 <div class="alert alert-danger" id="AlertFlash" runat="server" visible="false">

                    <asp:Label runat="server" ID="StatusLabel" />

                </div>

                <h1>User Details Page</h1>

               <h5><span>All Fields are Required</span></h5>

                <br />

                <div class="card text-xs-center">

                    <div class="card-header">
                         <asp:label ID="lbGame" runat="server"  Text="<i class='fa fa-user-plus fa-lg'></i> User Details" ></asp:label>
                       

                    </div>

                    <div class="panel-body">

                        <div class="form-group">

                            <label class="control-label" for="UserNameTextBox">Username:</label>

                            <asp:TextBox runat="server" CssClass="form-control" ID="UserNameTextBox" placeholder="Username" required="true" TabIndex="0"></asp:TextBox>

                        </div>

                        <div class="form-group">

                            <label class="control-label" for="PhoneNumberTextBox">Phone Number:</label>

                            <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="PhoneNumberTextBox" placeholder="Phone Number" required="true" TabIndex="0"></asp:TextBox>

                        </div>

                        <div class="form-group">

                            <label class="control-label" for="EmailTextBox">Email:</label>                           

                            <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="EmailTextBox" placeholder="Email" required="true" TabIndex="0"></asp:TextBox>

                        </div>

                        <!-- Only Display if New User is being Registered -->

                        <asp:PlaceHolder ID="PasswordPlaceHolder" runat="server">

                            <div class="form-group">

                                <label class="control-label" for="PasswordTextBox">Password:</label>

                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="PasswordTextBox" placeholder="Password" required="true" TabIndex="0"></asp:TextBox>

                            </div>

                            <div class="form-group">

                                <label class="control-label" for="ConfirmPasswordTextBox">Confirm:</label>

                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="ConfirmPasswordTextBox" placeholder="Confirm Password" required="true" TabIndex="0"></asp:TextBox>

                                <asp:CompareValidator ErrorMessage="Your Passwords Must Match" Type="String" Operator="Equal"  ControlToValidate="ConfirmPasswordTextBox" runat="server"

                                    ControlToCompare="PasswordTextBox" CssClass="label label-danger" />

                            </div>

                        </asp:PlaceHolder>

                        <div class="text-right">

                            <asp:Button Text="Cancel" ID="CancelButton" runat="server" CssClass="btn btn-sample-inverse" OnClick="CancelButton_Click" UseSubmitBehavior="false" CausesValidation="false" TabIndex="0" />

                            <asp:Button Text="Save" ID="SaveButton" runat="server" CssClass="btn btn-sample" OnClick="SaveButton_Click" TabIndex="0" />

                        </div>

                    </div>

                </div>  

            </div>

        </div>

    </div>
</asp:Content>
