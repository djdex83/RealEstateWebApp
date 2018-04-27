var oTable;

function metisTableAnnunci() {
    "use strict";
    $.ajax({
        url: "WebServiceSite.asmx/GetTuttiAnnunci",
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
                        this.Codice,
                        this.Tipologia,
                        this.Contratto,
                        this.DescrizioneBreve,
                        this.Comune,
                        this.Mq,
                        this.AnnuncioInEvidenza
                ]);
            });
            $(".sortableTable").tablesorter();
            oTable = $('#dataTableAnnunci').dataTable({
                "sDom": "<'pull-right'l>t<'row'<'col-lg-6'f><'col-lg-6'p>>",
                "sPaginationType": "bootstrap",
                "sProcessing": true,
                "sLoadingRecords": "In Caricamento...",
                "aaData": dtData,
                "aoColumns": [
                    { "sTitle": "Codice" },
                    { "sTitle": "Tipologia" },
                    { "sTitle": "Contratto" },
                    { "sTitle": "DescrizioneBreve" },
                    { "sTitle": "Comune" },
                    { "sTitle": "Mq" },
                    { "sTitle": "Evidenza" },
                    {
                        "sTitle": "",
                        "mData": null,
                        "sClass": "center",
                        "sDefaultContent": '<a href="" title="Visualizza Annuncio" class="fa fa-pencil editor_view"></a>'
                    },
                    {
                        "sTitle":"",
                        "mData": null,
                        "sClass": "center",
                        "sDefaultContent": '<a href="" title="Cancella Annuncio" class="fa fa-times editor_remove"></a>'
                    },
                    {
                        "sTitle": "",
                        "mData": null,
                        "sClass": "center",
                        "sDefaultContent": '<a href="" title="Setta in evidenza" class="fa fa-check-square editor_evidenza"></a>'
                    }
                ]
            });
            $('#dataTableAnnunci').on('click', 'a.editor_remove', function (e) {
                e.preventDefault();
                var risposta = confirm('Vuoi cancellare l\'Annuncio selezionato?');
                if (risposta) {
                    var target_row = $(this).closest("tr").get(0); // this line did the trick
                    var codice = $(this).closest("tr").find('td:first-child').text();
                    var aPos = oTable.fnGetPosition(target_row);
                    oTable.fnDeleteRow(aPos);
                    var jsonText = JSON.stringify({ codice: codice });
                    $.ajax({
                        url: "WebServiceSite.asmx/DeleteAnnuncio",
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
            $('#dataTableAnnunci').on('click', 'a.editor_view', function (e) {
                e.preventDefault();
                var codice = $(this).closest("tr").find('td:first-child').text();
                window.location.href = "VediAnnuncio.aspx?Codice="+codice;
            });
            $('#dataTableAnnunci').on('click', 'a.editor_evidenza', function (e) {
                e.preventDefault();
                var risposta = confirm('Vuoi settare l\'Annuncio selezionato in evidenza?');
                if (risposta) {
                    var target_row = $(this).closest("tr").get(0); // this line did the trick
                    var codice = $(this).closest("tr").find('td:first-child').text();
                    var aPos = oTable.fnGetPosition(target_row);
                    oTable.fnDeleteRow(aPos);
                    var jsonText = JSON.stringify({ codice: codice });
                    $.ajax({
                        url: "WebServiceSite.asmx/SetInEvidenza",
                        dataType: "json",
                        type: "POST",
                        data: jsonText,
                        contentType: "application/json; charset=utf-8",
                        error: function (err) {
                            alert("Error:" + err.responseText);
                        },
                        success: function (results) {
                            alert("Annuncio settato in evidenza!");
                        }
                    });
                }
            });

        }
    });
}

function dtConvFromJSON(data) {
    if (data == null) return '1/1/1950';
    var r = /\/Date\(([0-9]+)\)\//gi
    var matches = data.match(r);
    if (matches == null) return '1/1/1950';
    var result = matches.toString().substring(6, 19);
    var epochMilliseconds = result.replace(
/^\/Date\(([0-9]+)([+-][0-9]{4})?\)\/$/,
'$1');
    var b = new Date(parseInt(epochMilliseconds));
    var c = new Date(b.toString());
    var curr_date = c.getDate();
    var curr_month = c.getMonth() + 1;
    var curr_year = c.getFullYear();
    var curr_offset = c.getTimezoneOffset() / 60
    var d = curr_date.toString() + '/' + curr_month.toString() + '/' + curr_year;
    return d;
}