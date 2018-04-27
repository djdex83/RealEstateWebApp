<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="ImmobiliareDotoreniWebApp.webcontrols.Menu" %>
        <div class="navbar-collapse collapse ">
            <ul class="nav navbar-nav">
                <asp:Repeater ID="rptMenuSite" runat="server" OnItemDataBound="rptMenuSite_ItemDataBound">
                  <ItemTemplate>
                        <li><a href="<%# DataBinder.Eval(Container.DataItem, "url") %>" title="<%# DataBinder.Eval(Container.DataItem, "description")%>">
                            <%# DataBinder.Eval(Container.DataItem, "title") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
           