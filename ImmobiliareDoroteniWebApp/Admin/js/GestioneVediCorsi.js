var oTable;
function AggiornaCorso() {
    $('#updateCorso').click(function (e) {
        e.preventDefault();
        $('#loader').show();
        //var files = $('#listafile').val().split(';');
        var Corso = new Object();
        var descr = $('#titolocorso').val();
        var testo = $('#wysihtml5').val();
        Corso.titoloCorso = descr;
        Corso.idCorso = $(this).attr("id-corso");
        Corso.testoCorso = testo;
        Corso.dataCorso = $('#dataCorso').val();
        Corso.tipo = $("#seltipo").val();
        Corso.fotoCorso = "";
        var jsonText = JSON.stringify({ corso: Corso });
        $.ajax({
            url: "WebServiceAdmin.asmx/UpdateCorso",
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
    });
}
function metisTableCorsi() {
    "use strict";
    $('#dp3').datepicker();
    $('#wysihtml5').wysihtml5();
    $.ajax({
        url: "WebServiceAdmin.asmx/GetTuttiCorsi",
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
                        this.idCorso,
                        this.Tipo,
                        this.DataCorso,
                        this.TitoloCorso,
                        this.TestoCorso
                ]);
            });
            $(".sortableTable").tablesorter();
            oTable = $('#dataTableCorsi').dataTable({
                "sDom": "<'pull-right'l>t<'row'<'col-lg-6'f><'col-lg-6'p>>",
                "sPaginationType": "bootstrap",
                "aaData": dtData,
                "aoColumns": [
                    { "sTitle": "Id", "sWidth": "5%", "sClass": "center" },
                    { "sTitle": "Tipo", "sWidth": "7%", "sClass": "center" },
                    { "sTitle": "Data", "sWidth": "10%", "sClass": "center" },
                    { "sTitle": "Titolo", "sWidth": "20%", "sClass": "center" },
                    { "sTitle": "Testo", "sWidth": "51%" },
                    {
                        "sTitle": "",
                        "bSortable": false,
                        "mData": null,
                        "sClass": "center",
                        "sDefaultContent": '<a href="" class="fa fa-edit editor_edit" title="Modifica"></a>'
                    },
                    {
                        "sTitle": "",
                        "bSortable": false,
                        "mData": null,
                        "sClass": "center",
                        "sDefaultContent": '<a href="" class="fa fa-times editor_remove" title="Cancella"></a>'
                    }
                ]
            });
            $('#dataTableCorsi').on('click', 'a.editor_remove', function (e) {
                var risposta = confirm('Vuoi cancellare il Corso-workshop  selezionato?');
                if (risposta) {
                    e.preventDefault();
                    var target_row = $(this).closest("tr").get(0); // this line did the trick
                    var id = $(this).closest("tr").find('td:first-child').text();
                    var aPos = oTable.fnGetPosition(target_row);
                    oTable.fnDeleteRow(aPos);
                    var jsonText = JSON.stringify({ idcorso: id });
                    $.ajax({
                        url: "WebServiceAdmin.asmx/DeleteCorso",
                        dataType: "json",
                        type: "POST",
                        data: jsonText,
                        contentType: "application/json; charset=utf-8",
                        error: function (err) {
                            alert("Error:" + err.responseText);
                        },
                        success: function (results) {
                            if (results.d == true) {
                                alert("Cancellazione effettuata con successo");
                            }
                        }
                    });
                }
            });
            $('#dataTableCorsi').on('click', 'a.editor_edit', function (e) {
                e.preventDefault();
                $("#ModificaCorso").show();
                $('#titolocorso').val($(this).parent().parent().children(':nth(3)').text());
                $('#dataCorso').val($(this).parent().parent().children(':nth(2)').text());
                $('#updateCorso').attr("id-corso",$(this).parent().parent().children(':nth(0)').text());
                var editorInstance = $('#wysihtml5').data("wysihtml5").editor;
                editorInstance.setValue($(this).parent().parent().children(':nth(4)').html(), true);
                var jsonText = JSON.stringify({ id: $(this).parent().parent().children(':nth(0)').text() });
                $.ajax({
                    url: "WebServiceAdmin.asmx/GetCorso",
                    dataType: "json",
                    type: "POST",
                    data: jsonText,
                    contentType: "application/json; charset=utf-8",
                    error: function (err) {
                        alert("Error:" + err.responseText);
                    },
                    success: function (results) {
                        if (results.d != null) {
                            $("a[rel*='prettyPhoto']").prettyPhoto({ social_tools: false });
                            $("#fotocorso").attr('src', "../" + results.d.FotoCorso);
                            $(".thumbnail").attr('href', "../" + results.d.FotoCorso);
                            $("#seltipo").val(results.d.Tipo);
                        }
                    }
                });
            });
        }
    });
    }

