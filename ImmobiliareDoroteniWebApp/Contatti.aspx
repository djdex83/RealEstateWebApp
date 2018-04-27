<%@ Page Title="Immobiliare Doroteni - Contatti" Language="C#" MasterPageFile="~/Page.Master"
    AutoEventWireup="true" CodeBehind="Contatti.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.Contatti" %>

<%@ Register Src="~/webcontrols/Menu.ascx" TagName="Menu" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Immobiliare Doroteni - Contatti</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <uc:Menu runat="server" ID="Menu" MenuNode="Contatti"></uc:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitlePage" runat="server">
    <h3 class="heading">
        Contatti</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderContainer" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <p>
                <span class="glyphicon glyphicon-home" style="margin-right: 5px;"></span>Immobiliare
                Doroteni - Via Trino 47 - Vercelli</p>
            <p>
                <span class="glyphicon glyphicon-envelope" style="margin-right: 5px;"></span><a href="">
                    info@immobiliaredoroteni.it</a></p>
            <p>
                <span class="glyphicon glyphicon-earphone" style="margin-right: 5px;"></span>3387262306</p>
            <p>
                <span class="glyphicon glyphicon-time" style="margin-right: 5px;"></span>Lunedì-Venerdì
                9.30-12.00/15.00-19.00 - Sabato su appuntamento</p>
            <p>
                <span class="fa fa-facebook" style="margin-right: 5px;"></span><a href="https://www.facebook.com/immobiliaredoroteni?fref=ts">
                    Immobiliare Dotoreni</a></p>
        </div>
        <div class="col-lg-12">
            <h4 class="heading">
                Compila il modulo per richiedere informazioni</h4>
            <div id="contactform" class="validateform" name="send-contact">
                <div class="row">
                    <div class="col-lg-4 field">
                        <input type="text" name="name" class="contact-name" placeholder="* Nome e Cognome"
                            data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
                        <div class="validation">
                        </div>
                    </div>
                    <div class="col-lg-4 field">
                        <input type="text" name="email" class="contact-email" placeholder="* Indirizzo Email"
                            data-rule="email" data-msg="Please enter a valid email" />
                        <div class="validation">
                        </div>
                    </div>
                     <div class="col-lg-4 field">
                        <input type="text" name="telefono" class="contact-phone" placeholder="* Telefono"
                            data-rule="phone" data-msg="Please enter a valid phone" />
                        <div class="validation">
                        </div>
                    </div>
                    <div class="col-lg-12 margintop10 field">
                        <input type="text" name="subject" class="contact-oggetto" placeholder="* Oggetto Richiesta"
                            data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
                        <div class="validation">
                        </div>
                    </div>
                    <div class="col-lg-12 margintop10 field">
                     <div class="g-recaptcha" data-sitekey="6LcHeAsTAAAAAAPELQxiPaowYRCl9iG5svvR8snp"></div>
                    </div>
                    <div class="col-lg-12 margintop10 field">
                        <textarea rows="12" name="message" class="input-block-level contact-richiesta" placeholder="* Richiesta..."
                            data-rule="required" data-msg="Please write something"></textarea>
                        <div class="validation">
                        </div>
                        <p>
                            <button id="contact-submit" class="btn btn-theme margintop10 pull-left" type="submit">
                                Invia Richiesta</button>
                            <span class="pull-right margintop20">* E' necessario compilari i campi obbligatori!</span>
                        </p>
                        <div id="loaderemailok" class="loaderok" style="display: none;">
                                </div>
                    </div>
                </div>
                <div id="sendmessage">
                    Richiesta inviata. Grazie!
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <h4 class="heading">
                Dove siamo</h4>
        </div>
        <div class="col-lg-12">
            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2805.6937126337657!2d8.4082097!3d45.3146124!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47864c998076a671%3A0x32679f1419b971a9!2sVia+Trino%2C+47%2C+13100+Vercelli+VC!5e0!3m2!1sit!2sit!4v1434310116815"
                    width="600" height="450" frameborder="0" style="border: 0"></iframe>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderJS" runat="server">
    <script src='https://www.google.com/recaptcha/api.js?hl=it'></script>
    <script src="js/AppEmail.js" type="text/javascript"></script>
</asp:Content>
