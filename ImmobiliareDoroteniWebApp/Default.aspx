<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Immobiliare Doroteni - Agenzia Immobiliare a Vercelli</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="L'Agenzia Immobiliare Doroteni di Vercelli vende e affitta appartamenti, ville, attici, terreni e altri immobili residenziali e commerciali. A disposizione di tutti i clienti esperienza, precisione e affidabilità. " />
    <meta name="keywords" lang="it" content="agenzia immobiliare vercelli, appartamento vercelli, vendita case, condomini, nuovi immobili, compravendita vercelli, vercelli, affitti vercelli, doroteni vercelli, agenzia doroteni" /> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="robots" content="index,follow" />
    <meta name="robots" content="all" />
    <meta name="revisit-after" content="2 days" />
    <meta name="rating" content="General" />
    <meta name="Copyright" content="Copyright ©2015, Silvia Doroteni">
    <link rel="canonical" href="http://www.immobiliaredoroteni.it/" />
    <meta property="og:locale" content="it_IT" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Agenzia Immobiliare Doroteni - Vercelli" />
    <meta property="og:description" content="Agenzia Immobiliare Doroteni, agenzia immobiliare sita in Vercelli offre esperienza, precisione e affidabilità." />
    <meta property="og:url" content="http://www.immobiliaredoroteni.it" />
    <meta property="og:site_name" content="Agenzia Immobiliare Doroteni - Vercelli" />
    <meta property="og:image" content="http://www.immobiliaredoroteni.it/ImmobiliareDoroteni.jpg" />
    <!-- css -->
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link rel="stylesheet" href="owlcarousel/owl.carousel.css">
    <link rel="stylesheet" href="owlcarousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/pgwslider.css">
    <link href="css/style.css" rel="stylesheet" />
    <!-- Theme skin -->
    <link href="skins/default.css" rel="stylesheet" />
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
  m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-67109513-1', 'auto');
        ga('send', 'pageview');

</script>
<!-- Begin Cookie Consent plugin by Silktide - http://silktide.com/cookieconsent -->
<script type="text/javascript">
    window.cookieconsent_options = { "message": "Uso i cookie per facilitare la navigazione del sito. Chiudendo il banner o scorrendo la pagina acconsenti.", "dismiss": "Ok", "learnMore": "Leggi informativa", "link": "http://www.immobiliaredoroteni.it/InformativaCookie.aspx", "theme": "dark-top" };
</script>
<script type="text/javascript" src="js/cookieconsent.js"></script>
<!-- End Cookie Consent plugin -->
</head>
<body>

    <form id="form1" runat="server">
    <!-- Loader -->
    <div class="loader">
        <div class="loader-img">
        </div>
    </div>
    <div id="wrapper">
        <!-- start header -->
        <header>
            <div class="navbar navbar-default navbar-static-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                            </span>
                        </button>
                        <a class="navbar-brand" href="Default.aspx">
                            <img class="img-responsive" src="img/Logo.png" title="Immobiliare Doroteni" alt="Immobiliare Doroteni" /></a>
                    </div>
                    <div class="navbar-collapse collapse ">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="Default.aspx">Home</a></li>
                            <li><a href="Agenzia.aspx">L'Agenzia</a></li>
                            <li><a href="Immobili.aspx">Immobili</a></li>
                            <li><a href="NuoveCostruzioni.aspx">Nuove Costruzioni</a></li>
                            <li><a href="Contatti.aspx">Contatti</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <!-- end header -->
        <section id="featured">
            <!-- start slider -->
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="pgwSlider" id="annuncievidenza">
                            <script id="evidenzaTmpl" type="text/x-jsrender">
                            <li><a href="SchedaImmobile.aspx?Codice={{:Codice}}" >
                                <img src="{{:Path}}" alt="{{:Tipologia}} in {{:Contratto}} - € {{:Prezzo}}" data-description="{{:DescrizioneBreve}}" />
                                 <span>{{:Tipologia}} in {{:Contratto}} - {{:Prezzo}} </span>
                                 </a>
                            </li>
                            </script>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <section class="callaction">
            <div class="container">
                <div class="row nomargin">
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <h4>
                            <i class="icon-search"></i>Ricerca immobile</h4>
                    </div>
                    <div class="col-lg-3 col-md-4 col-xs-6">
                        <div class="form-group">
                            <label for="codice">
                                Codice</label>
                            <input type="text" class="form-control" id="codice">
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-xs-6">
                        <div class="form-group">
                            <label for="contratto">
                                Contratto</label>
                            <select class="form-control" id="contratto">
                                <option value="Tutte">Tutte le tipologie</option>
                                <option value="Vendita">Vendita</option>
                                <option value="Vendita a riscatto">Vendita a riscatto</option>
                                <option value="Affitto">Affitto</option>

                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-xs-6">
                        <div class="form-group">
                            <label for="provincie">
                                Provincia</label>
                            <select class="form-control" id="provincie">
                            </select>
                            <script id="provTmpl" type="text/x-jsrender">
                                 <option value="{{:Sigla}}">{{:Provincia}}</option>
                            </script>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-xs-6">
                        <div class="form-group">
                            <label for="comuni">
                                Comune</label>
                            <select class="form-control" id="comuni">
                            </select>
                            <script id="comTmpl" type="text/x-jsrender">
                                <option value="{{:Id}}">{{:Comune}}</option>
                            </script>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-xs-6">
                        <div class="form-group">
                            <label for="tipologia">
                                Tipologia immobile</label>
                            <select class="form-control" id="tipologia">
                                <option>Tutti</option>
                                <option>Appartamento</option>
                                <option>Casa Indipendente</option>
                                <option>Villa</option>
                                <option>Villetta a schiera</option>
                                <option>Negozio</option>
                                <option>Ufficio</option>
                                <option>Capannone/Magazzino</option>
                                <option>Box</option>
                                <option>Terreno Agricolo</option>
                                <option>Terreno Edificabile</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-xs-6">
                        <div class="form-group">
                            <label for="prezzo">
                                Prezzo</label>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                    <%--<input type="text" class="form-control" id="prezzo" placeholder="da">--%>
                                    <input type="number" id="prezzo" class="form-control" placeholder="da" min="0" max="1000000"
                                        step="5000">
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                    <input type="number" id="prezzo2" class="form-control" placeholder="a" min="0" max="1000000"
                                        step="5000">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-xs-6">
                        <div class="form-group">
                            <label for="camere">
                                Vani
                            </label>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                    <input type="number" id="camere" class="form-control" placeholder="da" min="0" max="100"
                                        step="1">
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                    <input type="number" id="camere2" class="form-control" placeholder="a" min="0" max="100"
                                        step="1">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-xs-6">
                        <div class="form-group">
                            <label for="mq">
                                Dimensioni Mq</label>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                    <input type="number" id="mq" class="form-control" placeholder="da" min="0" max="100000"
                                        step="5">
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-6">
                                    <input type="number" id="mq2" class="form-control" placeholder="a" min="0" max="1000000"
                                        step="5">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <button type="submit" class="btn btn-primary" id="ricerca" style="float: right">
                            Ricerca</button>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h4 class="headinglink" id="nuoviimmobili">Nuovi Immobili</h4>
                        <h4 class="heading">
                            Ultime Proposte</h4>
                        <div class="owl-carousel" id="ultimiannunci">
                            <script id="annunciTmpl" type="text/x-jsrender">
                            <div class="item">
                                <div class="thumbcase">
                                    <div class="thumbnail">
                                       <figure>      
                                            <img src="{{:Thumbnail}}" alt="">
                                            <figcaption>{{:Contratto}}</figcaption>
                                       </figure>
                                    </div>
                                    <h5 class="caption">
                                        {{:Tipologia}}
                                    </h5>
                                    <ul class="box_text">
                                        <li><span class="left">Codice: </span><span class="right">{{:Codice}}</span></li>
                                        <li><span class="left">Comune: </span><span class="right">{{:Comune}}</span></li>
                                        <li><span class="left">Stato: </span><span class="right">{{:Stato}}</span></li>
                                        <li><span class="left">Mq: </span><span class="right">{{:Mq}}</span></li>
                                        <li><span class="left">Vani: </span><span class="right">{{:Camere}}</span></li>
                                        <li><span class="left">Bagni: </span><span class="right">{{:Bagni}}</span></li>
                                        <li><span class="left">Prezzo: </span><span class="right">{{:Prezzo}}</span></li>
                                    </ul>
                                    <div class="details">
                                    <a class="more-details" href="SchedaImmobile.aspx?Codice={{:Codice}}">Visualizza dettagli<i class="fa fa-caret-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            </script>
                        </div>
                        <!-- /.col-xs-12 -->
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <!-- Portfolio Projects -->
                <div class="row">
                    <div class="col-lg-12">
                        <h4 class="heading">
                            Collaborazioni</h4>
                        <div class="owl-carousel-little" id="collaborazioni">
                        </div>
                        <script id="collTmpl" type="text/x-jsrender">
                            <div class="item">
                                <div class="thumbcase">
                                    <div class="thumbnail">
                                       <figure>      
                                            <img src="{{:Thumbnail}}" alt="">
                                            <figcaption>{{:Descrizione}}</figcaption>
                                       </figure>
                                    </div>
                                </div>
                            </div>
                        </script>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <!-- Portfolio Projects -->
                <div class="row">
                    <div class="col-lg-12">
                        <h4 class="heading">
                            L'agenzia</h4>
                        <div class="row">
                            <section id="projects">
                                <ul id="thumbs" class="portfolio">
                                    <!-- Item Project and Filter Name -->
                                    <li class="col-lg-3 col-md-3 col-xs-6 design" data-id="id-0" data-type="web">
                                        <div class="item-thumbs">
                                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                                                href="img/agenzia/agenzia1.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                                                </span></a>
                                            <!-- Thumb Image and Description -->
                                            <img src="img/agenzia/agenzia1.jpg" alt="Immobiliare Doroteni" />
                                        </div>
                                    </li>
                                    <!-- End Item Project -->
                                    <!-- Item Project and Filter Name -->
                                    <li class="item-thumbs col-lg-3 col-md-3 col-xs-6  design" data-id="id-1" data-type="icon">
                                        <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                        <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                                            href="img/agenzia/agenzia2.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                                            </span></a>
                                        <!-- Thumb Image and Description -->
                                        <img src="img/agenzia/agenzia2.jpg" alt="Immobiliare Doroteni">
                                    </li>
                                    <!-- End Item Project -->
                                    <!-- Item Project and Filter Name -->
                                    <li class="item-thumbs col-lg-3 col-md-3 col-xs-6  photography" data-id="id-2" data-type="illustrator">
                                        <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                        <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                                            href="img/agenzia/agenzia3.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                                            </span></a>
                                        <!-- Thumb Image and Description -->
                                        <img src="img/agenzia/agenzia3.jpg" alt="Immobiliare Doroteni">
                                    </li>
                                    <!-- End Item Project -->
                                    <!-- Item Project and Filter Name -->
                                    <li class="item-thumbs col-lg-3 col-md-3 col-xs-6  photography" data-id="id-2" data-type="illustrator">
                                        <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                        <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Immobiliare Doroteni"
                                            href="img/agenzia/agenzia4.jpg"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus">
                                            </span></a>
                                        <!-- Thumb Image and Description -->
                                        <img src="img/agenzia/agenzia4.jpg" alt="Immobiliare Doroteni">
                                    </li>
                                    <!-- End Item Project -->
                                </ul>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div id="sub-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="copyright">
                                <p>
                                    <span>&copy; Immobiliare Doroteni di Silvia Doroteni - P.IVA 02584740027 - 2015 All
                                        right reserved.</span><a href="Admin/Login.aspx"><span> Admin </span></a>
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <ul class="social-network">
                                <li><a href="https://www.facebook.com/immobiliaredoroteni?fref=ts" data-placement="top"
                                    title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus">
                                </i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
    <!-- javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="js/jquery.fancybox-media.js"></script>
    <script type="text/javascript" src="js/google-code-prettify/prettify.js"></script>
    <script type="text/javascript" src="js/portfolio/jquery.quicksand.js"></script>
    <script type="text/javascript" src="js/portfolio/setting.js"></script>
    <script type="text/javascript" src="owlcarousel/owl.carousel.js"></script>
    <script type="text/javascript" src="js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="js/pgwslider/pgwslider.js"></script>
    <script type="text/javascript" src="js/animate.js"></script>
    <script type="text/javascript" src="js/jsviews.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
    <script type="text/javascript" src="js/jquery.numeric.js"></script>
    <script type="text/javascript" src="js/App.js"></script>
    </form>
</body>
</html>
