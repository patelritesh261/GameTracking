<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmEmail.aspx.cs" Inherits="GameTracking.ConfirmEmail" %>
<%-- 
   * @File name : Confirm Email page 
   * @Author : Ritesh Patel and Parvati Patel
   * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
   * @File description : This is user for confirm email message.
      --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <br />
                <br />
                   <asp:PlaceHolder ID="confirmMsg" runat="server" Visible="false" >
                <bs3:Jumbotron runat="server" ID="Jumbotron3">
                    <BodyContent>
                        <h3>  Your account has been confirmed Now you can click  on <a href="Login.aspx" > link</a> to Log in</h3>
                    </BodyContent>
                </bs3:Jumbotron>
                        </asp:PlaceHolder>
            </div>
         
          
               
        </div>
    </div>
</asp:Content>
