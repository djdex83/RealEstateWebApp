var urlAnnuncio = "Admin/WebServiceSite.asmx/GetTuttiAnnunciPubblici";
var array = [];
var affitti = true;
var vendite = true;

function SortByPrezzo(a, b){
  var aPrezzo = a.Prezzo;
  var bPrezzo = b.Prezzo; 
  return ((aPrezzo < bPrezzo) ? -1 : ((aPrezzo > bPrezzo) ? 1 : 0));
}

function ManageFiltri(myObj) {
    $("#listafiltriusati").empty();
    var filtriarray = [];

    $.each(myObj, function (i, obj) {
        if (obj != "" && obj != "_")
            filtriarray.push(new FiltroUsato(i, obj));
    });
    RenderItem(filtriarray, "#filtriusatiTmpl", "#listafiltriusati");
}

$(document).ready(function () {
    'use strict';
    $("#mq").numeric();
    $("#mq2").numeric();
    $("#camere").numeric();
    $("#camere2").numeric();
    $("#prezzo").numeric();
    $("#prezzo2").numeric();
    $("#filtri").hide();
    $("#loader").show();
    GetProvincie();
    var checkedaffitti = false;
    var checkedvendite = false;
    var checkedvenditeariscatto = false;

    if (window.location.search !== "") {
        var myObj = $.deparam.querystring();
        ManageFiltri(myObj);
        var filtrocontratto = getParameterByName('Contratto');
        if (filtrocontratto === "Tutte") {
            GetSearch(true, true, true);
        } else {
            GetSearch(null, null, null);
        }
    } else {
        GetAnnunci(null,null,null);
    }
   
    $("#affitti").click(function () {
        if ($("#affitti").is(':checked')) {
            checkedaffitti = true;
        } else {
            checkedaffitti = false;
        }
        if ($("#vendite").is(':checked')) {
            checkedvendite = true;
        } else {
            checkedvendite = false;
        }
        if ($("#venditeariscatto").is(':checked')) {
            checkedvenditeariscatto = true;
        } else {
            checkedvenditeariscatto = false;
        }
        $("#noimmobili").html("");
        $("#immobili").empty();
        $("#loader2").show();
        if (window.location.search !== "") {
            GetSearch(checkedaffitti, checkedvendite, checkedvenditeariscatto);
        } else {
            GetAnnunci(checkedaffitti, checkedvendite, checkedvenditeariscatto);
        }
    });
    $("#vendite").click(function () {
        if ($("#affitti").is(':checked')) {
            checkedaffitti = true;
        } else {
            checkedaffitti = false;
        }
        if ($("#vendite").is(':checked')) {
            checkedvendite = true;
        } else {
            checkedvendite = false;
        }
        if ($("#venditeariscatto").is(':checked')) {
            checkedvenditeariscatto = true;
        } else {
            checkedvenditeariscatto = false;
        }
        $("#noimmobili").html("");
        $("#immobili").empty();
        $("#loader2").show();
        if (window.location.search !== "") {
            GetSearch(checkedaffitti, checkedvendite, checkedvenditeariscatto);
        } else {
            GetAnnunci(checkedaffitti, checkedvendite, checkedvenditeariscatto);
        }
    });
    $("#venditeariscatto").click(function () {
        if ($("#affitti").is(':checked')) {
            checkedaffitti = true;
        } else {
            checkedaffitti = false;
        }
        if ($("#vendite").is(':checked')) {
            checkedvendite = true;
        } else {
            checkedvendite = false;
        }
        if ($("#venditeariscatto").is(':checked')) {
            checkedvenditeariscatto = true;
        } else {
            checkedvenditeariscatto = false;
        }
        $("#noimmobili").html("");
        $("#immobili").empty();
        $("#loader2").show();
        if (window.location.search !== "") {
            GetSearch(checkedaffitti, checkedvendite, checkedvenditeariscatto);
        } else {
            GetAnnunci(checkedaffitti, checkedvendite, checkedvenditeariscatto);
        }
    });




   

    $("#ricerca").click(function (e) {
        $("#loader").show();
        e.preventDefault();
        $("#noimmobili").html("");
        $("#immobili").html("");
        $(".pagination").empty();
        GetValue();
    });

    $("#ordinamentoannunci").bind("change", function () {
        var valore = $(this).val();
        var $wrapper = $('#immobili');
        if (valore === "p1") {
            $wrapper.find('.item').sort(function (a, b) {
                return +a.dataset.prezzo - +b.dataset.prezzo;
            }).appendTo($wrapper);
        }
        if (valore === "p2") {
            $wrapper.find('.item').sort(function (a, b) {
                return +b.dataset.prezzo - +a.dataset.prezzo;
            }).appendTo($wrapper);
        }
        if (valore === "d2") {
            $wrapper.find('.item').sort(function (a, b) {
                return +a.dataset.dimensioni - +b.dataset.dimensioni;
            }).appendTo($wrapper);
        }
        if (valore === "d1") {
            $wrapper.find('.item').sort(function (a, b) {
                return +b.dataset.dimensioni - +a.dataset.dimensioni;
            }).appendTo($wrapper);
        }
        if (valore === "i1") {
            $wrapper.find('.item').sort(function (a, b) {
                return +a.dataset.id - +b.dataset.id;
            }).appendTo($wrapper);
        }
        if (valore === "i2") {
            $wrapper.find('.item').sort(function (a, b) {
                return +b.dataset.id - +a.dataset.id;
            }).appendTo($wrapper);
        }
    });

});




function sortHighscore() {
    $.tinysort.defaults.order = 'desc';

    var $Ul = $('ul#immobili');

//    $Ul.css({
//        position: 'relative',
//        height: $Ul.height(),
//        display: 'block'
//    });

    var iLnH;
    var $Li = $('ul#immobili>li');
    $Li.tsort({
        sortFunction: function (a, b) {
            console.log(a, b);
            var aNum = a.Prezzo;
            var bNum = b.e.text().split(' ')[1];

            return bNum - aNum;
        }
    }).each(function (i, el) {
        var $El = $(el);
        var iFr = $.data(el, 'h');
        var iTo = i * iLnH;

    });
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function GetValue() {
    var contratto = "", provincia = "", comune = "", tipologia = "";
    var arraycontratto = new Array();
    var _istutticontratti = false;
    var strFilter = "";
    var stringaprezzo = "";
    var stringacamere = "";
    var stringamq = "";
    var codice = $("#codice").val();
    if ($("#contratto option:selected").val() !== "-1") {
        contratto = $("#contratto option:selected").text();
        if (contratto != "Tutte le tipologie") {
            arraycontratto.push(contratto);
            strFilter += "Contratto="+contratto+"&";
        } else {
            contratto = "Tutte";
            _istutticontratti = true;
            strFilter += "Contratto="+contratto+"&";
        }
    }
    if ($("#provincie option:selected").val() !== "-1") {
        provincia = $("#provincie option:selected").text();
        strFilter += "Provincia="+provincia+"&";
    }
    if ($("#comuni option:selected").val() !== "-1") {
        comune = $("#comuni option:selected").text();
        strFilter += "Comune="+comune+"&";
    }
    if ($("#tipologia option:selected").val() !== "-1") {
        tipologia = $("#tipologia option:selected").text();
        strFilter += "Tipologia="+tipologia+"&";
    }
    var prezzo = $("#prezzo").val();
    if (prezzo !== "") {
        strFilter += "Prezzo da=" + prezzo + "&";
        stringaprezzo += prezzo + "_";
    }
    var prezzo2 = $("#prezzo2").val();
    if (prezzo2 !== "") {
        strFilter += "Prezzo a=" + prezzo2 + "&";
        stringaprezzo +=prezzo2;
        
    }
    var camere = $("#camere").val();
    if (camere !== "") {
        strFilter += "Camere da=" + camere + "&";
        stringacamere +=  camere + "_";
    }
    var camere2 = $("#camere2").val();
    if (camere2 !== "") {
        strFilter += "Camere a=" + camere2 + "&";
        stringacamere += camere2 ;
    }
    var mq = $("#mq").val();
    if (mq !== "") {
        strFilter += "Mq da=" + mq + "&";
        stringamq +=  mq+"_";
    }
    var mq2 = $("#mq2").val();
    if (mq2 !== "") {
        strFilter += "Mq a=" + mq2 + "&";
        stringamq += mq2;
    }
    var myObj = $.deparam(strFilter);
    ManageFiltri(myObj);
    var jsonText = JSON.stringify({ Codice: codice, Contratto: arraycontratto, Tipologia: tipologia, Comune: comune, Provincia: provincia, Prezzo: stringaprezzo, Camere: stringacamere, Mq: stringamq, TuttiContratti: _istutticontratti });
    $.ajax({
        url: "Admin/WebServiceSite.asmx/GetAnnuncioBySearch",
        dataType: "json",
        type: "POST",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            var affitti;
            var vendite;
            var venditeariscatto;
            if (contratto === "" || contratto==="Tutte") {
                 affitti = true;
                 vendite = true;
                 venditeariscatto = true;
            }
            if (contratto === "Vendita") {
                 affitti = false;
                 vendite = true;
                 venditeariscatto = false;
            }
            if (contratto === "Vendita a riscatto") {
                affitti = false;
                vendite = false;
                venditeariscatto = true;
            }
            if (contratto === "Affitto") {
                 affitti = true;
                 vendite = false;
                 venditeariscatto = false;
            }
            $('#vendite').prop('checked', vendite);
            $('#affitti').prop('checked', affitti);
            $('#venditeariscatto').prop('checked', venditeariscatto);
            array.length = 0;
            $.each(results.d, function (i, obj) {
                array.push(new Annuncio(obj.idImmobile, obj.Codice, obj.Prezzo, obj.Tipologia, obj.Stato, obj.Provincia, obj.Comune, obj.Mq, obj.Bagni, obj.Box, obj.Camere, obj.Locali, obj.Contratto, obj.DescrizioneBreve, obj.Thumbnail,obj.BoxDoppio, obj.MqTerreno, obj.PostoAuto));
            });
            if (array.length > 0) {
                RenderItem(array, "#immobiliTmpl", "#immobili");
                $("#numeroannunci").html(array.length);
                $(".pagination").jPages({
                    containerID: "immobili",
                    first: false,
                    previous: 'Previous',
                    next: 'Next',
                    last: false,
                    perPage: 10,
                    startRange: 1,
                    midRange: 5,
                    endRange: 1,
                    delay: 0,
                    minHeight: false,
                    callback: function (pages, items) {
                        bootstrapPagination($('.pagination'));
                    }
                });
            } else {
                $("#loader").hide();
                $("#noimmobili").html("Nessun immobile trovato con i criteri inseriti");
            }
        }
    });
}


function GetSearch(_iscontrattoaffitti,_iscontrattovendite,_iscontrattovenditeariscatto) {

    var contratto = null;
    var _istutticontratti = false;
    var arraycontratto = new Array();
    var tipologia = getParameterByName('Tipologia');
    var codice = getParameterByName('Codice');   
    if (_iscontrattoaffitti === null && _iscontrattovendite === null && _iscontrattovenditeariscatto === null) {
        contratto = getParameterByName('Contratto');
        arraycontratto.push(contratto);
    } 
    if (_iscontrattoaffitti !== null && _iscontrattoaffitti === true) {
        arraycontratto.push("Affitto");
    }
    if (_iscontrattovendite !== null && _iscontrattovendite === true) {
        arraycontratto.push("Vendita");
    }
    if (_iscontrattovenditeariscatto !== null && _iscontrattovenditeariscatto === true) {
        arraycontratto.push("Vendita a riscatto");
    }
    if (_iscontrattoaffitti === true && _iscontrattovendite === true && _iscontrattovenditeariscatto === true) {
        _istutticontratti = true;
    }

    var provincia = getParameterByName('Provincia');
    var comune = getParameterByName('Comune');
    var prezzo = getParameterByName('Prezzo');
    var camere = getParameterByName('Camere');
    var mq = getParameterByName('Mq');
    var jsonText = JSON.stringify({ Codice: codice, Contratto: arraycontratto, Tipologia: tipologia, Comune: comune, Provincia: provincia, Prezzo: prezzo, Camere: camere, Mq: mq, TuttiContratti: _istutticontratti });
    $.ajax({
        url: "Admin/WebServiceSite.asmx/GetAnnuncioBySearch",
        dataType: "json",
        type: "POST",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            var contratto = getParameterByName('Contratto');
            array = [];
            var vendite;
            var affitti;
            var venditeariscatto;
            if (contratto === "Tutte") {
                affitti = true;
                vendite = true;
                venditeariscatto = true;
            }
            if (contratto === "Vendita") {
                affitti = false;
                vendite = true;
                venditeariscatto = false;
            }
            if (contratto === "Affitto") {
                affitti = true;
                vendite = false;
                venditeariscatto = false;
            }
            if (contratto === "Vendita a riscatto") {
                affitti = false;
                vendite = false;
                venditeariscatto = true;
            }
            if (_iscontrattoaffitti !== null && _iscontrattoaffitti === true) {
                affitti = true;
            } else {
                affitti = false;
            }
            if (_iscontrattovendite !== null && _iscontrattovendite === true) {
                vendite = true;
            } else {
                vendite = false;
            }
            if (_iscontrattovenditeariscatto !== null && _iscontrattovenditeariscatto === true) {
                venditeariscatto = true;
            } else {
                venditeariscatto = false;
            }
            $('#vendite').prop('checked', vendite);
            $('#affitti').prop('checked', affitti);
            $('#venditeariscatto').prop('checked', venditeariscatto);
            if (contratto === null || contratto === "Tutte") {
                $.each(results.d, function (i, obj) {
                    array.push(new Annuncio(obj.idImmobile, obj.Codice, obj.Prezzo, obj.Tipologia, obj.Stato, obj.Provincia, obj.Comune, obj.Mq, obj.Bagni, obj.Box, obj.Camere, obj.Locali, obj.Contratto, obj.DescrizioneBreve, obj.Thumbnail, obj.BoxDoppio, obj.MqTerreno, obj.PostoAuto));
                });
            } else {
                $.each(results.d, function (i, obj) {
                    if (obj.Contratto === contratto) {
                        array.push(new Annuncio(obj.idImmobile, obj.Codice, obj.Prezzo, obj.Tipologia, obj.Stato, obj.Provincia, obj.Comune, obj.Mq, obj.Bagni, obj.Box, obj.Camere, obj.Locali, obj.Contratto, obj.DescrizioneBreve, obj.Thumbnail, obj.BoxDoppio, obj.MqTerreno, obj.PostoAuto));
                    }
                });
            }
            if (array.length > 0) {
                $("#filtri").show();
                $("#noimmobili").html("");
                $("#immobili").html("");
                $("#numeroannunci").html(array.length);
                RenderItem(array, "#immobiliTmpl", "#immobili");
                $(".pagination").jPages({
                    containerID: "immobili",
                    perPage: 10,
                    first: false,
                    previous: 'Previous',
                    next: 'Next',
                    last: false,
                    startRange: 1,
                    midRange: 5,
                    endRange: 1,
                    delay: 0,
                    minHeight: false,
                    callback: function (pages, items) {
                        bootstrapPagination($('.pagination'));
                    }
                });

            } else {
                $("#loader").hide();
                $("#loader2").hide();
                $("#noimmobili").html("Nessun immobile trovato con i criteri inseriti");
            }
        }
    });

}

function GetAnnunci(_iscontrattoaffitti, _iscontrattovendite, _iscontrattovenditeariscatto) {
    var arraycontratto = new Array();
    if (_iscontrattoaffitti === null && _iscontrattovendite === null && _iscontrattovenditeariscatto === null) {
        contratto = null;
    }
    if (_iscontrattoaffitti !== null && _iscontrattoaffitti === true) {
        arraycontratto.push("Affitto");
    }
    if (_iscontrattovendite !== null && _iscontrattovendite === true) {
        arraycontratto.push("Vendita");
    }
    if (_iscontrattovenditeariscatto !== null && _iscontrattovenditeariscatto === true) {
        arraycontratto.push("Vendita a riscatto");
    }
    $.ajax({
        url: urlAnnuncio,
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            array = [];
            if (contratto === null && _iscontrattoaffitti === null && _iscontrattovendite === null && _iscontrattovenditeariscatto === null) {
                $('#vendite').prop('checked', vendite);
                $('#affitti').prop('checked', affitti);
                $('#venditeariscatto').prop('checked', venditeariscatto);
                $.each(results.d, function (i, obj) {
                    array.push(new Annuncio(obj.idImmobile, obj.Codice, obj.Prezzo, obj.Tipologia, obj.Stato, obj.Provincia, obj.Comune, obj.Mq, obj.Bagni, obj.Box, obj.Camere, obj.Locali, obj.Contratto, obj.DescrizioneBreve, obj.Thumbnail, obj.BoxDoppio, obj.MqTerreno, obj.PostoAuto));
                });
            } else {
                $.each(results.d, function (i, obj) {
                    if (arraycontratto.length > 0) {
                        if (arraycontratto.length === 1) {
                            if (obj.Contratto === arraycontratto[0]) {
                                array.push(new Annuncio(obj.idImmobile, obj.Codice, obj.Prezzo, obj.Tipologia, obj.Stato, obj.Provincia, obj.Comune, obj.Mq, obj.Bagni, obj.Box, obj.Camere, obj.Locali, obj.Contratto, obj.DescrizioneBreve, obj.Thumbnail, obj.BoxDoppio, obj.MqTerreno, obj.PostoAuto));
                            }
                        }
                        if (arraycontratto.length === 2) {
                            if (obj.Contratto === arraycontratto[0] || obj.Contratto === arraycontratto[1]) {
                                array.push(new Annuncio(obj.idImmobile, obj.Codice, obj.Prezzo, obj.Tipologia, obj.Stato, obj.Provincia, obj.Comune, obj.Mq, obj.Bagni, obj.Box, obj.Camere, obj.Locali, obj.Contratto, obj.DescrizioneBreve, obj.Thumbnail, obj.BoxDoppio, obj.MqTerreno, obj.PostoAuto));
                            }
                        }
                        if (arraycontratto.length === 3) {
                            if (obj.Contratto === arraycontratto[0] || obj.Contratto === arraycontratto[1] || obj.Contratto === arraycontratto[2]) {
                                array.push(new Annuncio(obj.idImmobile, obj.Codice, obj.Prezzo, obj.Tipologia, obj.Stato, obj.Provincia, obj.Comune, obj.Mq, obj.Bagni, obj.Box, obj.Camere, obj.Locali, obj.Contratto, obj.DescrizioneBreve, obj.Thumbnail, obj.BoxDoppio, obj.MqTerreno, obj.PostoAuto));
                            }
                        }
                    }
                });
            }
            if (array.length > 0) {
                $("#filtri").show();
                $("#numeroannunci").html(array.length);
                RenderItem(array, "#immobiliTmpl", "#immobili");
                $(".pagination").jPages({
                    containerID: "immobili",
                    perPage: 10,
                    first: false,
                    previous: 'Previous',
                    next: 'Next',
                    last: false,
                    startRange: 1,
                    midRange: 10,
                    endRange: 1,
                    delay: 0,
                    minHeight: false,
                    callback: function (pages, items) {
                        bootstrapPagination($('.pagination'));
                    }
                });
            } else {
                $("#loader").hide();
                $("#loader2").hide();
                $("#noimmobili").html("Nessun immobile trovato con i criteri inseriti");
            }
        }
    });
}
function bootstrapPagination(element) {
    element.find('a,span').each(function () {
        if ($(this).parent('li').length) {
            $(this).parent('li').removeAttr('class');
        } else {
            $(this).wrap('<li></li>');
        }
        if ($(this).is('a')) {
            $(this).attr('href', '#');
        }
        if ($(this).is('span')) {
            $(this).parent('li').addClass('spacer');
        }
        if ($(this).hasClass('jp-current')) {
            $(this).parent('li').addClass('active');
        }
        if ($(this).hasClass('jp-disabled')) {
            $(this).parent('li').addClass('disabled');
        }
    });
}
function RenderItem(data, templateid, container) {
    var template = $.templates(templateid);
    var htmlOutput = template.render(data);
    $("#loader").hide();
    $("#loader2").hide();
    $(container).html(htmlOutput);

}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
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
            RenderItemProv(results.d, "#provTmpl", "#provincie");
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

function FotoAnnuncio(path) {
    this.Path = path;
}
function FiltroUsato(nomefiltro,valorefiltro) {
    this.nomeFiltroUsato = nomefiltro;
    this.valoreFiltroUsato = valorefiltro;
}
function Annuncio(id,codice,prezzo,tipologia,stato,provincia,comune,mq,bagni,box,camere,locali,contratto,descrizioneBreve,thumbnail,boxdoppio,mqterreno,postoauto)
{
    this.Id = id;
    this.Codice = codice;
    this.Prezzo = prezzo;
    this.Tipologia = tipologia;
    this.Stato=stato;
    this.Provincia=provincia;
    this.Comune=comune;
    this.Mq = mq;
    if (this.Mq != null) {
        this.Mq = mq + "Mq c.a.";
    } else {
        this.Mq = "N.D."
    }
    if (this.MqTerreno != null && this.MqTerreno != undefined && this.MqTerreno != "") {
        this.MqTerreno = mqterreno + "Mq di terreno";
    } else {
        this.MqTerreno = "Nessun terreno";
    }
    if(bagni>1)
        this.Bagni = bagni+" Bagni";
    else
        this.Bagni = bagni + " Bagno";
    // this.Box = box + " Garage";
    this.BoxDoppio = boxdoppio;
    this.PostoAuto = postoauto;
    box = box.toLowerCase().replace(/\b[a-z]/g, function (letter) {
        return letter.toUpperCase();
    });
    this.Box = box+" Garage";
    if (this.BoxDoppio === "Si" && this.PostoAuto === "No" && this.Box === "No") {
        this.Box = "Doppio Garage";
    }
    if (this.BoxDoppio === "Si" && this.PostoAuto === "Si" && this.Box === "No") {
        this.Box = "Doppio Garage e posto auto";
    }
    if (this.BoxDoppio === "Si" && this.PostoAuto === "No" && this.Box === "Si") {
        this.Box = "Garage e Doppio Garage";
    }
    if (this.BoxDoppio === "No" && this.PostoAuto === "Si" && this.Box === "No") {
        this.Box = "Posto auto";
    }
    if (this.BoxDoppio === "No" && this.PostoAuto === "No" && this.Box === "Si") {
        this.Box = "Si Garage";
    }
    if (this.BoxDoppio === "No" && this.PostoAuto === "No" && this.Box === "No") {
        this.Box = "No Garage";
    }
    if (this.BoxDoppio === "No" && this.PostoAuto === "Si" && this.Box === "Si") {
        this.Box = "Garage e posto auto";
    }
    if (this.Box === "null Garage") {
        this.Box = "N.D.";
    }
    if (camere > 1)
        this.Camere = camere + " Camere";
    else
        this.Camere = camere + " Camera";
    if (locali > 1)
        this.Locali = locali + " Locali";
    else
        this.Locali = locali + " Locale";
    this.Contratto=contratto;
    this.DescrizioneBreve=descrizioneBreve;
    this.Thumbnail = thumbnail;

}

