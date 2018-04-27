function CaricaOnLoad() {
    AttivaUplodify();
    Save();
}

function AttivaUplodify() {
    $('#uploadify1').uploadify({
        'uploader': 'assets/lib/uplodify/uploadify.swf',
        'checkScript': 'AjaxFunctions/CheckFile.ashx',
        'script': 'AjaxFunctions/UploadFile.ashx',
        'folder': '../img/collaborazioni/',
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

    $('#btnuovaCollaborazione').click(function (e) {
        e.preventDefault();
        $('#loader').show();
        var files = $('#listafile').val().split(';')[0];
        var Collaborazione = new Object();
        Collaborazione.Path = files;
        var DescrizioneBreve = $('#descrizione').val();
        Collaborazione.Descrizione = DescrizioneBreve;
        var jsonText = JSON.stringify({ collaborazione: Collaborazione });
        $.ajax({
            url: "WebServiceSite.asmx/SaveNuovaCollaborazione",
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
                $('#uploadify1Queue').empty();
                $('input[type="text"]').val("");
                $('#listafoto').empty();
            }
        });

    });
}
