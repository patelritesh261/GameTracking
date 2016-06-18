<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GameTracking.AdminPanel.Login" %>
<%-- 
   * @File name : Login page 
   * @Author : Ritesh Patel and Parvati Patel
   * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
   * @File description : This is login page.
      --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container">
      <div class="row">
         <div class="col-md-offset-4 col-md-4">
            <div class="alert alert-danger" id="AlertFlash" runat="server" visible="false">
               <asp:Label runat="server" ID="StatusLabel" />
            </div>
           <br />
              <br />
              <br />
            <div class="card text-xs-center">
               <div class="card-header">
            
                     <asp:label ID="lbGame" runat="server"  Text="<i class='fa fa-sign-in fa-lg'></i> Login" ></asp:label>
               </div>
               <br />
               <div class="panel-body">
                  <div class="form-group">
                     <label class="control-label" for="UserNameTextBox">Username:</label>
                     <asp:TextBox runat="server" CssClass="form-control" ID="UserNameTextBox" placeholder="Username" required="true" TabIndex="0"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label class="control-label" for="PasswordTextBox">Password:</label>
                     <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="PasswordTextBox" placeholder="Password" required="true" TabIndex="0"></asp:TextBox>
                  </div>
                  <div class="text-right">
                     <asp:Button Text="Login" ID="LoginButton" runat="server" CssClass="btn btn-sample" OnClick="LoginButton_Click" TabIndex="0" />
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>