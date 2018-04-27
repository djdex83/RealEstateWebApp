<%@ Page Title="Immobiliare Doroteni - Nuove Costruzioni" Language="C#" MasterPageFile="~/Page.Master"
    AutoEventWireup="true" CodeBehind="NuoveCostruzioni.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.NuoveCostruzioni" %>

<%@ Register Src="~/webcontrols/Menu.ascx" TagName="Menu" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Immobiliare Doroteni - Nuove Costruzioni</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <uc:Menu runat="server" ID="Menu" MenuNode="NUOVE COSTRUZIONI"></uc:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitlePage" runat="server">
    <h3 class="heading">
        Nuove Costruzioni</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderContainer" runat="server">
        <div class="realestate">
            <div id="immobili" class="nuovecostruzioni">
                <p>Non sono presenti annunci per nuovi immobili</p>
             </div>
        </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderJS" runat="server">
</asp:Content>
