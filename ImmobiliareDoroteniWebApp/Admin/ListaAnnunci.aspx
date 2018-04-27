<%@ Page Title="Administration Site - Lista Annunci" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ListaAnnunci.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.Admin.ListaAnnunci" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTitolo" runat="server">
 <h3>
        <i class="fa fa-home"></i>&nbsp;Elenco Annunci</h3>
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
                    <h5>Lista Annunci Immobiliari</h5>
                  </header>
                  <div id="collapse4" class="body">
                    <table id="dataTableAnnunci" class="table table-bordered table-condensed table-hover table-striped">
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
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderJavascript" runat="server">
    <script src="js/GestioneListaAnnunci.js" type="text/javascript"></script>
    <script src="assets/lib/jqValidation/jqBootstrapValidation.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            metisTableAnnunci();
            metisSortable();
        });
    </script>
</asp:Content>
