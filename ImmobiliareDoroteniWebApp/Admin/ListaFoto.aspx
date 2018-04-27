<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ListaFoto.aspx.cs" Inherits="MarcoElleWebApp.Admin.ListaFoto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContenuto" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="box dark">
                <header>
                    <div class="icons">
                        <i class="fa fa-camera"></i>
                    </div>
                    <h5>
                        Vedi Foto</h5>
                </header>
                <div id="div-1" class="accordion-body collapse in body">
                    <div class="form-horizontal" id="inline-validate">
                        <div class="form-group">
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">
                                Seleziona Galleria Foto</label>
                            <div class="col-lg-4">
                                <select class="form-control" id="selgal" name="selgal">
                                </select>
                                 <script id="gallerietmpl" type="text/x-jquery-tmpl">
                                    <option value="${idGalleria}">${NomeGalleria}</option>
                                 </script>
                            </div>
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="box dark">
                <header>
                    <div class="icons">
                        <i class="fa fa-camera"></i>
                    </div>
                    <h5>Foto</h5>
                </header>
                <div class="accordion-body collapse in body">
                    <div class="form-horizontal">
                        <div class="form-group" id="listafoto"></div>

                        <script id="listafototmpl" type="text/x-jquery-tmpl">
                             <div class="col-xs-2">
                                <a href="${Path}" class="thumbnail" rel="prettyPhoto[${IdGalleria}]">
                                    <img src="${Thumbnail}" class="img-responsive" alt="foto" />
                                </a>
                                 <div class="links" id="Div4">
                                    <a class="fa fa-edit" title="Modifica Foto" id="${idFotoEntity}" data-type="editphoto"  data-toggle="modal" data-original-title="Help" data-placement="bottom" class="btn btn-default btn-sm" descrizione="${Descrizione}" href="#editFotoModal"></a>
                                    <span class="fa fa-times delete"  id="${idFotoEntity}" title="Cancella Foto" ></span>
                                     {{if Copertina==1}}
                                      <span class=""  id="${idFotoEntity}" title="Copertina Galleria" >Copertina</span>
                                     {{else}}
                                      <span class="fa fa-camera copertina"  id="${idFotoEntity}" id-gal="${IdGalleria}" title="Setta come copertina galleria" ></span>
                                     {{/if}}
                                </div>
                            </div>
                        </script>
                    </div>
                </div>
            </div>
        </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderJavascript" runat="server">
<!-- #helpModal -->
    <div id="editFotoModal" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Modifica Foto</h4>
          </div>
          <div class="modal-body">
            <div class="form-horizontal" id="Div1">
                        <div class="form-group">
                            <label class="control-label col-lg-4">
                                Descrizione foto</label>
                            <div class="col-lg-8">
                                <input type="text"  id="descrizionefoto" idf="" name="descrizionefoto" class="form-control col-lg-8" value="" >
                            </div>
                        </div>
                        </div>
          </div>
          <div class="modal-footer">
            <button type="button" id="updatefoto" class="btn btn-default">Salva</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Annulla</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#helpModal -->
    <script type="text/javascript" src="assets/lib/uplodify/swfobject.js"></script>
    <script type="text/javascript" src="assets/lib/uplodify/jquery.uploadify.v2.1.4.js"></script>
    <script type="text/javascript" src="js/GestioneVediFoto.js" ></script>
    <script type="text/javascript">
        $(document).ready(function () {

            GetGallerie();
            CategoriaFotoChange();
        });

    </script>
</asp:Content>
