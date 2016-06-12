<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GameTracking.Default" %>

<%-- 
 * @File name : Home page 
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This is public home page.
 * 
 *  
--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container">
        <div class="row">
            <div class="col-md-offset-1 col-md-11">
                   <h1>Weekly Statistic</h1>
                <asp:Repeater ID="rptGame" runat="server" > 
					<ItemTemplate >	
                           <div class="col-md-5 card text-xs-center">
                    <div class="card-header">
                       
                        <asp:LinkButton ID="lbGame" runat="server" OnClick="lbGame_Click" Text='<%# Eval("GName") %>' ></asp:LinkButton>
                       
                    </div>
                    <div class="card-block">
                        <h4 class="card-title">
                             <asp:LinkButton ID="lbTeam1" runat="server" OnClick="lbTeam1_Click" Text='<%# Eval("TeamN1") %>' ></asp:LinkButton>
                             V/S 
                             <asp:LinkButton ID="lbTeam2" runat="server" OnClick="lbTeam2_Click" Text='<%# Eval("TeamN2") %>' ></asp:LinkButton>
                         </h4>
                        <div class="card-text">
                            <p>Winner Team : <%# Eval("WTeamN") %></p>
                            <p>Spectators : <%# Eval("Sepectators") %></p>
                            <p>Total Score : <%# Eval("TotalScore") %></p>
                            <p>Winning Team Points : <%# Eval("T1WinScore") %> and Team won by : <%# Eval("T2WinScore") %> Points</p>
                            <p>Loosing Team Points :<%# Eval("T2WinScore") %> and Team lost by : <%# Eval("T1WinScore") %> Points</p>
                        </div>

                    </div>
                    <div class="card-footer text-muted">
                     <%# Eval("Date","{0:MMM dd, yyyy}") %> - Week <%# Eval("Week") %>
                    </div>
                </div>
                    </ItemTemplate>
                   
                   
                </asp:Repeater>
              <div>
                  <div class="col-md-1">
                <asp:Button ID="btnprevious" runat="server" Text="<i class='fa fa-arrow-left fa-5x'></i>" />
                      </div>
              </div>
             
               
            </div>

        </div>
    </div>
       <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            <asp:Label ID="lblTitle" runat="server"></asp:Label>
                        </h4>
                    </div>
                    <div class="modal-body">
                       <asp:Label ID="lblbody" runat="server"></asp:Label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                            data-dismiss="modal">
                            close
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>
</asp:Content>
