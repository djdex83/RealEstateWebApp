function CaricaOnLoad() {
    $('#wysihtml5').wysihtml5();
    $("#loadloader").show();
    AttivaUplodify();
    GetProvincie();
  
    Update();
}
var comune;

function AttivaUplodify() {
    $('#file_upload').uploadifive({
        'checkScript': 'AjaxFunctions/CheckFile.ashx',
        'uploadScript': 'AjaxFunctions/UploadFile.ashx',
        'folder': '../Foto/',
        'queueSizeLimit': 1000,
        'fileObjName': 'fileData',
        'removeCompleted': false,
        'cancelImg': 'assets/lib/uplodifive/uploadifive-cancel.png',
        'multi': true,
        'fileDesc': 'File immagine',
        'fileExt': '*.jpg;*.gif;*.png;',
        'fileSizeLimit': '4194304',
        'auto': true,
        'onUploadComplete': function (event, ID, fileObj, response, data) {
            /*var prova = response;
            var nomefile = prova.split("\"")[1];*/
            var nomefile=event.name;
            var listafile = $("#listafile").val();
            listafile = listafile +'/' + nomefile + ";";
            $("#listafile").val(listafile);
        },
        'onError': function (errorType) {
            $("#esito").text("Caricamento file NON RIUSCITO :"+errorType);
        },
        'onInit': function () {
            $("#esito").empty();
        },
        'onSelect': function () {
            $("#esito").empty();
        }
    });
}

function OnLoad() {
    var codice = getParameterByName("Codice");

    var jsonText = JSON.stringify({ Codice: codice });
    $.ajax({
        url: "WebServiceSite.asmx/GetAnnuncio",
        dataType: "json",
        type: "POST",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            var Annuncio = results.d;
            comune = Annuncio.Comune;
            $("#tipologia").val(Annuncio.Tipologia);
            $("#codice").val(Annuncio.Codice);
            $("#provincia option").each(function () {
                if ($(this).html() == Annuncio.Provincia) {
                    $(this).attr("selected", "selected");
                    GetComuni($("#provincia option:selected").val(), comune);
                    return;
                }
            });
            $("#contratto").val(Annuncio.Contratto);
            $('#stato').val(Annuncio.Stato);
            $("#zona").val(Annuncio.Zona);
            $("#mq").val(Annuncio.Mq);
            $("#mqterreno").val(Annuncio.MqTerreno);
            if (Annuncio.Box === "Si") {
                $("#box").prop('checked', true);
            } 
            if (Annuncio.BoxDoppio === "Si") {
                $("#boxdoppio").prop('checked', true);
            }
            if (Annuncio.PostoAuto === "Si") {
                $("#postoauto").prop('checked', true);
            }
            $("#camere").val(Annuncio.Camere);
            $("#locali").val(Annuncio.Locali);
            $("#box").val(Annuncio.Box);
            $("#riscaldamento").val(Annuncio.Riscaldamento);
            $("#piano").val(Annuncio.Piano);
            $("#ascensore").val(Annuncio.Ascensore);
            $("#classeenergetica").val(Annuncio.ClasseEnergetica);
            $("#bagni").val(Annuncio.Bagni);
            $("#prezzo").val(Annuncio.Prezzo);
            $("#pubblico").prop('checked', Annuncio.AnnuncioPubblico);
            $("#evidenza").prop('checked', Annuncio.AnnuncioInEvidenza);
            $("#descbreve").val(Annuncio.DescrizioneBreve);
            $('iframe').contents().find('body').html(Annuncio.Descrizione);
            var jsonText = JSON.stringify({ codice: codice });
            $.ajax({
                url: "WebServiceSite.asmx/GetFotoByAnnuncio",
                dataType: "json",
                type: "POST",
                data: jsonText,
                contentType: "application/json; charset=utf-8",
                error: function (err) {
                    alert("Error:" + err.responseText);
                },
                success: function (results) {
                    OnCompleteListaFoto(results.d);
                    $("a[rel*='prettyPhoto']").prettyPhoto({ social_tools: false });
                    DeleteFoto();
                    SetCopertina();
                    $('#listafoto .fa-edit').on('click', function () {
                        $('#editFotoModal').modal({
                            show: true
                        });
                        var id = $(this).attr('id');
                        var descrizione = $(this).attr('descrizione');
                        $("#descrizionefoto").attr("idf", id);
                        $("#descrizionefoto").val(descrizione);
                        $("#updatefoto").click(function (e) {
                            e.preventDefault();
                            SalvaModificaFoto();
                        });
                    });
                    $("#loadloader").hide();
                }
            });
        }
    });
}


function DeleteFoto() {
    $(".delete").click(function (e) {
        var idfoto = $(this).attr("id");
        var risposta = confirm('Vuoi cancellare la foto selezionata?');
        if (risposta) {
            var jsonText = JSON.stringify({ idfoto: idfoto });
            $.ajax({
                url: "WebServiceSite.asmx/DeleteFoto",
                dataType: "json",
                type: "POST",
                data: jsonText,
                contentType: "application/json; charset=utf-8",
                error: function (err) {
                    alert("Error:" + err.responseText);
                },
                success: function (results) {
                    if (results.d == true) {
                        alert("Foto cancellata correttamente!");
                        //ricaricare foto
                    }
                }
            });
        }
    });
}
function SetCopertina() {
    $(".copertina").click(function (e) {
        var idfoto = $(this).attr("id");
        var codice = $(this).attr("id-cod");
        var risposta = confirm('Vuoi impostare la foto come copertina dell\'annuncio?');
        if (risposta) {
            var jsonText = JSON.stringify({ idfoto: idfoto, codice: codice });
            $.ajax({
                url: "WebServiceSite.asmx/SetCopertina",
                dataType: "json",
                type: "POST",
                data: jsonText,
                contentType: "application/json; charset=utf-8",
                error: function (err) {
                    alert("Error:" + err.responseText);
                },
                success: function (results) {
                    if (results.d == true) {
                        alert("Aggiornamento effettuato correttamente!");
                    } else {
                        alert("Errore nell'aggiornamento!");
                    }
                }
            });
        }
    });
}
function OnCompleteListaFoto(results) {
    $("#listafoto").empty();
    $("#listafototmpl").tmpl(results).appendTo("#listafoto");
};


function Update() {

    $('#btupdateAnnuncio').click(function (e) {
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
        Annuncio.Riscaldamento = $("#riscaldamento").val();
        Annuncio.Zona = $("#zona").val();
        Annuncio.Mq = $("#mq").val();
        Annuncio.Camere = $("#camere").val();
        Annuncio.Locali = $("#locali").val();
        Annuncio.Box = $("#box").val();
        Annuncio.Piano = $("#piano").val();
        Annuncio.Ascensore = $("#ascensore").val();
        Annuncio.ClasseEnergetica = $("#classeenergetica").val();
        Annuncio.Bagni = $("#bagni").val();
        Annuncio.Prezzo = $("#prezzo").val();
        Annuncio.AnnuncioPubblico = $('#pubblico').prop('checked');
        Annuncio.AnnuncioInEvidenza = $('#evidenza').prop('checked');
        Annuncio.MqTerreno = $("#mqterreno").val();
        if ($('#box').is(':checked')) {
            Annuncio.Box = "Si";
        } else {
            Annuncio.Box = "No";
        }
        if ($('#postoauto').is(':checked')) {
            Annuncio.PostoAuto = "Si";
        } else {
            Annuncio.PostoAuto = "No";
        }
        if ($('#boxdoppio').is(':checked')) {
            Annuncio.BoxDoppio = "Si";
        } else {
            Annuncio.BoxDoppio = "No";
        }
        var DescrizioneBreve = $('#descbreve').val();
        var Descizioneestesa = $('#wysihtml5').val();
        Annuncio.Descrizione = Descizioneestesa;
        Annuncio.DescrizioneBreve = DescrizioneBreve;
        var jsonText = JSON.stringify({ immobile: Annuncio });
        $.ajax({
            url: "WebServiceSite.asmx/UpdateAnnuncio",
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
                        $('#uploadify1Queue').empty();
                        $('input[type="text"]').val("");
                        $("#pubblico").prop('checked', false);
                        $("#evidenza").prop('checked', false);
                        $('iframe').contents().find('body').html("");
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
            OnLoad();
        }
    });
}

function GetComuni(sigla,comune) {
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
            $("#comune option").each(function () {
                if ($(this).html() == comune) {
                    $(this).attr("selected", "selected");
                    return;
                }
            });
        }
    });
}

function OnCompleteComboProvincie(id,tmpl,results,scelta) {
    $("#"+id).empty();
    $("#" + tmpl).tmpl(results).appendTo("#" + id);
   
    $("#" + id).change(function () {
        GetComuni($("#" + id + " option:selected").val()); 
    });
}

function OnCompleteCombo(id, tmpl, results, scelta) {
    $("#" + id).empty();
    $("#" + tmpl).tmpl(results).appendTo("#" + id);
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function CheckField() {
}