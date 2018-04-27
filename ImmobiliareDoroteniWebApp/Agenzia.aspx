<%@ Page Title="Immobiliare Doroteni - L'agenzia" Language="C#" MasterPageFile="~/Page.Master"
    AutoEventWireup="true" CodeBehind="Agenzia.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.Agenzia" %>

<%@ Register Src="~/webcontrols/Menu.ascx" TagName="Menu" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Immobiliare Doroteni - L'agenzia</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <uc:Menu runat="server" ID="Menu" MenuNode="L'AGENZIA"></uc:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitlePage" runat="server">
    <h3 class="heading">
        L'agenzia</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderContainer" runat="server">
    <div class="row">
        <div class="col-lg-8 testoagenzia">
            <asp:Literal runat="server" ID="txtAgenzia"></asp:Literal>
        </div>
        <div class="col-lg-2">
            <div class="item-thumbs" style="margin-bottom:10px">
                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                    href="img/agenzia/agenzia1.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                    </span></a>
                <!-- Thumb Image and Description -->
                <img src="img/agenzia/agenzia1.jpg" alt="Immobiliare Doroteni" />
            </div>
            <div class="item-thumbs" style="margin-bottom:10px">
                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                    href="img/agenzia/agenzia2.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                    </span></a>
                <!-- Thumb Image and Description -->
                <img src="img/agenzia/agenzia2.jpg" alt="Immobiliare Doroteni" />
            </div>
            <div class="item-thumbs" style="margin-bottom:10px">
                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                    href="img/agenzia/agenzia3.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                    </span></a>
                <!-- Thumb Image and Description -->
                <img src="img/agenzia/agenzia3.jpg" alt="Immobiliare Doroteni" />
            </div>
            <div class="item-thumbs" style="margin-bottom:10px">
                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                    href="img/agenzia/agenzia4.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                    </span></a>
                <!-- Thumb Image and Description -->
                <img src="img/agenzia/agenzia4.jpg" alt="Immobiliare Doroteni" />
            </div>
        </div>
        <div class="col-lg-2" style="margin-bottom:10px">
            <div class="item-thumbs" style="margin-bottom:10px">
                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                    href="img/agenzia/agenzia5.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                    </span></a>
                <!-- Thumb Image and Description -->
                <img src="img/agenzia/agenzia5.jpg" alt="Immobiliare Doroteni" />
            </div>
            <div class="item-thumbs" style="margin-bottom:10px">
                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                    href="img/agenzia/agenzia6.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                    </span></a>
                <!-- Thumb Image and Description -->
                <img src="img/agenzia/agenzia6.jpg" alt="Immobiliare Doroteni" />
            </div>
            <div class="item-thumbs" style="margin-bottom:10px">
                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                    href="img/agenzia/agenzia7.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                    </span></a>
                <!-- Thumb Image and Description -->
                <img src="img/agenzia/agenzia7.jpg" alt="Immobiliare Doroteni" />
            </div>
            <div class="item-thumbs" style="margin-bottom:10px">
                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                    href="img/agenzia/agenzia8.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                    </span></a>
                <!-- Thumb Image and Description -->
                <img src="img/agenzia/agenzia8.jpg" alt="Immobiliare Doroteni" />
            </div>
       </div>
    </div>
    <div class="row">
        <div id="collaborazioni">
        </div>
         <script  id="collaborazioniTmpl" type="text/x-jsrender">
            <div class="item-thumbs col-lg-2" style="margin-bottom:10px">
                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                <a class="hover-wrap fancybox" data-fancybox-group="gallery"  title="{{:Descrizione}}"
                    href="{{:Path}}"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                    </span></a>
                <!-- Thumb Image and Description -->
                <img src="{{:Thumbnail}}" alt="{{:Descrizione}}" title="{{:Descrizione}}" />
            </div>
         </script>
    </div> 
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderJS" runat="server"> 
<script type="text/javascript" src="js/AppAgenzia.js"></script>
</asp:Content>
