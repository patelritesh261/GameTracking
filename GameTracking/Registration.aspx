﻿<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="GameTracking.AdminPanel.Registration" %>
<%-- 
   * @File name : Registration page 
   * @Author : Ritesh Patel and Parvati Patel
   * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
   * @File description : This is registration page.   
   --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container">
      <div class="row">
         <div class="col-md-offset-4 col-md-4">
            
           <br />
             <br />
            <br />
             <div class="alert btn-sample btn-sm alert-dismissible" id="AlertFlash" runat="server" visible="false">
               <asp:Label runat="server" ID="StatusLabel" />
            </div>
            <div class="card text-xs-center">
               <div class="card-header">
                    <asp:label ID="lbGame" runat="server"  Text="<i class='fa fa-user-plus fa-lg'></i>Register" ></asp:label>
                 
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
                  <div class="form-group">
                     <label class="control-label" for="PasswordTextBox">Password:</label>
                     <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="PasswordTextBox" placeholder="Password" required="true" TabIndex="0"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="Regex2" runat="server" ControlToValidate="PasswordTextBox"
        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
        ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
        CssClass="label label-danger" />
                  </div>
                  <div class="form-group">
                     <label class="control-label" for="ConfirmPasswordTextBox">Confirm:</label>
                     <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="ConfirmPasswordTextBox" placeholder="Confirm Password" required="true" TabIndex="0"></asp:TextBox>
                     <asp:CompareValidator ErrorMessage="Your Passwords Must Match" Type="String" Operator="Equal" ControlToValidate="ConfirmPasswordTextBox" runat="server"
                        ControlToCompare="PasswordTextBox" CssClass="label label-danger" />
                  </div>
                  <div class="text-right">
                     <asp:Button Text="Cancel" ID="CancelButton" runat="server" CssClass="btn btn-sample-inverse" OnClick="CancelButton_Click" UseSubmitBehavior="false" CausesValidation="false" TabIndex="0" />
                     <asp:Button Text="Register" ID="RegisterButton" runat="server" CssClass="btn btn-sample" OnClick="RegisterButton_Click" TabIndex="0" />
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
