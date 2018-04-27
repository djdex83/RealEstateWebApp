var listaAnnunci = [];
var urlAnnunci = "Admin/WebServiceSite.asmx/GetLast10Annunci";
var urlEvidenza = "Admin/WebServiceSite.asmx/GetEvidenzaAnnunci";
var urlCollaborazioni = "Admin/WebServiceSite.asmx/Get10Collaborazioni";
/*global jQuery:false */
$(window).load(function () {
    "use strict";
    /*
    Loader
    */
    $(".loader-img").delay(1500).fadeOut();
    $(".loader").delay(1500).fadeOut("slow");

    GetAnnunci();
    GetEvidenza();
    GetProvincie();
    GetCollaborazioni();
    $("#ricerca").click(function (e) {
        e.preventDefault();
        var search = GetValue();
        window.location = "Immobili.aspx" + search;
    });
    $("#nuoviimmobili").click(function (e) {
        e.preventDefault();
        window.location = "NuoveCostruzioni.aspx";
    });
});

$(document).ready(function () {
    "use strict";
    $("#mq").numeric();
    $("#mq2").numeric();
    $("#camere").numeric();
    $("#camere2").numeric();
    $("#prezzo").numeric();
    $("#prezzo2").numeric();
//    GetAnnunci();
//    GetEvidenza();
//    GetProvincie();
});

function GetValue() {
    var contratto = "", provincia = "", comune = "", tipologia = "";
    var codice = $("#codice").val();
    if ($("#contratto option:selected").val() !=="-1") {
        contratto = $("#contratto option:selected").val();
    }
    if ($("#provincie option:selected").val() !=="-1") {
        provincia = $("#provincie option:selected").text();
    }
    if ($("#comuni option:selected").val() !=="-1") {
        comune = $("#comuni option:selected").text();
    }
    if ($("#tipologia option:selected").val() !=="-1") {
        tipologia = $("#tipologia option:selected").text();
    }

    var prezzo = $("#prezzo").val();
    var prezzo2 = $("#prezzo2").val();
    var camere = $("#camere").val();
    var camere2 = $("#camere2").val();
    var mq = $("#mq").val();
    var mq2 = $("#mq2").val();

    var stringquery = "?Codice=" + codice + "&Contratto=" + contratto + "&Tipologia=" + tipologia + "&Provincia=" + provincia + "&Comune=" + comune + "&Prezzo=" + prezzo+"_"+prezzo2+"&Camere="+camere+"_"+camere2+"&Mq="+mq+"_"+mq2;
    return stringquery;
}
function GetAnnunci() {
    $.ajax({
        url: urlAnnunci,
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            var array = [];
            $.each(results.d, function (i, obj) {
                array.push(new Annuncio(obj.Codice, obj.Tipologia, obj.Contratto, obj.Stato,obj.DescrizioneBreve, obj.Comune, obj.Bagni, obj.Camere, obj.Mq, obj.Thumbnail, obj.Prezzo));
            });
            RenderItemCarousel(array, "#annunciTmpl", "#ultimiannunci");
        }
    });
}
function GetCollaborazioni() {
    $.ajax({
        url: urlCollaborazioni,
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            var array = [];
            $.each(results.d, function (i, obj) {
                array.push(new Collaborazione(obj.Id, obj.Path, obj.Descrizione));
            });
            RenderItemCarouselLittle(array, "#collTmpl", "#collaborazioni");
        }
    });
}
function GetEvidenza() {
    $.ajax({
        url: urlEvidenza,
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            var array = [];
            $.each(results.d, function (i, obj) {
                array.push(new Evidenza(obj.Codice, obj.Tipologia, obj.Contratto, obj.Thumbnail, obj.Prezzo,obj.DescrizioneBreve));
            });
            RenderItemSlider(array, "#evidenzaTmpl", "#annuncievidenza");
        }
    });
}
function RenderItemCarousel(data, templateid, container) {
    var template = $.templates(templateid);
    var htmlOutput = template.render(data);
    $(container).html(htmlOutput);
    $('.owl-carousel').owlCarousel({
        loop: true,
        dots: false,
        margin: 10,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                nav: true
            },
            600: {
                items: 3,
                nav: false
            },
            1000: {
                items: 5,
                nav: true,
                loop: false
            }
        }
    });
}
function RenderItemCarouselLittle(data, templateid, container) {
    var template = $.templates(templateid);
    var htmlOutput = template.render(data);
    $(container).html(htmlOutput);
    $('.owl-carousel-little').owlCarousel({
        loop: true,
        dots: false,
        margin: 10,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                nav: true
            },
            600: {
                items: 3,
                nav: false
            },
            1000: {
                items: 6,
                nav: true,
                loop: false
            }
        }
    });
}
function RenderItemSlider(data, templateid, container) {
    var template = $.templates(templateid);
    var htmlOutput = template.render(data);
    $(container).html(htmlOutput);
    $('.pgwSlider').pgwSlider({
        maxHeight: 450,
        displayControls:true
    });
}

function GetProvincie() {
    $.ajax({
        url: "Admin/WebServiceSite.asmx/GetProvincie",
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            RenderItemProv(results.d, "#provTmpl","#provincie");
        }
    });
}

function GetComuni(sigla) {
    var jsonText = JSON.stringify({ sigla: sigla });
    $.ajax({
        url: "Admin/WebServiceSite.asmx/GetComuni",
        dataType: "json",
        type: "POST",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            RenderItemCom(results.d, "#comTmpl", "#comuni");
        }
    });
}

function RenderItemProv(data, templateid, container) {
    var template = $.templates(templateid);
    var htmlOutput = template.render(data);
    $(container).html(htmlOutput);
    $(container).append($("<option></option>")
         .attr("value", "-1")
         .attr('selected', 'selected')
         .text("Seleziona Provincia"));
    $(container).bind("change", function () { GetComuni($(container + " option:selected").val()); });
}

function RenderItemCom(data, templateid, container) {
    var template = $.templates(templateid);
    var htmlOutput = template.render(data);
    $(container).html(htmlOutput);
    $(container).append($("<option></option>")
         .attr("value", "-1")
         .attr('selected', 'selected')
         .text("Seleziona Comune"));
}
function Collaborazione(Id, Path,Descrizione) {
    this.Id = Id;
    this.Descrizione = Descrizione;
    this.Path = "/img/collaborazioni/"+ Path.split('/')[2];
    this.Thumbnail = "/img/collaborazioni/resized/r_" + Path.split('/')[2];
}

function Annuncio(codice, tipologia, contratto,stato, descrizionebreve, comune, bagni, camere, mq, pathfoto, prezzo) {
    this.Codice = codice;
    this.Stato = stato;
    this.Tipologia = tipologia;
    this.Contratto = contratto;
    this.DescrizioneBreve = descrizionebreve;
    this.Comune = comune;
    this.Bagni = bagni;
    this.Camere = camere;
    this.Mq = mq;
    this.Thumbnail = pathfoto;
    if (prezzo !==0) {
        this.Prezzo = "€ " + prezzo;
    } else {
        this.Prezzo = "Tratt.Riservata";
    }
}
function Evidenza(codice, tipologia, contratto, pathfoto, prezzo,descr) {
    this.Codice = codice;
    this.Tipologia = tipologia;
    this.DescrizioneBreve = descr;
    this.Contratto = contratto;
    this.Path = pathfoto;
    if (prezzo !==0) {
        this.Prezzo = "€ " + prezzo;
    } else {
        this.Prezzo = "Tratt.Riservata";
    }
}