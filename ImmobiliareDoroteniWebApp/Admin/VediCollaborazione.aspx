<%@ Page Title="Administration Site - Annuncio" Language="C#" MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="VediCollaborazione.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.Admin.VediCollaborazione" %>

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
                        Collaborazione <a href="javascript:window.print()"><span class="fa fa-print" id="printscheda">
                        </span></a>
                    </h5>
                </header>
                <div id="div-1" class="row accordion-body collapse in body">
                    <div class="col-lg-6 col-md-6 col-xs-12">
                        <div class="box dark">
                            <header>
                                <div class="icons">
                                    <i class="fa fa-comment-o"></i>
                                </div>
                                <h5>
                                    Descrizione</h5>
                            </header>
                            <div class="form-group">
                                <input type="text" class="form-control" id="descrizione">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xs-12">
                        <div class="box dark">
                            <header>
                                <div class="icons">
                                    <i class="fa fa-camera"></i>
                                </div>
                                <h5>
                                    Foto</h5>
                            </header>
                            <div class="accordion-body collapse in body">
                                <div class="form-horizontal">
                                    <div class="form-group" id="foto">
                                    </div>
                                    <script id="fototmpl" type="text/x-jquery-tmpl">
                                     <div class="col-xs-8">
                                        <a href="${Thumbnail}" class="thumbnail" rel="prettyPhoto[f]">
                                            <img src="${Path}" class="img-responsive" alt="foto" />
                                        </a>
                                    </div>
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <div class="form-actions">
                            <input type="submit" value="Aggiorna collaborazione" id="btupdateCollaborazione"
                                class="btn btn-primary">
                            <input type="submit" value="Annulla" id="refreshCollaborazione" class="btn">
                            <img id="loader" style="display: none;" src="assets/img/ajax-loader.gif" alt="loader" />
                        </div>
                    </div>
                    <div class="successo msg" id="msgdone" style="display: none">
                        Aggiornamento Collaborazione concluso con successo!</div>
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
    <script src="js/GestioneVediCollaborazioni.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            CaricaOnLoad();
        });
    </script>
</asp:Content>
