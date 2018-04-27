var oTable;

function metisTableGallerie() {
    "use strict";
    $.ajax({
        url: "WebServiceAdmin.asmx/GetGallerieFoto",
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            var dtData = [];
            $.each(results.d, function () {
                dtData.push([
                        this.idGalleria,
                        this.NomeGalleria,
                        this.DescrizioneGalleria,
                        this.CategoriaFoto
                ]);
            });
            $(".sortableTable").tablesorter();
            oTable = $('#dataTableGallerie').dataTable({
                "sDom": "<'pull-right'l>t<'row'<'col-lg-6'f><'col-lg-6'p>>",
                "sPaginationType": "bootstrap",
                "aaData": dtData,
                "aoColumns": [
                    { "sTitle": "Id Galleria" },
                    { "sTitle": "Nome Galleria" },
                    { "sTitle": "Testo Galleria" },
                    { "sTitle": "Categoria Galleria" },
                    {
                        "sTitle": "Admin",
                        "mData": null,
                        "sClass": "center",
                        "sDefaultContent": '<a href="" class="editor_remove">Delete</a>'
                    }
                ]
            });
            $('#dataTableGallerie').on('click', 'a.editor_remove', function (e) {
                e.preventDefault();
                var target_row = $(this).closest("tr").get(0); // this line did the trick
                var id = $(this).closest("tr").find('td:first-child').text();
                var aPos = oTable.fnGetPosition(target_row);
                oTable.fnDeleteRow(aPos);
                var jsonText = JSON.stringify({ idgal: id });
                $.ajax({
                    url: "WebServiceAdmin.asmx/DeleteGalleriaFoto",
                    dataType: "json",
                    type: "POST",
                    data: jsonText,
                    contentType: "application/json; charset=utf-8",
                    error: function (err) {
                        alert("Error:" + err.responseText);
                    },
                    success: function (results) {
                        alert("Cancellazione effettuata con successo");
                    }
                });
            });

        }
    });

   
    /*----------- END datatable CODE -------------------------*/
}


function DeleteFieldGalleria() {
    $('#deletegalbutton').click(function (e) {
        $('#textgal').val('');
        $('#namegal').val('');
        $('#selcat').val('-1');
    });
}

function SaveGalleria() {
    $('#btgalleriafoto').click(function (e) {
        
//        $('form[name="form"]').find('input,select,textarea').not('[type=submit]').jqBootstrapValidation(
//            {
//                submitSuccess: function ($form,event) {
                    e.preventDefault();
                    $('#loader').show();
                    GetSaveGalleriaFoto();
//                }
//            });
    });
}

function GetSaveGalleriaFoto() {
    var nomegalleria= $('#namegal').val();
    var testogalleria = $('#textgal').val();
    var idcategoria = $('select[name=selcat]').val();
    var jsonText = JSON.stringify({ nome: nomegalleria, testo: testogalleria, idcat:idcategoria });
    $.ajax({
        url: "WebServiceAdmin.asmx/SaveGalleriaFoto",
        dataType: "json",
        type: "POST",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
            $('#loader').hide();
        },
        success: function (results) {
            $('#loader').hide();
            $('#msgdone').css('display', 'block');
            $('#textcat').val('');
            $('#namecat').val('');
            $('#msgdone').delay(2000).fadeOut(700);
        }
    });
}

function GetCategorie() {
    $.ajax({
        url: "WebServiceAdmin.asmx/GetCategorieFoto",
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            OnCompleteCategorie(results.d);
        }
    });
}

function OnCompleteCategorie(results) {
    $("#selcat").empty();
    $("#categorietmpl").tmpl(results).appendTo("#selcat");
    $("#selcat").append($("<option></option>")
         .attr("value", "-1")
         .attr('selected', 'selected')
         .text("Seleziona Categoria")); 

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
}