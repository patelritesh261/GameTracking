<%@ Page Title="Game Page" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Game.aspx.cs" Inherits="GameTracking.AdminPanel.Game" %>
<%-- 
 * @File name : Game Page
 * @Author : Ritesh Patel and Parvati Patel
 * @Website name : GameTracking(http://gametracking.azurewebsites.net/)
 * @File description : This page provides add and update functionality of game
 * 
 *  
--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-1 col-md-10">
                <h1>Games List</h1>
                <hr />
                   <div id="alertMsg" runat="server" visible="false"  class="alert btn-sample btn-sm alert-dismissible " role="alert">
                        <button type="button" class="close btn-sm" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                         <asp:Label ID="lblMsg"  runat="server"  Text=""></asp:Label>
                    </div>
                <div class="col-md-12">
                     <a href="GameDetails.aspx" class="btn btn-sample btn-sm"><i class="fa fa-plus"></i> Game</a>
                   
              

        
              <label for="PageSizeDropDownList">Records per Page: </label>
                    <asp:DropDownList ID="PageSizeDropDownList" runat="server"
                        AutoPostBack="true" CssClass="btn btn-default btn-sm  dropdown-toggle"
                        OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged">
                        <asp:ListItem Text="3" Value="3" />
                        <asp:ListItem Text="5" Value="5" />
                        <asp:ListItem Text="10" Value="10" />
                        <asp:ListItem Text="All" Value="10000" />
                    </asp:DropDownList>
             
         </div>
           <div class="gridspace">
                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover"
                    ID="gdGames" AutoGenerateColumns="false" DataKeyNames="GID"
                    OnRowDeleting="gdGames_RowDeleting" AllowPaging="true" PageSize="3"
                    OnPageIndexChanging="gdGames_PageIndexChanging" AllowSorting="true"
                    OnSorting="gdGames_Sorting" OnRowDataBound="gdGames_RowDataBound"
                    PagerStyle-CssClass="pagination-ys">
                    <Columns>

                        <asp:BoundField DataField="Name" HeaderText="Name"  Visible="true" SortExpression="Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" Visible="true" />

                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i>"
                            NavigateUrl="~/AdminPanel/GameDetails.aspx.cs" ControlStyle-CssClass="btn btn-sample btn-sm" runat="server"
                            DataNavigateUrlFields="GID" DataNavigateUrlFormatString="GameDetails.aspx?GID={0}" />
                       
                     <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="DeleteButton"
                                    CommandName="delete"
                                    Text="<i class='fa fa-trash-o fa-lg'></i>" Class="btn btn-sample-inverse btn-sm"
                                    OnClientClick="if (!window.confirm('Are you sure you want to delete this item?')) return false;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
               </div> 
            </div>
        </div>
    </div>


</asp:Content>
