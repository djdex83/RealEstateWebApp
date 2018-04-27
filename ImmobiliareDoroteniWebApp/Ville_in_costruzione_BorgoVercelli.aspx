<%@ Page Title="Immobiliare Doroteni - Ville in costruzione a Borgo Vercelli" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Ville_in_costruzione_BorgoVercelli.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.Ville_in_costruzione_BorgoVercelli" %>
<%@ Register Src="~/webcontrols/Menu.ascx" TagName="Menu" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>Immobiliare Doroteni - Complesso residenziale - I Gigli d'acqua</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
<uc:Menu runat="server" ID="Menu" MenuNode="NUOVE COSTRUZIONI"></uc:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitlePage" runat="server">
<h3 class="heading">
       Ville in costruzione a Borgo Vercelli</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderContainer" runat="server">
 <div class="row">
    <div class="col-lg-3">
        <img class="img-responsive" src="img_nuovecostruzioni/borgovercelli/Ville_Borgovercelli.jpg" title="Villetta a Borgo Vercelli" alt="Villetta a Borgo Vercelli"/></a>
    </div>
        <div class="col-lg-9">
            In vendita in esclusiva, ultima (di tre), villetta da costruire, disposta su due
            piani con grande terrazzo, box auto cortile, giardino. Capitolato da visionare in
            ufficio, classe energetica B.Così composta: soggiorno, cucina abitabile, 2 camere
            ampia taverna, 2 bagni.Interessante compromesso tra il desiderio di avere spazi
            privati e il prezzo d'acquisto.</div>
        <div class="col-lg-12">
            <h4 class="heading">
                Planimetrie</h4>
            <a href="img_nuovecostruzioni/borgovercelli/terra.pdf"><i class="fa fa-file-o fa-2x"></i>Piano Terra</a>
            <a href="img_nuovecostruzioni/borgovercelli/primo.pdf"><i class="fa fa-file-o fa-2x"></i>Primo Piano</a>
            <a href="img_nuovecostruzioni/borgovercelli/secondo.pdf"><i class="fa fa-file-o fa-2x"></i>Secondo Piano</a>
        </div>
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
                                    href="img_nuovecostruzioni/borgovercelli/3D%20PUGLISI%20-%201.jpg"><span class="overlay-img">
                                    </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                                <!-- Thumb Image and Description -->
                                <img src="img_nuovecostruzioni/borgovercelli/resized/r_3D%20PUGLISI%20-%201.jpg"
                                    alt="Villetta a Borgo Vercelli" />
                            </div>
                        </li>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  design" data-id="id-1" data-type="icon">
                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Nuova costruzione"
                                href="img_nuovecostruzioni/borgovercelli/3D%20PUGLISI%20-%202.jpg"><span class="overlay-img">
                                </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                            <!-- Thumb Image and Description -->
                            <img src="img_nuovecostruzioni/borgovercelli/resized/r_3D%20PUGLISI%20-%202.jpg" alt="Villetta a Borgo Vercelli">
                        </li>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  photography" data-id="id-2" data-type="illustrator">
                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Nuova costruzione"
                                href="img_nuovecostruzioni/borgovercelli/3D%20PUGLISI%20-%203.jpg"><span class="overlay-img">
                                </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                            <!-- Thumb Image and Description -->
                            <img src="img_nuovecostruzioni/borgovercelli/resized/r_3D%20PUGLISI%20-%203.jpg"
                               alt="Villetta a Borgo Vercelli">
                        </li>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  photography" data-id="id-2" data-type="illustrator">
                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Nuova costruzione"
                                href="img_nuovecostruzioni/borgovercelli/3D%20PUGLISI%20-%204.jpg"><span class="overlay-img">
                                </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                            <!-- Thumb Image and Description -->
                            <img src="img_nuovecostruzioni/borgovercelli/resized/r_3D%20PUGLISI%20-%204.jpg" alt="Villetta a Borgo Vercelli">
                        </li>
                    </ul>
                </section>
            </div>
        </div>
    </div>
 </asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderJS" runat="server">
</asp:Content>

