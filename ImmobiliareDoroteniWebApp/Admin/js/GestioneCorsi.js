function CaricaOnLoad() {
        $('#dp3').datepicker();
        $('#wysihtml5').wysihtml5();
        $("#seltipo").change(function () {
            var tipo = $(this).val();
            var gal;
            if (tipo == '2999') gal = "Workshop";
            if (tipo == '3999') gal = "Corsi";
            if (tipo != '-1') {
                
                $('#uploadify1').uploadify({
                    'uploader': 'assets/lib/uplodify/uploadify.swf',
                    'checkScript': 'AjaxFunctions/CheckFile.ashx',
                    'script': 'AjaxFunctions/UploadFile.ashx',
                    'folder': '../Foto/' + gal + '/',
                    'queueSizeLimit': 1,
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
                        listafile = listafile + 'Foto/' + gal + '/' + nomefile + ";";
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
            } else {
                alert("Seleziona tipo: Corso o Workshop");
            }
        });

}


function DeleteFieldCorso() {
    $('#refreshCorso').click(function (e) {
        $('#wysihtml5').val('');
        $('#titoloCorso').val('');
        $('#dataCorso').val('');
    });
}

function Save() {

    $('#btnuovoCorso').click(function (e) {
//        $("input,select,textarea").not("[type=submit]").jqBootstrapValidation(
//            {
//                submitSuccess: function ($form, event) {
                    e.preventDefault();
                    $('#loader').show();
                    var files = $('#listafile').val().split(';');
                    var Corso = new Object();
                    var descr = $('#titoloCorso').val();
                    var testo = $('#wysihtml5').val();
                    Corso.titoloCorso = descr;
                    Corso.testoCorso = testo;
                    Corso.dataCorso = $('#dataCorso').val();
                    Corso.tipo = $("#seltipo").val();
                    Corso.fotoCorso = files[0];
                    var jsonText = JSON.stringify({ corso: Corso });
                    $.ajax({
                        url: "WebServiceAdmin.asmx/SaveCorso",
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
                            $('#msgdone').delay(1000).fadeOut(700);
                            $('#wysihtml5').val('');
                            $('#titoloCorso').val('');
                            $('#dataCorso').val('');
                        }
                    });
//                }
//            });
    });
}

function GetGallerie() {
    $.ajax({
        url: "WebServiceAdmin.asmx/GetGallerieFoto",
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            OnCompleteGallerie(results.d);

        }
    });
}

function OnCompleteGallerie(results) {
    $("#selgal").empty();
    $("#gallerietmpl").tmpl(results).appendTo("#selgal");
    $("#selgal").append($("<option></option>")
         .attr("value", "-1")
         .attr('selected', 'selected')
         .text("Seleziona Galleria"));

};
