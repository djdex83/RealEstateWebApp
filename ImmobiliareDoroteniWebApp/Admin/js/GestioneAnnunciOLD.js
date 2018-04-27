function CaricaOnLoad() {
    $('#wysihtml5').wysihtml5();
    AttivaUplodify();
    GetLastCode();
    GetProvincie();
    Save();
}

function AttivaUplodify() {
    var codice=$("#codice").val();
    $('#uploadify1').uploadify({
        'uploader': 'assets/lib/uplodify/uploadify.swf',
        'checkScript': 'AjaxFunctions/CheckFile.ashx',
        'script': 'AjaxFunctions/UploadFile.ashx',
        'folder': '../Foto/',
        'queueSizeLimit': 1000,
        'removeCompleted': false,
        'cancelImg': 'assets/lib/uplodify/cancel.png',
        'multi': true,
        'fileDesc': 'File immagine',
        'fileExt': '*.jpg;*.gif;*.png;',
        'sizeLimit': '4194304',
        'auto': true,
        'onComplete': function (event, ID, fileObj, response, data) {
            var prova = response;
            var nomefile = prova.split("\"")[1];
            var listafile = $("#listafile").val();
            listafile = listafile +'/' + nomefile + ";";
            $("#listafile").val(listafile);
        },
        'onError': function () {
            $("#esito").text("Caricamento file NON RIUSCITO");
        },
        'onInit': function () {
            $("#esito").empty();
        },
        'onSelect': function () {
            $("#esito").empty();
        }
    });
}

function Save() {

    $('#btnuovoAnnuncio').click(function (e) {
        e.preventDefault();
        $('#loader').show();
        var files = $('#listafile').val().split(';');
        var Annuncio = new Object();
        var FotoAnnuncio = new Object();
        Annuncio.Tipologia = $("#tipologia").val();
        Annuncio.Codice = $("#codice").val();
        Annuncio.Provincia = $("#provincia option:selected").text();
        Annuncio.Comune = $("#comune option:selected").text();
        Annuncio.Contratto = $("#contratto").val();
        Annuncio.Stato = $('#stato').val();
        Annuncio.Zona = $("#zona").val();
        Annuncio.Mq = $("#mq").val();
        Annuncio.Camere = $("#camere").val();
        Annuncio.Locali = $("#locali").val();
        Annuncio.Box = $("#box").val();
        if ($("#riscaldamento").val() != "-1") {
            Annuncio.Riscaldamento = $("#riscaldamento").val();
        }
        Annuncio.Piano = $("#piano").val();
        Annuncio.Ascensore = $("#ascensore").val();
        Annuncio.ClasseEnergetica = $("#classeenergetica").val();
        Annuncio.Bagni = $("#bagni").val();
        Annuncio.Prezzo = $("#prezzo").val();
        Annuncio.AnnuncioPubblico = $('#pubblico').prop('checked');
        var DescrizioneBreve = $('#descbreve').val();
        var Descizioneestesa = $('#wysihtml5').val();
        Annuncio.Descrizione = Descizioneestesa;
        Annuncio.DescrizioneBreve = DescrizioneBreve;
        var jsonText = JSON.stringify({ immobile: Annuncio });
        $.ajax({
            url: "WebServiceSite.asmx/SaveNuovoAnnuncioImmobile",
            dataType: "json",
            type: "POST",
            data: jsonText,
            contentType: "application/json; charset=utf-8",
            error: function (err) {
                alert("Error:" + err.responseText);
            },
            success: function (results) {
                var fotos = new Object();
                fotos.fotos = new Array();
                $.each(files, function (index, value) {
                    var foto = new Object();
                    var descr = $("#tipologia").val() + " - " + $("#prezzo").val() + " - " + $("#codice").val();
                    foto.CodiceImmobile = $("#codice").val();
                    foto.Descrizione = descr;
                    if (index == 0) {
                        foto.Copertina = 1;
                    } else {
                        foto.Copertina = 0;
                    }
                    foto.Path = value;
                    fotos.fotos[index] = foto;
                });
                var jsonText = JSON.stringify(fotos);
                $.ajax({
                    url: "WebServiceSite.asmx/SaveFoto",
                    dataType: "json",
                    type: "POST",
                    data: jsonText,
                    contentType: "application/json; charset=utf-8",
                    error: function (err) {
                        alert("Error:" + err.responseText);
                    },
                    success: function (results) {
                        $('#loader').hide();
                        $('#msgdone').delay(500).fadeIn(700);
                        $("#listafile").val('');
                        $('#msgdone').delay(1000).fadeOut(700);
                        //Pulire tutti i campi
                        $('iframe').contents().find('body').html("");
                        $('#uploadify1Queue').empty();
                        $('input[type="text"]').val("");
                        $("#pubblico").prop('checked', false);
                        $("#evidenza").prop('checked', false);
                        $('#listafoto').empty();
                        $("select.form-control").val($("select.form-control option:first").val());
                    }
                });
            }
        });

    });
}

function GetProvincie() {
    $.ajax({
        url: "WebServiceSite.asmx/GetProvincie",
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            OnCompleteComboProvincie("provincia", "provinciatmpl", results.d, "Provincia");
        }
    });
}

function GetComuni(sigla) {
    var jsonText = JSON.stringify({ sigla: sigla });
    $.ajax({
        url: "WebServiceSite.asmx/GetComuni",
        dataType: "json",
        type: "POST",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            OnCompleteCombo("comune", "comunetmpl", results.d, "Comune");
        }
    });
}

function OnCompleteComboProvincie(id,tmpl,results,scelta) {
    $("#"+id).empty();
    $("#"+tmpl).tmpl(results).appendTo("#"+id);
    $("#"+id).append($("<option></option>")
         .attr("value", "-1")
         .attr('selected', 'selected')
         .text("Seleziona " + scelta));
    $("#" + id).bind("change", function () { GetComuni($("#"+id+" option:selected").val()); });
}

function GetLastCode() {
    $("#contratto").bind("change", function () {
        var contratto = $(this).val();
        var jsonText = JSON.stringify({ typecontratto: contratto });
        $.ajax({
            url: "WebServiceSite.asmx/GetLastCode",
            dataType: "json",
            type: "POST",
            data: jsonText,
            contentType: "application/json; charset=utf-8",
            error: function (err) {
                alert("Error:" + err.responseText);
            },
            success: function (results) {
                var code = results.d;
                /*V000000*/
                var val = code.substring(0, 1);
                code = code.substring(1, 7);
                code = parseInt(code);
                code = parseInt(code + 1);
                var numberint = getlength(code);
                var total = parseInt(6 - numberint);
                var zero="";
                for (i = 0; i < total; i++) {
                    zero += "0";
                }
                code = val+zero + code.toString();
                $("#codice").val(code);
            }
        });
    });
}

function getlength(number) {
    return number.toString().length;
}
function OnCompleteCombo(id, tmpl, results, scelta) {
    $("#" + id).empty();
    $("#" + tmpl).tmpl(results).appendTo("#" + id);
    $("#" + id).append($("<option></option>")
         .attr("value", "-1")
         .attr('selected', 'selected')
         .text("Seleziona " + scelta));
}