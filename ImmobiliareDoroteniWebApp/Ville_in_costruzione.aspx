<%@ Page Title="Immobiliare Doroteni - Ville in costruzione" Language="C#"
    MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Ville_in_costruzione.aspx.cs"
    Inherits="ImmobiliareDoroteniWebApp.Ville_in_costruzione" %>

<%@ Register Src="~/webcontrols/Menu.ascx" TagName="Menu" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Immobiliare Doroteni - Complesso residenziale - I Gigli d'acqua</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <uc:Menu runat="server" ID="Menu" MenuNode="NUOVE COSTRUZIONI"></uc:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitlePage" runat="server">
    <h3 class="heading">
        Ville in costruzione</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderContainer" runat="server">
    <div class="row">
        <div class="col-lg-3">
            <img class="img-responsive" src="img_nuovecostruzioni/villette/v1.jpg" title="Villette a schiera"
                alt="Villette a schiera" />
        </div>
        <div class="col-lg-9">
            A 10 km da Vercelli verso Torino si vendono due villette (di 5) disposte su di un
            unico piano corredate da giardino, cortile, e garage. Il costruttore ha combinato
            una soluzione ottimale per giovani coppie e per nuclei famigliari moderni e amanti
            della tranquillità. Ottimo è il rapporto qualità prezzo, visite gratuite in cantiere
            con dettagliate informazioni sulla costruzione e sui materiali usati e in capitolato.
            Le villette sono disposte su di un unico piano e sono cosi composte: entrata in
            camera living, cucina abitabile, bagno, due camere da letto e garage. Riscaldamento
            a pavimento.
            <br />
            Richiesta economica euro 139.000,00</div>
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
                                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Nuova costruzione"
                                    href="img_nuovecostruzioni/villette/v7.jpg"><span class="overlay-img"></span><span
                                        class="overlay-img-thumb font-icon-plus"></span></a>
                                <!-- Thumb Image and Description -->
                                <img src="img_nuovecostruzioni/villette/resized/r_v7.jpg" alt="Villette vicino  a vercelli" />
                            </div>
                        </li>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  design" data-id="id-1" data-type="icon">
                            <div class="item-thumbs">
                                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Nuova costruzione"
                                    href="img_nuovecostruzioni/villette/v2.jpg"><span class="overlay-img"></span><span
                                        class="overlay-img-thumb font-icon-plus"></span></a>
                                <!-- Thumb Image and Description -->
                                <img src="img_nuovecostruzioni/villette/resized/r_v2.jpg" alt="Villette vicino  a vercelli" />
                            </div>
                        </li>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <%--<li class="item-thumbs col-lg-3 col-md-3 col-xs-3  photography" data-id="id-2" data-type="illustrator">
                            <div class="item-thumbs">
                                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Nuova costruzione"
                                    href="img_nuovecostruzioni/villette/v3.jpg"><span class="overlay-img"></span><span
                                        class="overlay-img-thumb font-icon-plus"></span></a>
                                <!-- Thumb Image and Description -->
                                <img src="img_nuovecostruzioni/villette/resized/r_v3.jpg" alt="Villette vicino  a vercelli" />
                            </div>
                        </li>--%>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  photography" data-id="id-2" data-type="illustrator">
                            <div class="item-thumbs">
                                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Nuova costruzione"
                                    href="img_nuovecostruzioni/villette/v4.jpg"><span class="overlay-img"></span><span
                                        class="overlay-img-thumb font-icon-plus"></span></a>
                                <!-- Thumb Image and Description -->
                                <img src="img_nuovecostruzioni/villette/resized/r_v4.jpg" alt="Villette vicino  a vercelli" />
                            </div>
                        </li>
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  photography" data-id="id-2" data-type="illustrator">
                            <div class="item-thumbs">
                                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Nuova costruzione"
                                    href="img_nuovecostruzioni/villette/v5.jpg"><span class="overlay-img"></span><span
                                        class="overlay-img-thumb font-icon-plus"></span></a>
                                <!-- Thumb Image and Description -->
                                <img src="img_nuovecostruzioni/villette/resized/r_v5.jpg" alt="Villette vicino  a vercelli" />
                            </div>
                        </li>
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  photography" data-id="id-2" data-type="illustrator">
                            <div class="item-thumbs">
                                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Nuova costruzione"
                                    href="img_nuovecostruzioni/villette/v6.jpg"><span class="overlay-img"></span><span
                                        class="overlay-img-thumb font-icon-plus"></span></a>
                                <!-- Thumb Image and Description -->
                                <img src="img_nuovecostruzioni/villette/resized/r_v6.jpg" alt="Villette vicino  a vercelli" />
                            </div>
                        </li>
                    </ul>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderJS" runat="server">
</asp:Content>
