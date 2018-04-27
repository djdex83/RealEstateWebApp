var oTable;

function metisTableCategorie() {
    "use strict";
    $.ajax({
        url: "WebServiceAdmin.asmx/GetCategorieFoto",
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
                        this.idCategoria,
                        this.NomeCategoria,
                        this.DescrizioneCategoria,
                        this.VediPortfolio
                ]);
            });
            $(".sortableTable").tablesorter();
            oTable = $('#dataTableCategorie').dataTable({
                "sDom": "<'pull-right'l>t<'row'<'col-lg-6'f><'col-lg-6'p>>",
                "sPaginationType": "bootstrap",
                "aaData": dtData,
                "aoColumns": [
                    { "sTitle": "Id Categoria" },
                    { "sTitle": "Nome Categoria" },
                    { "sTitle": "Testo Categoria" },
                    { "sTitle": "VediPortfolio" },
                    {
                        "sTitle": "Admin",
                        "mData": null,
                        "sClass": "center",
                        "sDefaultContent": '<a href="" class="editor_remove">Delete</a>'
                    }
                ]
            });
            $('#dataTableCategorie').on('click', 'a.editor_remove', function (e) {
                e.preventDefault();
                var risposta = confirm('Vuoi cancellare la categoria selezionata?');
                if (risposta) {
                    var target_row = $(this).closest("tr").get(0); // this line did the trick
                    var id = $(this).closest("tr").find('td:first-child').text();
                    var aPos = oTable.fnGetPosition(target_row);
                    oTable.fnDeleteRow(aPos);
                    var jsonText = JSON.stringify({ idcat: id });
                    $.ajax({
                        url: "WebServiceAdmin.asmx/DeleteCategoriaFoto",
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
                }
            });

        }
    });
}


function DeleteFieldCategoria() {
    $('#deletecatbutton').click(function (e) {
        $('#textcat').val('');
        $('#namecat').val('');
    });
}

function SaveCategoria() {
    $('#btcategoriefoto').click(function (e) {
//        $("input,select,textarea").not("[type=submit]").jqBootstrapValidation(
//            {
//                submitSuccess: function ($form, event) {
                    e.preventDefault();
                    $('#loader').show();
                    GetSaveCategoriaFoto();
//                }
//            });
    });
}

function GetSaveCategoriaFoto() {
    var nomecategoria = $('#namecat').val();
    var tipocategoria = $('#textcat').val();
    var vedi=0,shop=0;
    if ($('#chkvedi').prop('checked') == true) { vedi = 1; }
//    if ($('#chkshop').prop('checked') == true) { shop = 1; }
    var jsonText = JSON.stringify({ nomecategoria: nomecategoria, tipocategoria: tipocategoria, vediportfolio: vedi, shop: shop });
    $.ajax({
        url: "WebServiceAdmin.asmx/SaveCategorieFoto",
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



