<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="GallerieFoto.aspx.cs" Inherits="MarcoElleWebApp.Admin.GallerieFoto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderTitolo" runat="server">
    <h3>
        <i class="fa fa-camera"></i>&nbsp;Gestione Foto</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContenuto" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="box dark">
                <header>
                    <div class="icons">
                        <i class="fa fa-edit"></i>
                    </div>
                    <h5>
                        Inserisci Galleria Foto</h5>
                </header>
                <div id="div-1" class="accordion-body collapse in body">
                    <div class="form-horizontal" id="inline-validate">
                        <div class="form-group">
                            <label class="control-label col-lg-4">
                                Nome Galleria</label>
                            <div class="col-lg-4">
                                <input type="text" id="namegal" name="namegal" class="form-control col-lg-4"    required  data-validation-required-message="Campo Obbligatorio" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">
                                Testo Galleria</label>
                            <div class="col-lg-4">
                                <input type="text" id="textgal" name="textgal" class="form-control col-lg-4"    required  data-validation-required-message="Campo Obbligatorio" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">
                                Categoria Galleria</label>
                            <div class="col-lg-4">
                                <select class="form-control" id="selcat" name="selcat"    required  data-validation-required-message="Campo Obbligatorio" >
                                </select>
                                 <script id="categorietmpl" type="text/x-jquery-tmpl">
                                    <option value="${idCategoria}">${NomeCategoria}</option>
                                 </script>
                            </div>
                        </div>
                        <div class="form-actions">
                            <input type="submit" value="Salva Galleria Foto" id="btgalleriafoto" class="btn btn-primary">
                            <input type="submit" value="Annulla" id="deletegalbutton" class="btn">
                            <img id="loader" style="display:none;" src="assets/img/ajax-loader.gif" alt="loader" />
                        </div>
                         <div class="successo msg" id="msgdone" style="display: none">Salvataggio concluso con successo!</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <!--Begin Datatables-->
            <div class="row">
              <div class="col-lg-12">
                <div class="box">
                  <header>
                    <div class="icons">
                      <i class="fa fa-table"></i>
                    </div>
                    <h5>Lista Gallerie Foto</h5>
                  </header>
                  <div id="collapse4" class="body">
                    <table id="dataTableGallerie" class="table table-bordered table-condensed table-hover table-striped">
                      <thead>
                      </thead>
                      <tbody>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div><!-- /.row -->

            <!--End Datatables-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderJavascript" runat="server">
    <script src="assets/lib/jqValidation/jqBootstrapValidation.js" type="text/javascript"></script>
    <script src="js/GestioneGallerieFoto.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            GetCategorie();
            DeleteFieldGalleria();
            SaveGalleria();
            metisTableGallerie();
            metisSortable();
            //            $("#btcategoriefoto").click(function (e) {
            //                e.preventDefault();
            //                formValidation();
            //            });
        });
    </script>
</asp:Content>
