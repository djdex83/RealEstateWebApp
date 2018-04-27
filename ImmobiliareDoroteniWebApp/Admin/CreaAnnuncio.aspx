<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="CreaAnnuncio.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.Admin.CreaAnnuncio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <link href="assets/lib/prettify/prettify.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/lib/datepicker/css/datepicker.css">
    <link rel="stylesheet" href="assets/lib/wysihtml5/dist/bootstrap-wysihtml5-0.0.2.css">
    <link rel="stylesheet" href="assets/css/bootstrap-wysihtml5-hack.css">
    <link rel="stylesheet" href="assets/lib/jasny/css/jasny-bootstrap.min.css">
    <link href="assets/lib/uplodifive/uploadifive.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTitolo" runat="server">
    <h3>
        <i class="fa fa-home"></i>&nbsp;Gestione Annunci</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContenuto" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="box dark">
                <header>
                    <div class="icons">
                        <i class="fa fa-edit"></i>
                    </div>
                    <h5>
                        Inserisci Nuovo Annuncio Immobiliare</h5>
                </header>
                <div id="div-1" class="row accordion-body collapse in body">
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="name">
                                Contratto</label>
                            <select class="form-control" id="contratto" name="contratto" required data-validation-required-message="Campo Obbligatorio">
                                <option value="-1">Seleziona Tipo Contratto</option>
                                <option value="Affitto">Affitto</option>
                                <option value="Vendita">Vendita</option>
                                <option value="Vendita a riscatto">Vendita a riscatto</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="inputEmail">
                                Codice</label>
                            <input type="text" class="form-control" id="codice">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="name">
                                Tipologia</label><label class="obbligatorio">*obbligatorio</label>
                            <select class="form-control" id="tipologia" name="tipologia" required data-validation-required-message="Campo Obbligatorio">
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
                    
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="name">
                                Provincia</label><label class="obbligatorio">*obbligatorio</label>
                            <select class="form-control" id="provincia" name="provincia" required data-validation-required-message="Campo Obbligatorio">
                            </select>
                             <script id="provinciatmpl" type="text/x-jquery-tmpl">
                                    <option value="${Sigla}">${Provincia}</option>
                                 </script>
                        </div>
                    </div>
                     <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="name">
                                Comune</label><label class="obbligatorio">*obbligatorio</label>
                            <select class="form-control" id="comune" name="comune" required data-validation-required-message="Campo Obbligatorio">
                            </select>
                            <script id="comunetmpl" type="text/x-jquery-tmpl">
                                <option value="${Id}">${Comune}</option>
                            </script>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="name">
                                Stato immobile</label><label class="obbligatorio">*obbligatorio</label>
                            <select class="form-control" id="stato" name="stato" >
                                <option value="-1">Seleziona stato </option>
                                <option value="Buono">Buono</option>
                                <option value="Ristrutturato">Ristrutturato</option>
                                <option value="Da Ristrutturare">Da Ristrutturare</option>
                                <option value="Nuovo">Nuovo</option>
                                <option value="Capannone Commerciale">Capannone Commerciale</option>
                                <option value="Capannone Commerciale e Produttivo">Capannone Commerciale e Produttivo</option>
                                <option value="Terreno Agricolo">Terreno Agricolo</option>
                                <option value="Terreno Edificabile">Terreno Edificabile</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="inputEmail">
                                Zona</label>
                            <input type="text" class="form-control" id="zona">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="inputEmail">
                                Dimensione Mq</label><label class="obbligatorio">*obbligatorio</label>
                            <input type="text" class="form-control" id="mq" placeholder="Inserire un numero">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="inputEmail">
                                Nr.Vani</label><label class="obbligatorio">*obbligatorio</label>
                            <input type="text" class="form-control" id="camere" placeholder="Inserire un numero">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="inputEmail">
                                Nr.Locali</label><label class="obbligatorio">*obbligatorio</label>
                            <input type="text" class="form-control" id="locali" placeholder="Inserire un numero">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="inputEmail">
                                Nr.Bagni</label><label class="obbligatorio">*obbligatorio</label>
                            <input type="text" class="form-control" id="bagni" placeholder="Inserire un numero">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="inputEmail">
                                Piano</label>
                            <input type="text" class="form-control" id="piano">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="inputEmail">
                                Classe Energetica</label>
                            <input type="text" class="form-control" id="classeenergetica" placeholder="Inserire la classe - Inserire l'IPE">
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="inputEmail">
                                Ascensore</label>
                            <input type="text" class="form-control" id="ascensore">
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-2">
                        <div class="form-group">
                            <label for="inputEmail">
                                Box</label>
                            <%--<input type="text" class="form-control" id="box">--%>
                            <input type="checkbox" class="form-control" id="box">
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-2">
                        <div class="form-group">
                            <label for="inputEmail">
                                Box Doppio</label>
                            <%--<input type="text" class="form-control" id="box">--%>
                            <input type="checkbox" class="form-control" id="boxdoppio">
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-2">
                        <div class="form-group">
                            <label for="inputEmail">
                                Posto Auto</label>
                            <%--<input type="text" class="form-control" id="box">--%>
                            <input type="checkbox" class="form-control" id="postoauto">
                        </div>
                    </div>
                     <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="inputEmail">
                                Annuncio Pubblico</label>
                            <input type="checkbox" class="form-control" id="pubblico">
                        </div>
                    </div>
                     <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="name">
                                Riscaldamento</label>
                            <select class="form-control" id="riscaldamento" name="riscaldamento" >
                                <option value="-1">Seleziona riscaldamento </option>
                                <option value="autonomo">Autonomo</option>
                                <option value="centralizzato">Centralizzato</option>
                                <option value="centralizzato con contabilizzatori a consumo">Centralizzato con contabilizzatori a consumo</option>
                            </select>
                        </div>
                    </div>
                     <div class="col-lg-6 col-md-6 col-xs-6">
                        <div class="form-group">
                            <label for="inputEmail">
                                Mq Terreno annesso</label>
                            <input type="text" class="form-control" id="mqterreno" placeholder="Inserire i mq del terreno annesso alla casa. Da inserire solo per le case.">
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <div class="form-group">
                            <label for="inputEmail">
                                Prezzo</label><label class="obbligatorio">*obbligatorio, per Trattativa Riservata mettere 0</label>
                            <input type="text" class="form-control" id="prezzo" placeholder="Inserire il prezzo senza punti o virgole" required data-validation-required-message="Campo Obbligatorio">
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <div class="form-group">
                            <label for="inputEmail">
                                Descrizione Breve</label><label class="obbligatorio">*obbligatorio</label>
                            <input type="text" class="form-control" id="descbreve" placeholder="Inserire una breve descrizione di una decina di parole">
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <div class="form-group">
                            <label for="inputEmail">
                                Descrizione Estesa</label><label class="obbligatorio">*obbligatorio</label>
                            <textarea id="wysihtml5" class="form-control" rows="10" required data-validation-required-message="Campo Obbligatorio"></textarea>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                    <hr />
                        <div class="form-group">
                            <label class="control-label col-lg-4">
                                Carica foto</label>
                            <input type="file" name="file_upload" id="file_upload" multiple="true" />
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <div class="form-actions">
                            <input type="submit" value="Salva Annuncio e foto" id="btnuovoAnnuncio" class="btn btn-primary">
                            <input type="submit" value="Annulla" id="refreshAnnuncio" class="btn">
                            <img id="loader" style="display: none;" src="assets/img/ajax-loader.gif" alt="loader" />
                        </div>
                    </div>
                    <div class="successo msg" id="msgdone" style="display: none">
                        Salvataggio Annuncio e foto concluso con successo!</div>
                    <input type="hidden" id="listafile" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderJavascript" runat="server">
    <script src="assets/lib/prettify/prettify.js" type="text/javascript"></script>
    <!--<script type="text/javascript" src="assets/lib/uplodify/swfobject.js"></script>-->
    <script type="text/javascript" src="assets/lib/uplodifive/jquery.uploadifive.min.js"></script>
    <script type="text/javascript" src="assets/lib/datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/lib/wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript" src="assets/lib/bootstrap-wysihtml5-hack.js"></script>
    <script type="text/javascript" src="assets/lib/jasny/js/jasny-bootstrap.min.js"></script>
    <script src="assets/lib/jqValidation/jqBootstrapValidation.js" type="text/javascript"></script>
    <script src="js/GestioneAnnunci.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            CaricaOnLoad();
        });
    </script>
</asp:Content>
