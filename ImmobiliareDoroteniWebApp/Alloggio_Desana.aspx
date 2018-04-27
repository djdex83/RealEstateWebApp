<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Alloggio_Desana.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.Alloggio_Desana" %>
<%@ Register Src="~/webcontrols/Menu.ascx" TagName="Menu" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>Immobiliare Doroteni - Alloggio Desana</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
<uc:Menu runat="server" ID="Menu" MenuNode="NUOVE COSTRUZIONI"></uc:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitlePage" runat="server">
<h3 class="heading">
       Alloggio Desana</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderContainer" runat="server">
 <div class="row">
    <div class="col-lg-3">
        <img class="img-responsive" src="img_nuovecostruzioni/desanaalloggio/desana_mappa.jpg" title="Alloggio a Desana" alt="Alloggio a Desana"/>
    </div>
        <div class="col-lg-9">
            Vendesi alloggio nuovo, con riscaldamento autonomo posizionato al 1°piano di una casa indipendente in centro paese a Desana, composto da: entrata indipendente, soggiorno con angolo cottura, una camera da letto, un bagno, ed un sottotetto. Mq complessivi circa 88
L'alloggio ha doppi vetri, serramenti in pvc, pavimenti in ceramica e riscaldamento con termosifoni e caldaia a condensazione
Richiesta euro 55.000</div>
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
                                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Alloggio Desana"
                                    href="img_nuovecostruzioni/desanaalloggio/desana_02.jpg"><span class="overlay-img">
                                    </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                                <!-- Thumb Image and Description -->
                                <img src="img_nuovecostruzioni/desanaalloggio/resized/desana_02(Large).jpg"
                                    alt="Alloggio Desana" />
                            </div>
                        </li>
                        <!-- End Item Project -->
                        <!-- Item Project and Filter Name -->
                        <li class="item-thumbs col-lg-3 col-md-3 col-xs-3  design" data-id="id-1" data-type="icon">
                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Alloggio Desana"
                                href="img_nuovecostruzioni/desanaalloggio/desana_01.jpg"><span class="overlay-img">
                                </span><span class="overlay-img-thumb font-icon-plus"></span></a>
                            <!-- Thumb Image and Description -->
                            <img src="img_nuovecostruzioni/desanaalloggio/resized/desana_01(Large).jpg" alt="Alloggio Desana">
                        </li>
                    </ul>
                </section>
            </div>
        </div>
    </div>
 </asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderJS" runat="server">
</asp:Content>

