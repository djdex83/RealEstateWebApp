function DeleteFieldFoto() {
    $('#deletefotobutton').click(function (e) {
        $('#selgal').val('-1');
        $('#descrizionefoto').val(''); 
    });
}

function SaveFoto() {

    $('#btcaricafoto').click(function (e) {
        e.preventDefault();
        $('#loader').show();
        var files = $('#listafile').val().split(';');
        var fotos = new Object();
        fotos.fotos = new Array();
        $.each(files, function (index, value) {
            var foto = new Object();
            var idgalleria = $("#selgal option:selected").val();
            var descr = $('#descrizionefoto').val();
            foto.descrizione = descr;
            foto.idgalleria = parseInt(idgalleria);
            foto.path = value;
            fotos.fotos[index] = foto;
        });
        var jsonText = JSON.stringify(fotos);
        $.ajax({
            url: "WebServiceAdmin.asmx/SaveFoto",
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
                $('#descrizionefoto').val('');
                $("#listafile").val('');
                $('#selgal').val('-1');
                $('#msgdone').delay(1000).fadeOut(700);
            }
        });
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

function DeleteCategoriaFoto() {
    $(".cancellacategoriafoto").click(function (e) {
        var idcat = $(this).attr("id");
        var risposta = confirm('Vuoi cancellare la categoria selezionata?');
        if (risposta) {
            var jsonText = JSON.stringify({ idcat: idcat });
            $.ajax({
                url: "AjaxFunctions/WebServiceAdmin.asmx/DeleteCategoriaFoto",
                dataType: "json",
                type: "POST",
                data: jsonText,
                contentType: "application/json; charset=utf-8",
                error: function (err) {
                    alert("Error:" + err.responseText);
                },
                success: function (results) {
                    alert("Categoria cancellata correttamente!");
                    GetCategorie();
                }
            });
        }
    });
};

function Upload(){
    $('#selgal').change(function (e) {
        $('#caricafoto').show();
        var galleriasel = $('select#selgal option:selected').text();
        AttivaUplodify(galleriasel);
    });

}


function AttivaUplodify(galleriasel) {
    $('#uploadify1').uploadify({
        'uploader': 'assets/lib/uplodify/uploadify.swf',
        'checkScript': 'AjaxFunctions/CheckFile.ashx',
        'script': 'AjaxFunctions/UploadFile.ashx',
        'folder': '../Foto/' + galleriasel + '/',
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
            listafile = listafile + galleriasel + '/' + nomefile + ";";
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