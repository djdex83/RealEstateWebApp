<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="InserisciCollaborazioni.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.Admin.InserisciCollaborazioni" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <link href="assets/lib/prettify/prettify.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/lib/datepicker/css/datepicker.css">
    <link rel="stylesheet" href="assets/lib/wysihtml5/dist/bootstrap-wysihtml5-0.0.2.css">
    <link rel="stylesheet" href="assets/css/bootstrap-wysihtml5-hack.css">
    <link rel="stylesheet" href="assets/lib/jasny/css/jasny-bootstrap.min.css">
    <link href="assets/lib/uplodify/uploadify.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTitolo" runat="server">
 <h3>
        <i class="fa fa-home"></i>&nbsp;Gestione Collaborazioni</h3>
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
                        Inserisci Nuova Collaborazioni</h5>
                </header>
                <div id="div-1" class="row accordion-body collapse in body">
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <div class="form-group">
                            <label for="inputEmail">
                                Descrizione</label><label class="obbligatorio">*obbligatorio</label>
                            <input type="text" class="form-control" id="descrizione" placeholder="Inserire la descrizione per il collaboratore">
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                    <hr />
                        <div class="form-group">
                            <label class="control-label col-lg-4">
                                Carica foto</label><label class="obbligatorio">*obbligatorio - Solo una foto</label>
                            <input type="file" name="..." id="uploadify1" />
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <div class="form-actions">
                            <input type="submit" value="Salva Collaborazione e foto" id="btnuovaCollaborazione" class="btn btn-primary">
                            <input type="submit" value="Annulla" id="refreshCollaborazione" class="btn">
                            <img id="loader" style="display: none;" src="assets/img/ajax-loader.gif" alt="loader" />
                        </div>
                    </div>
                    <div class="successo msg" id="msgdone" style="display: none">
                        Salvataggio Collaborazione e foto concluso con successo!</div>
                    <input type="hidden" id="listafile" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderJavascript" runat="server">
    <script src="assets/lib/prettify/prettify.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/lib/uplodify/swfobject.js"></script>
    <script type="text/javascript" src="assets/lib/uplodify/jquery.uploadify.v2.1.4.js"></script>
    <script type="text/javascript" src="assets/lib/datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/lib/wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript" src="assets/lib/bootstrap-wysihtml5-hack.js"></script>
    <script type="text/javascript" src="assets/lib/jasny/js/jasny-bootstrap.min.js"></script>
    <script src="assets/lib/jqValidation/jqBootstrapValidation.js" type="text/javascript"></script>
    <script src="js/GestioneCollaborazioni.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            CaricaOnLoad();
        });
    </script>
   </asp:Content>
