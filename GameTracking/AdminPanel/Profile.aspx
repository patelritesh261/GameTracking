﻿<%@ Page Title="Profile" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="GameTracking.AdminPanel.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <div class="row">

            <div class="col-md-offset-4 col-md-4">

                 <div class="alert alert-danger" id="AlertFlash" runat="server" visible="false">

                    <asp:Label runat="server" ID="StatusLabel" />

                </div>

                <h1>User Profile Page</h1>

                <br />

                <div class="card text-xs-center">

                    <div class="card-header">
                         <asp:label ID="lbGame" runat="server"  Text="<i class='fa fa-user fa-lg'></i> User Profile" ></asp:label>
                        

                    </div>

                    <div class="panel-body">

                        <div class="form-group">

                            <label class="control-label" for="UserNameTextBox">Username:</label>

                            <asp:TextBox runat="server" CssClass="form-control" ID="UserNameTextBox" placeholder="Username" required="true" TabIndex="0" Enabled="false"></asp:TextBox>

                        </div>

                        <div class="form-group">

                            <label class="control-label" for="PhoneNumberTextBox">Phone Number:</label>

                            <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="PhoneNumberTextBox" placeholder="Phone Number" required="true" TabIndex="0"></asp:TextBox>

                        </div>

                        <div class="form-group">

                            <label class="control-label" for="EmailTextBox">Email:</label>

                            <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="EmailTextBox" placeholder="Email" required="true" TabIndex="0"></asp:TextBox>

                        </div>

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
