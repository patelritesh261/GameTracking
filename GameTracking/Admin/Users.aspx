<%@ Page Title="Users" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="GameTracking.Admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <div class="row">

            <div class="col-md-offset-2 col-md-8">

                <h1>Users</h1>

                <a href="/Admin/UserDetails.aspx" class="btn btn-sample btn-sm"><i class="fa fa-plus"></i> Register New User</a>

                <asp:GridView runat="server" ID="UsersGridView" AutoGenerateColumns="false"

                    CssClass="table table-bordered table-striped table-hover" OnRowDeleting="UsersGridView_RowDeleting" DataKeyNames="Id">

                    <Columns>

                        <asp:BoundField DataField="UserName" HeaderText="User Name" Visible="true" />

                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" Visible="true" />

                        <asp:BoundField DataField="Email" HeaderText="Email" Visible="true" />

                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i>" NavigateUrl="~/Admin/UserDetails.aspx" 

                            DataNavigateUrlFields="Id" DataNavigateUrlFormatString="UserDetails.aspx?Id={0}" 

                            ControlStyle-CssClass="btn btn-sample btn-sm" />

                        
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
</asp:Content>
