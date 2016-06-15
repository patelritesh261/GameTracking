<%@ Page Title="Game Records" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="GameRecord.aspx.cs" Inherits="GameTracking.AdminPanel.GameRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-1 col-md-10">
                <h1>Game Records List</h1>
                <hr />
                <div id="alertMsg" runat="server" visible="false" class="alert btn-sample btn-sm alert-dismissible " role="alert">
                    <button type="button" class="close btn-sm" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-md-12">
                    <a href="GameRecordDetails.aspx" class="btn btn-sample btn-sm"><i class="fa fa-plus"></i>  Add Game Records</a>




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
                        ID="gdGameRecord" AutoGenerateColumns="false" DataKeyNames="GRID"
                        OnRowDeleting="gdGameRecord_RowDeleting" AllowPaging="true" PageSize="3"
                        OnPageIndexChanging="gdGameRecord_PageIndexChanging" AllowSorting="true"
                        OnSorting="gdGameRecord_Sorting" OnRowDataBound="gdGameRecord_RowDataBound"
                        PagerStyle-CssClass="pagination-ys">
                        <Columns>

                            <asp:BoundField DataField="Date" HeaderText="Date" Visible="true" SortExpression="Date" DataFormatString="{0:MMM dd, yyyy}" />
                            <asp:BoundField DataField="GName" HeaderText="Game" Visible="true" SortExpression="GName" />
                            <asp:BoundField DataField="TeamN1" HeaderText="Team 1" Visible="true" SortExpression="TeamN1" />
                            <asp:BoundField DataField="TeamN2" HeaderText="Team 2" Visible="true" SortExpression="TeamN2" />
                            <asp:BoundField DataField="WTeamN" HeaderText="Winner Team" Visible="true" SortExpression="WTeamN" />
                            <asp:BoundField DataField="Sepectators" HeaderText="Spectators" Visible="true" SortExpression="Sepectators" />
                            <asp:BoundField DataField="T1WinScore" HeaderText="Winning Team Score" Visible="true" SortExpression="T1WinScore" />
                            <asp:BoundField DataField="T2WinScore" HeaderText="Loosing Team Score" Visible="true" SortExpression="T2WinScore" />
                            <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> "
                                NavigateUrl="~/AdminPanel/GameRecordDetails.aspx.cs" ControlStyle-CssClass="btn btn-sample btn-sm" runat="server"
                                DataNavigateUrlFields="GRID" DataNavigateUrlFormatString="GameRecordDetails.aspx?GRID={0}" />
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
