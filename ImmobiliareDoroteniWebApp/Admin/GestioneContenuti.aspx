<%@ Page Title="Administration Site - Contenuti" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="GestioneContenuti.aspx.cs" Inherits="MarcoElleWebApp.Admin.GestioneContenuti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
  <link href="assets/lib/prettify/prettify.css" rel="stylesheet" type="text/css" />
     <link rel="stylesheet" href="assets/lib/datepicker/css/datepicker.css">
     <link rel="stylesheet" href="assets/lib/wysihtml5/dist/bootstrap-wysihtml5-0.0.2.css">
     <link rel="stylesheet" href="assets/css/bootstrap-wysihtml5-hack.css">
     <link href="assets/lib/uplodify/uploadify.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTitolo" runat="server">
  <h3>
        <i class="fa fa-camera"></i>&nbsp;Gestione Contenuti</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContenuto" runat="server">
<div class="row" id="gestioneContenuti" >
        <div class="col-lg-12">
            <div class="box">
                <header>
                    <div class="icons">
                        <i class="fa fa-edit"></i>
                    </div>
                    <h5>
                        Gestione Contenuti</h5>
                </header>
                <div id="div-1" class="accordion-body collapse in body">
                    <div class="form-horizontal" id="inline-validate">
                        <div class="form-group">
                            <label class="control-label col-lg-4">
                                Seleziona Contenuto</label>
                            <div class="col-lg-4">
                                <select class="form-control" id="selpaginacontenuti" name="seltipo">
                                    <option value="-1">Seleziona Pagina da modificare</option>
                                    <option value="Agenzia.txt">Agenzia</option>
                                </select>
                            </div>
                        </div>
                      <div class="form-group">
                            <label class="control-label col-lg-4">
                                Contenuto</label>
                            <div class="col-lg-8">
                                 <textarea id="wysihtml5" class="form-control"  rows="10"></textarea>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="button" id="savecontenutibutton" class="btn btn-default">
                                Salva</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                Annulla</button>
                            <img id="loader" style="display: none;" src="assets/img/ajax-loader.gif" alt="loader" />
                        </div>
                        <div class="successo msg" id="msgdone" style="display: none">
                            Aggiornamento concluso con successo!</div>
                        <input type="hidden" id="listafile" />
                    </div>
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
    <script  type="text/javascript"src="assets/lib/bootstrap-wysihtml5-hack.js"></script>
    <script  type="text/javascript" src="assets/lib/jasny/js/jasny-bootstrap.min.js"></script>
    <script src="js/GestioneContenuti.js" type="text/javascript"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             CaricaOnLoad();
             //to do:
             //   UpdateContenuti();
             //   SelezionaContenutiChange();
         });
    </script>
</asp:Content>
