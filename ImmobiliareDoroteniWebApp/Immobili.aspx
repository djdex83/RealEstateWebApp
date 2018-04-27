<%@ Page Title="Immobiliare Doroteni - Immobili" Language="C#" MasterPageFile="~/Page.Master"
	AutoEventWireup="true" CodeBehind="Immobili.aspx.cs" Inherits="ImmobiliareDoroteniWebApp.Immobili" %>

<%@ Register Src="~/webcontrols/Menu.ascx" TagName="Menu" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Immobiliare Doroteni - Immobili</title>
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
	<uc:Menu runat="server" ID="Menu" MenuNode="IMMOBILI"></uc:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitlePage" runat="server">
	<h3 class="heading">
		Immobili</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderContainer" runat="server">
	<div class="row">
		<div class="col-lg-9 col-md-9 col-xs-12 realestate" id="listaimmobili">
			<img id="loader" class="loaderpage" style="display: none;" src="/img/Icon/loading.gif"
				alt="loader" />
			<div id="noimmobili">
			</div>
			<div id="filtri" >
				
					<div class="col-lg-12 item" style="padding-top:10px;padding-bottom:10px;">
						<div class="col-lg-3">
							<span class="fa fa-home"></span><span><span id="numeroannunci" style="margin-left: 5px">
							</span> annunci trovati</span>
						</div>
						<div class="col-lg-5">
								<div class="checkbox-inline">
									<label>
										<input type="checkbox" id="affitti" value="Affitti">Affitti
									</label>
								</div>
								<div class="checkbox-inline">
									<label>
										<input type="checkbox" id="vendite" value="Vendite">Vendite
									</label>
								</div>
								<div class="checkbox-inline">
									<label>
										<input type="checkbox" id="venditeariscatto" value="Vendite a riscatto">Vendite a riscatto
									</label>
								</div>
							<%-- Affitti<input type="checkbox" name="affitti" value="affitti"/>
						Vendite <input type="checkbox" name="vendite" value="vendite"/>--%>
						</div>
						<div class="col-lg-4">
							<div class="form-group">
								<select class="form-control" id="ordinamentoannunci">
									<option>Ordina annunci</option>
									<option value="p1">Prezzo:dal minore al maggiore</option>
									<option value="p2">Prezzo:dal maggiore al minore</option>
									<option value="d1">Dimensioni:dal più grande al più piccolo</option>
									<option value="d2">Dimensioni:dal più piccolo al più grande</option>
									<option value="i2">Inserimento:dal più nuovo al più vecchio</option>
									<option value="i1">Inserimento:dal più vecchio al più nuovo</option>
								</select>
							</div>
						</div>
						<div class="col-lg-12" id="listafiltriusati" >
						 </div>
						<script id="filtriusatiTmpl" type="text/x-jsrender">
							<span class="badge badge-secondary">{{:nomeFiltroUsato}}:{{:valoreFiltroUsato}}</span>
						</script>
						</div>
			</div>
			<img id="loader2" class="loaderpage" style="display: none;" src="/img/Icon/loading.gif"
				alt="loader" />
			<div id="immobili">
			</div>
			<script id="immobiliTmpl" type="text/x-jsrender">
					<div  class="col-lg-12 item" data-prezzo="{{:Prezzo}}" data-dimensioni="{{:Mq}}" data-id="{{:Id}}">
						<a href="SchedaImmobile.aspx?Codice={{:Codice}}">
							<div class="row">
							 <div class="thumbnail col-lg-4 col-md-2 col-xs-12">
								<figure>
									<img class="img-responsive" src="{{:Thumbnail}}" alt="" title="{{:DescrizioneBreve}}">
								</figure>
							</div>
							<div class="col-lg-8 col-md-10 col-xs-12">
								<h4 class="list">
									{{:Tipologia}} in {{:Contratto}} a {{:Comune}}
								</h4>
								<div class="content clearfix">
									<p>
										COD. {{:Codice}} - Prezzo € {{:Prezzo}}
									</p>
								</div>
								<div class="content clearfix">
									<p>
									   {{:DescrizioneBreve}}          
									</p>
								</div>
								<section class="property-item">
									<div class="property-meta clearfix"style="display:flex;justify-content:space-between;">
									<span  style="display:flex;justify-content:center;">
										<i class="icon-map"></i>
										<span>{{:Mq}}</span>
									</span>
									  <span  style="display:flex;justify-content:center;">
										<i class="icon-location"></i>
										<span>{{:MqTerreno}}</span>
									</span>
									<span style="display:flex;justify-content:center;" >
										<i class="icon-bed"></i>
										<span>{{:Camere}}</span>
									</span>
									<span  style="display:flex;justify-content:center;" >
										<i class="icon-bath"></i>
										<span>{{:Bagni}}</span>
									</span>
									<span  style="display:flex;justify-content:center;" >
										<i class="icon-garage"></i>
										<span>{{:Box}}</span>
									</span>
								</div>
								</section>
								<div class="details">
									<a class="more-details" href="SchedaImmobile.aspx?Codice={{:Codice}}">Visualizza dettagli<i
										class="fa fa-caret-right"></i></a>
								</div>
							</div>
						  </div>
					   </a>
					</div>
			</script>
			<div class="text-center">
				<ul class="pagination">
				</ul>
			</div>
			<div class="clear">
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-xs-12">
			<section class="lateral">
				<div class="row nomargin">
					<div class="col-lg-12 col-md-12 col-xs-12">
						<h4>
							<i class="icon-search"></i>Ricerca immobile</h4>
					</div>
					<div class="col-lg-12 col-md-12 col-xs-12">
						<div class="form-group">
							<label for="codice">
								Codice</label>
							<input type="text" class="form-control" id="codice">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-xs-12">
						<div class="form-group">
							<label for="contratto">
								Contratto</label>
							<select class="form-control" id="contratto">
								<option value="Tutte">Tutte le tipologie</option>
								<option>Vendita</option>
								<option>Affitto</option>
								<option>Vendita a riscatto</option>
							</select>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-xs-12">
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
					<div class="col-lg-12 col-md-12 col-xs-12">
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
					<div class="col-lg-12 col-md-12 col-xs-12">
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
					<div class="col-lg-12 col-md-12 col-xs-12">
						<div class="form-group">
							<label for="prezzo">
								Prezzo</label>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-xs-6">
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
					<div class="col-lg-12 col-md-12 col-xs-12">
						<div class="form-group">
							<label for="camere">
								Camere + Servizi</label>
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
					<div class="col-lg-12 col-md-12 col-xs-12">
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
			</section>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderJS" runat="server">
	<script src="js/AppImmobili.js" type="text/javascript"></script>
</asp:Content>
