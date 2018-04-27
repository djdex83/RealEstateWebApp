<%@ Page Title="Immobiliare Doroteni - Complesso residenziale - I Gigli d'acqua"
    Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="I_gigli_dacqua.aspx.cs"
    Inherits="ImmobiliareDoroteniWebApp.I_gigli_dacqua" %>

<%@ Register Src="~/webcontrols/Menu.ascx" TagName="Menu" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Immobiliare Doroteni - Complesso residenziale - I Gigli d'acqua</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <uc:Menu runat="server" ID="Menu" MenuNode="NUOVE COSTRUZIONI"></uc:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitlePage" runat="server">
    <h3 class="heading">
        Complesso residenziale - I Gigli d'acqua</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderContainer" runat="server">
    <div class="row">
    <div class="col-lg-3">
        <a href="img_nuovecostruzioni/igiglidacqua/VOLANTINO.pdf" target="_blank"><img class="img-responsive" src="img_nuovecostruzioni/igiglidacqua/I_gigli_dacqua.jpg" title="I gigli d'acqua" alt="I gigli d'acqua"/></a>
    </div>
        <div class="col-lg-9">
            Lotti di Terreno con progetto approvato per complessive 40 unità abitative di varia
            metratura e tipologia: ville a schiera, unità indipendenti, appartamenti tutti con
            box auto, giardino e/o terrazzi.</div>
        <div class="col-lg-12">
            <h4 class="heading">
                Gallery</h4>
            <div class="row">
                <section id="projects">
                    <ul id="thumbs" class="portfolio">
                        <!-- Item Project and Filter Name -->
                        <li class="col-lg-3 col-md-3 col-xs-3 design" data-id="id-0" data-type="web">
                            <div class="item-thumbs">
                                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Edificio D Via Campora"
                                    href="img_nuovecostruzioni/igiglidacqua/Edificio_D_ViaCampora.jpg"><span class="overlay-img">
                                    </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                                <!-- Thumb Image and Description -->
                                <img src="img_nuovecostruzioni/igiglidacqua/resized/r_Edificio_D_ViaCampora.jpg"
                                    alt="I Gigli d'acqua" />
                            </div>
                        </li>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  design" data-id="id-1" data-type="icon">
                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Vialetto Edificio D"
                                href="img_nuovecostruzioni/igiglidacqua/Vista_vialetto_ED.D.jpg"><span class="overlay-img">
                                </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                            <!-- Thumb Image and Description -->
                            <img src="img_nuovecostruzioni/igiglidacqua/resized/r_Vista_vialetto_ED.D.jpg" alt="I Gigli d'acqua">
                        </li>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  photography" data-id="id-2" data-type="illustrator">
                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Lotto A - Ville a schiera"
                                href="img_nuovecostruzioni/igiglidacqua/Lotto_A-E_Ville_schiera.jpg"><span class="overlay-img">
                                </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                            <!-- Thumb Image and Description -->
                            <img src="img_nuovecostruzioni/igiglidacqua/resized/r_Lotto_A-E_Ville_schiera.jpg"
                                alt="I Gigli d'acqua">
                        </li>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  photography" data-id="id-2" data-type="illustrator">
                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="I Gigli d'acqua"
                                href="img_nuovecostruzioni/igiglidacqua/Vista_tutto_ED.B.jpg"><span class="overlay-img">
                                </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                            <!-- Thumb Image and Description -->
                            <img src="img_nuovecostruzioni/igiglidacqua/resized/r_Vista_tutto_ED.B.jpg" alt="I Gigli d'acqua">
                        </li>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  photography" data-id="id-2" data-type="illustrator">
                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Vista viale ED.C"
                                href="img_nuovecostruzioni/igiglidacqua/Vista_viale_ED.C.jpg"><span class="overlay-img">
                                </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                            <!-- Thumb Image and Description -->
                            <img src="img_nuovecostruzioni/igiglidacqua/resized/r_Vista_viale_ED.C.jpg" alt="I Gigli d'acqua">
                        </li>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  photography" data-id="id-2" data-type="illustrator">
                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Vista viale ingresso"
                                href="img_nuovecostruzioni/igiglidacqua/Vista_viale_ingresso.jpg"><span class="overlay-img">
                                </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                            <!-- Thumb Image and Description -->
                            <img src="img_nuovecostruzioni/igiglidacqua/resized/r_Vista_viale_ingresso.jpg" alt="I Gigli d'acqua">
                        </li>
                        <!-- End Item Project -->
                    </ul>
                </section>
            </div>
        </div>
    </div>
 </asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderJS" runat="server">
</asp:Content>
