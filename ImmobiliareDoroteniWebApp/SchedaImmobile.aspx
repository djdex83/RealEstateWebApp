<%@ Page Title="Immobiliare Doroteni - Scheda Immobile" Language="C#" MasterPageFile="~/Page.Master"
    AutoEventWireup="true" CodeBehind="SchedaImmobile.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.SchedaImmobile" %>

<%@ Register Src="~/webcontrols/Menu.ascx" TagName="Menu" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Immobiliare Doroteni - Scheda Immobile</title>
    <meta property="og:locale" content="it_IT" />
    <meta property="og:type" content="article" />
    <meta property="og:title" content="" />
    <meta property="og:description" content="" />
    <meta property="og:url" content="" />
    <meta property="og:site_name" content="" />
    <meta property="og:image" content="http://www.immobiliaredoroteni.it/ImmobiliareDoroteni.jpg" />
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <uc:Menu runat="server" ID="Menu" MenuNode="Immobili"></uc:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitlePage" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderContainer" runat="server">
    <div class="row">
        <div class="col-lg-9 col-md-9">
            <div class="main">
                <section id="overview">
                <img id="loader" class="loaderpage" style="display:none;" src="/img/Icon/loading.gif" alt="loader"/>                 
                <script id="annuncioTmpl" type="text/x-jsrender">
                    <article class="property-item clearfix">
                        <div class="wrap clearfix">
                            <h4 class="title col-lg-7 col-md-7 col-xs-12">
                                {{:Tipologia}} - Cod. immobile : {{:Codice}}
                            </h4>
                            <h5 class="price col-lg-5 col-md-5 col-xs-12">
                                <span class="status-label">{{:Contratto}} </span><span>{{:Prezzo}}</span>
                                   
                            </h5>
                        </div>
                        <section>
                            <div class="content clearfix">
                                <div class="copertina">
                                    <img class="img-responsive" src="{{:Thumbnail}}" alt="{{:Codice}}" title="{{:Codice}}" />
                                </div>
                            </div>
                        </section>
                        <section id="projects">
                            <div class="contentgallery clearfix">
                                <ul id="thumbs" class="portfolio">
                                    {{for Listafoto}}
                                         <li class="col-lg-2 col-md-2 col-xs-4 design" data-id="id-0" data-type="web">
                                            <div class="item-thumbs">
                                                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare"
                                                    href="{{:Path}}"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                                                    </span></a>
                                                <!-- Thumb Image and Description -->
                                                <img src="{{:Thumbnail}}" alt="Immobiliare Doroteni">
                                            </div>
                                        </li>
                                    {{/for}}
                                </ul>
                            </div>
                        </section>
                        <section>
                              <div class="property-meta clearfix" style="display:flex;justify-content:space-between;">
                                <span  style="display:flex;justify-content:center;">
                                    <i class="icon-map"></i>
                                    <span>{{:Mq}}</span>
                                </span>
                                  <span  style="display:flex;justify-content:center;">
                                    <i class="icon-location"></i>
                                    <span>{{:MqTerreno}}</span>
                                </span>
                                <span style="display:flex;justify-content:center;" >
                                    <i class="icon-bed"></i>
                                    <span>{{:Camere}}</span>
                                </span>
                                <span  style="display:flex;justify-content:center;" >
                                    <i class="icon-bath"></i>
                                    <span>{{:Bagni}}</span>
                                </span>
                                <span  style="display:flex;justify-content:center;" >
                                    <i class="icon-garage"></i>
                                    <span>{{:Box}}</span>
                                </span>
                                <span style="display:flex;justify-content:center;" >
                                    <i class="icon-stato"></i>
                                    <span>{{:Stato}}</span>
                                </span>
                                <!--<span class="col-lg-2 col-md-2 col-xs-12"><i class="icon-stato"></i>{{:Locali}}</span>-->
<%--                               <span class="col-lg-1 col-md-1 col-xs-12 print" style="text-align:right; display: inline-flex;justify-content: center;align-content:space-between" title="Stampa" alt="Stampa">
                                   <a href="javascript:window.print()">
                                       <i class="fa fa-print fa-3x" style="color:#394041"></i></a>
                               </span>--%>
                            </div>
                        </section>
                        <section>
                            <div class="classificazione">
                                <div class="classe_energ">
                                    <p>
                                        Classe energetica</p>
                                    <span class="{{:ClasseEnergetica}}"></span>
                                </div>
                               <div class="epi">
                                    <p>
                                        IPe: {{:IPE}} 
                                    </p>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                            <div class="clear">
                            </div>
                        </section>
                        <div class="content clearfix">
                            <p>
                                {{:Comune}} – Zona {{:Zona}}</p>
                            <p>
                                Riscaldamento: {{:Riscaldamento}} </p>
                            <p>
                                {{:Descrizione}}
                            </p>
                        </div>
                        <section>
                            <div class="condividi">
                                <div class="cond-social col-xs-3">
                                    <a href="https://www.facebook.com/sharer/sharer.php?u=http://www.immobiliaredoroteni.it/SchedaImmobile.aspx?Codice={{:Codice}}"
                                        target="_blank" rel="nofollow"><i class="fa fa-facebook"></i>Facebook</a></div>
                                <div class="cond-social col-xs-3">
                                    <a href="https://twitter.com/home?status=http://www.immobiliaredoroteni.it/SchedaImmobile.aspx?Codice={{:Codice}}"
                                        target="_blank" rel="nofollow"><i class="fa fa-twitter"></i>Twitter</a></div>
                                <div class="cond-social col-xs-3">
                                    <a href="https://plus.google.com/share?url=http://www.immobiliaredoroteni.it/SchedaImmobile.aspx?Codice={{:Codice}}"
                                        target="_blank" rel="nofollow"><i class="fa fa-google-plus"></i>Google+</a></div>
                                <div class="cond-social col-xs-3">
                                    <a href="https://www.linkedin.com/shareArticle?mini=true&amp;url=http://www.immobiliaredoroteni.it/SchedaImmobile.aspx?Codice={{:Codice}}"
                                        target="_blank" rel="nofollow"><i class="fa fa-linkedin"></i>Linkedin</a></div>
                                <div class="clear">
                                </div>
                            </div>
                            <div class="clear">
                            </div>
                        </section>
                        <section>
                            <div class="property-meta clearfix" style="display:flex;justify-content:space-between;">
                               <span class="col-lg-1 col-md-1 col-xs-12 print" style="text-align:right; display: inline-flex;justify-content: center;align-content:space-between" title="Stampa Scheda Immobile" alt="Stampa Scheda Immobile">
                                   <a href="javascript:window.print()">
                                       <i class="fa fa-print fa-3x" style="color:#394041"></i></a>
                               </span>
                            </div>
                        </section>
                        <div class="col-lg-12" id="formrichiediinfo" data-codice="{{:Codice}}">
                            <h4 class="heading">
                                Richiedi informazioni</h4>
                            <div id="contactform" class="validateform" name="send-contact">
                                <div id="sendmessage">
                                    Richiesta inviata. Grazie!
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 field">
                                        <input type="text" name="name" id="contact-name" placeholder="* Nome e Cognome" data-rule="maxlen:4"
                                            data-msg="Please enter at least 4 chars" />
                                        <div class="validation">
                                        </div>
                                    </div>
                                    <div class="col-lg-4 field">
                                        <input type="text" name="email" id="contact-email" placeholder="* Indirizzo Email" data-rule="email"
                                            data-msg="Please enter a valid email" />
                                        <div class="validation">
                                        </div>
                                    </div>
                                    <div class="col-lg-4 field">
                                        <input type="text" name="telefono" id="contact-phone" placeholder="* Telefono" 
                                            data-msg="Please enter a valid phone" />
                                        <div class="validation">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 margintop10 field">
                                        <textarea rows="12" name="message" id="contact-message" class="input-block-level" placeholder="* Richiesta..."
                                            data-rule="required" data-msg="Please write something"></textarea>
                                        <div class="validation">
                                        </div>
                                        <p>
                                            <button class="btn btn-theme margintop10 pull-left" id="contact-submit" type="submit">
                                                Invia Richiesta</button>
                                                <div id="loaderemailok" class="loaderok" style="display: none;"></div>
                                            <!-- <span class="pull-right margintop20">* E' necessario compilari i campi obbligatori!</span>-->
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                    </script>
                </section>
            </div>
        </div>
        <div class="col-lg-3 col-md-3">
            <section class="lateral">
                <div class="row nomargin">
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <h4>
                            <i class="icon-search"></i>Ricerca immobile</h4>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <div class="form-group">
                            <label for="codice">
                                Codice</label>
                            <input type="text" class="form-control" id="codice">
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                       <div class="form-group">
                            <label for="contratto">
                                Contratto</label>
                            <select class="form-control" id="contratto">
                                <option value="Tutte">Tutte le tipologie</option>
                                <option>Vendita</option>
                                <option>Affitto</option>
                                <option>Vendita a riscatto</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                         <div class="form-group">
                            <label for="provincie">
                                Provincia</label>
                            <select class="form-control" id="provincie">
                            </select>
                            <script id="provTmpl" type="text/x-jsrender">
                                 <option value="{{:Sigla}}">{{:Provincia}}</option>
                            </script>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <div class="form-group">
                            <label for="comuni">
                                Comune</label>
                            <select class="form-control" id="comuni">
                            </select>
                            <script id="comTmpl" type="text/x-jsrender">
                                <option value="{{:Id}}">{{:Comune}}</option>
                            </script>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                         <div class="form-group">
                            <label for="tipologia">
                                Tipologia</label>
                            <select class="form-control" id="tipologia">
                                <option>Tutti</option>
                                <option>Appartamento</option>
                                <option>Casa Indipendente</option>
                                <option>Villa</option>
                                <option>Villetta a schiera</option>
                                <option>Negozio</option>
                                <option>Ufficio</option>
                                <option>Capannone/Magazzino</option>
                                <option>Box</option>
                                <option>Terreno Agricolo</option>
                                <option>Terreno Edificabile</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                       <div class="form-group">
                            <label for="prezzo">
                                Prezzo</label>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                   <input type="number" id="prezzo" class="form-control" placeholder="da" min="0" max="1000000" step="5000" >
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                     <input type="number" id="prezzo2" class="form-control" placeholder="a" min="0" max="1000000" step="5000" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                       <div class="form-group">
                            <label for="camere">
                                Camere + Servizi</label>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                    <input type="number" id="camere" class="form-control" placeholder="da" min="0" max="100" step="1">
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                    <input type="number" id="camere2" class="form-control" placeholder="a" min="0" max="100" step="1">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                         <div class="form-group">
                            <label for="mq">
                                Dimensioni Mq</label>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                    <input type="number" id="mq" class="form-control" placeholder="da" min="0" max="100000" step="5">
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                    <input type="number" id="mq2" class="form-control" placeholder="a" min="0" max="1000000" step="5">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="col-lg-1 col-md-1 col-xs-2">

                         </div>-->
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <button type="submit" class="btn btn-primary" id="ricerca" style="float: right">
                            Ricerca</button>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderJS" runat="server">
    <script src="js/AppScheda.js" type="text/javascript"></script>
</asp:Content>
