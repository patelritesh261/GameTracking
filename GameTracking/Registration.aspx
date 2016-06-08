﻿<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="GameTracking.AdminPanel.Registration" %>
<%-- 
 * @File name : Registration page 
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This is registration page.   
    --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <h1>Registration</h1>

                <hr style="width: 100%; color: black; height: 3px; background-color: black;" />
      <!-- start contact form -->
                <form role="form" method="post" action="Contact.aspx">
                    <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">User Name</label>
                        </div>
                        <div class="col-md-offset-4 ">
                            <asp:TextBox ID="txtUserName" runat="server" required="true" CssClass="form-control" placeholder="User Name"  CausesValidation="True"></asp:TextBox>
                        </div>

                    </div>
                         <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Email</label>
                        </div>
                        <div class="col-md-offset-4 ">
                            <asp:TextBox ID="txtEmail" runat="server" required="true" CssClass="form-control" placeholder="Email"  CausesValidation="True"></asp:TextBox>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Password</label>
                        </div>
                        <div class="col-md-offset-4 ">
                            <asp:TextBox TextMode="Password" CssClass="form-control" ID="txtPassword" placeholder="Password" required="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                   
                       <div class="form-group">
                        <div class="col-md-4">
                            <label class="control-label" for="exampleInputEmail">Confirm Password</label>
                        </div>
                        <div class="col-md-offset-4 ">
                            <asp:TextBox TextMode="Password" CssClass="form-control" ID="txtConfirmPassword" placeholder="Confirm Password" required="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnsubmit" CssClass="btn btn-sample" runat="server" Text="Login" />
                         <asp:Button ID="Button1" CssClass="btn btn-sample-inverse" runat="server" Text="Register" />
                    </div>
                </form>
                 <!-- end contact form -->
                </div>
            </div></div>
</asp:Content>