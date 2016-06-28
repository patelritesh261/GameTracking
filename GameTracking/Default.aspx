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
                  <div class="col-md-12">
                      <div class="col-md-1">
                         <h1><i class="fa fa-hand-o-left" aria-hidden="true"></i></h1> 
                      </div>
                      <div class="col-md-9">
                          <h1><center> Weekly Statistic</center></h1>
                      </div>
                      <div class="col-md-1">
                         <h1> <i class="fa fa-hand-o-right" aria-hidden="true"></i></h1>
                      </div>
                  </div> 
               <div class="col-md-12">
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
                            <p>Loosing Team Points :<%# Eval("T2WinScore") %>and Team lost by : <%# Eval("T1WinScore") %> Points</p>
                        </div>

                    </div>
                    <div class="card-footer text-muted">
                     <%# Eval("Date","{0:MMM dd, yyyy}") %> - Week <%# Eval("Week") %>
                    </div>
                </div>
                    </ItemTemplate>
                   
                   
                </asp:Repeater>
               </div>
            
              <div>
                 
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
    <div class="container">
        <div class="row">
             <div class="col-md-12">
                
                <bs3:Jumbotron runat="server" ID="Jumbotron3" Visible="false">
        <BodyContent>
            <h3>No game for this Week</h3>
        </BodyContent>
    </bs3:Jumbotron>

            </div>
        </div>
    </div>
</asp:Content>
