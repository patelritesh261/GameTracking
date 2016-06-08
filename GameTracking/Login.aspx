<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GameTracking.AdminPanel.Login" %>
<%-- 
 * @File name : Login page 
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This is login page.
    --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <h1>Login</h1>

                <hr style="width: 100%; color: black; height: 3px; background-color: black;" />
      <!-- start contact form -->
                <form role="form" method="post" action="Contact.aspx">
                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label" for="exampleInputEmail">User Name</label>
                        </div>
                        <div class="col-md-offset-3 ">
                            <asp:TextBox ID="txtUserName" runat="server" required="true" CssClass="form-control" placeholder="User Name"  CausesValidation="True"></asp:TextBox>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label" for="exampleInputEmail">Password</label>
                        </div>
                        <div class="col-md-offset-3 ">
                            <asp:TextBox TextMode="Password" CssClass="form-control" ID="txtEmail" placeholder="Password" required="true" runat="server"></asp:TextBox>
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
