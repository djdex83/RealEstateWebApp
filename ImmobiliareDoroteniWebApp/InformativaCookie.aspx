<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="InformativaCookie.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.InformativaCookie" %>

<%@ Register Src="~/webcontrols/Menu.ascx" TagName="Menu" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <title>Immobiliare Doroteni - Informativa Cookie</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
 <uc:Menu runat="server" ID="Menu" MenuNode="Contatti"></uc:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitlePage" runat="server">
 <h3 class="heading">
        Informativa</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderContainer" runat="server">
<div class="row">
        <div class="col-lg-12">
            <div>
                <h3>Cos'è un cookie</h3>
                Un cookie è un piccolo file di testo che viene memorizzato dal computer nel momento in cui un sito web viene visitato da un utente. Il testo memorizza informazioni che il sito è in grado di leggere nel momento in cui viene consultato in un secondo momento. Alcuni di questi cookie sono necessari al corretto funzionamento del sito, altri sono invece utili al visitatore perché in grado di memorizzare in modo sicuro per esempio il nome utente.
                <h3>Perché usiamo i cookie</h3>
                    Si usano i cookie per ricordare il nome utente nelle pagine di registrazione e per analizzare i modelli di traffico degli utenti che visitano il nostro sito, in modo da migliorare l'usabilità. Inoltre usiamo servizi di terze parti che a loro volta usano cookie. <br />
                        Ecco l'elenco di questi servizi e il link alle singole informative sulla privacy:<br />
                <ul>
                <li>Google analytics è un servizio di analisi web fornito da Google Inc</li>
                <li>Google maps è un servizio che consente la ricerca e la visualizzazione di carte geografiche fornito da Google Inc</li>
                <li>YouTube e Vimeo sono due piattaforme web che consentono la condivisione e visualizzazione in rete di video</li>
                <li>Instagram è un'app per la condivisione delle foto</li>
                <li>Twitter è un social network</li>
                <li>Facebook è un social network</li>
                </ul>
                Disqus è una piattaforma per i commenti degli utenti dove trovare informazioni su come disattivare o gestire i cookie nei diversi browser:
                <ul>
                <li>Google Chrome</li>
                <li>Mozilla Firefox</li>
                <li>Apple Safari</li>
                <li>Microsoft Windows Explorer</li> 
                </ul>
                <br />
                Disattivando i cookie, però, il funzionamento di questo sito potrebbe essere compromesso. <br />
                Ai sensi dell’art. 122 secondo comma del D.lgs. 196/2003 il consenso all’utilizzo di tali cookie è espresso dall’interessato mediante il settaggio individuale che ha scelto liberamente per il browser utilizzato per la navigazione nel sito, ferma restando la facoltà dell’utente di comunicare in ogni momento al Titolare del trattamento la propria volontà in merito ad dati gestiti per il tramite dei cookie che il browser stesso abbia accettato.
                <br />Il titolare dei dati è:
                <br />Silvia Doroteni
                <br /><a href="mailto:info@immobiliaredoroteni.it">info@immobiliaredoroteni.it</a>
            </div>
        </div>
     </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderJS" runat="server">
</asp:Content>
