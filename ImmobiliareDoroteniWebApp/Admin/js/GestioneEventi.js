function CaricaOnLoad() {
    $(document).ready(function (e) {
        $('#dp3').datepicker();
        $('#wysihtml5').wysihtml5();
        $('#uploadify1').uploadify({
            'uploader': 'assets/lib/uplodify/uploadify.swf',
            'checkScript': 'AjaxFunctions/CheckFile.ashx',
            'script': 'AjaxFunctions/UploadFile.ashx',
            'folder': '../Foto/Eventi/',
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
                listafile = listafile + 'Foto/Eventi/' + nomefile + ";";
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
    });

}


function DeleteFieldEvento() {
    $('#refreshevento').click(function (e) {
        $('#wysihtml5').val('');
        $('#titoloevento').val('');
        $('#dataevento').val('');
    });
}

function Save() {

    $('#btnuovoevento').click(function (e) {
//        $("input,select,textarea").not("[type=submit]").jqBootstrapValidation(
//            {
//                submitSuccess: function ($form, event) {
                    e.preventDefault();
                    $('#loader').show();
                    var files = $('#listafile').val().split(';');
                    var evento = new Object();
                    var descr = $('#titoloevento').val();
                    var testo = $('#wysihtml5').val();
                    evento.titoloevento = descr;
                    evento.testoevento = testo;
                    evento.dataevento = $('#dataevento').val();
                    evento.fotoevento = files[0];
                    var jsonText = JSON.stringify({ evento: evento });
                    $.ajax({
                        url: "WebServiceAdmin.asmx/SaveEvento",
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
                            $('#titoloevento').val('');
                            $('#dataevento').val('');
                        }
                    });
//                }
//            });
    });
}

