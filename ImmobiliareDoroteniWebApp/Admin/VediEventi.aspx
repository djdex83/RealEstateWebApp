<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="VediEventi.aspx.cs" Inherits="MarcoElleWebApp.Admin.VediEventi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
     <link href="assets/lib/prettify/prettify.css" rel="stylesheet" type="text/css" />
     <link rel="stylesheet" href="assets/lib/datepicker/css/datepicker.css">
     <link rel="stylesheet" href="assets/lib/wysihtml5/dist/bootstrap-wysihtml5-0.0.2.css">
     <link rel="stylesheet" href="assets/css/bootstrap-wysihtml5-hack.css">
     <link href="assets/lib/uplodify/uploadify.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTitolo" runat="server">
    <h3>
        <i class="fa fa-pencil"></i>&nbsp;Gestione News</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContenuto" runat="server">
    <!--Begin Datatables-->
    <div class="row">
        <div class="col-lg-12">
            <div class="box">
                <header>
                    <div class="icons">
                        <i class="fa fa-table"></i>
                    </div>
                    <h5>
                        Lista News</h5>
                </header>
                <div id="collapse4" class="body">
                    <table id="dataTableEventi" class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <div class="row" id="ModificaEvento" style="display:none">
        <div class="col-lg-12">
            <div class="box">
                <header>
                    <div class="icons">
                        <i class="fa fa-edit"></i>
                    </div>
                    <h5>
                        Modifica News</h5>
                </header>
                <div id="div-1" class="accordion-body collapse in body">
                    <div class="form-horizontal" id="inline-validate">
                        <div class="form-group">
                            <label class="control-label col-lg-4" for="dp3">
                                Data News</label>
                            <div class="col-lg-3">
                                <div class="input-group input-append date" id="dp3" data-date="" data-date-format="dd-mm-yyyy">
                                    <input class="form-control" id="dataevento" type="text" value="">
                                    <span class="input-group-addon add-on"><i class="fa fa-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">
                                Titolo News</label>
                        <div class="col-lg-8">
                               <input type="text" id="titoloevento" name="titoloevento" class="form-control col-lg-8" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">
                                Testo News</label>
                            <div class="col-lg-8">
                                 <textarea id="wysihtml5" class="form-control"  rows="10"></textarea>
                            </div>
                        </div>
                        <div class="form-group" id="formfotoevento">
                            <label class="control-label col-lg-4">
                                Foto News</label>
                            <div class="col-lg-8">
                             <div class="col-xs-4">
                                <a href="" class="thumbnail" rel="prettyPhoto">
                                    <img src="" class="img-responsive" id="fotoevento" alt="foto" />
                                </a>
                                 <%--<div class="links" id="Div4">
                                    <span class="fa fa-times delete" id="" title="Cancella Foto" ></span>
                                    <span class="fa fa-edit cambia" id="" title="Cambia Foto" ></span>
                                </div>--%>
                            </div>
                            </div>
                        </div>
                        <div class="form-group" id="formcambiafoto" style="display:none;" > 
                            <label class="control-label col-lg-4">
                                Carica foto</label>
                            <div class="col-lg-8">
                                <input type="file" name="..." id="uploadify2" />
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="button" id="updateevento" id-evento="" class="btn btn-default">
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
    <!-- /.row -->
            <!--End Datatables-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderJavascript" runat="server">
      <script src="assets/lib/prettify/prettify.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/lib/uplodify/swfobject.js"></script>
    <script type="text/javascript" src="assets/lib/uplodify/jquery.uploadify.v2.1.4.js"></script>
    <script type="text/javascript" src="assets/lib/datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/lib/wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
    <script  type="text/javascript"src="assets/lib/bootstrap-wysihtml5-hack.js"></script>
    <script  type="text/javascript" src="assets/lib/jasny/js/jasny-bootstrap.min.js"></script>
    <script src="js/GestioneVediEventi.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            AggiornaEvento();
            metisTableEventi();
            metisSortable();
            
        });
    </script>
</asp:Content>

