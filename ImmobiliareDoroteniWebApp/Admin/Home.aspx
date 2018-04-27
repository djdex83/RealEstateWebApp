<%@ Page Title="Administration Site - Home" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MarcoElleWebApp.Admin.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderTitolo" runat="server">
    <h3>
        <i class="fa fa-home"></i>&nbsp;Home</h3>
</asp:Content>   
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContenuto" runat="server">
<div class="row">
<div class="col-lg-12">
 <h2 >Pannello di Amministrazione Sito
              </h2>
              <p>Questa &egrave; la Home Page del pannello di amministrazione del vostro sito.</p>
              <p>A lato &egrave; possibile visualizzare il menu per poter raggiungere facilmente tutte le pagine</p>
              </div>
              </div>
              <div class="row">
              <br />
              <div class="col-xs-4" style="text-align: center;color:#3276b1;"><a href="CreaAnnuncio.aspx"><i class="fa fa-home fa-2x"></i><br /><h3>&nbsp;Gestione Annunci Immobiliari</h3></a></div>
              <div class="col-xs-4" style="text-align: center;color:#3276b1;"><a href="GestioneContenuti.aspx"><i class="fa fa-columns fa-2x"></i><br /><h3>&nbsp;Gestione Contenuti</h3></a></div>
              <div class="col-xs-4" style="text-align: center;color:#3276b1;"><a href="InserisciCollaborazioni.aspx"><i class="fa fa-columns fa-2x"></i><br /><h3>&nbsp;Gestione Collaborazioni</h3></a></div>
              </div>
             <div class="row">
             <div class="col-lg-12">
              <h3 id="licensing">Licensing</h3>
              <p>Bootstrap Admin template is open-sourced software licensed under the
                <a href="http://opensource.org/licenses/MIT">MIT License</a>
              </p>
              </div>
              </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderJavascript" runat="server">
</asp:Content>
