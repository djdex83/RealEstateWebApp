var oTable;

function metisTableCollaborazioni() {
    "use strict";
    $.ajax({
        url: "WebServiceSite.asmx/GetTutteCollaborazioni",
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
                        this.Id,
                        this.Path,
                        this.Descrizione
                ]);
            });
            $(".sortableTable").tablesorter();
            oTable = $('#dataTableCollaborazioni').dataTable({
                "sDom": "<'pull-right'l>t<'row'<'col-lg-6'f><'col-lg-6'p>>",
                "sPaginationType": "bootstrap",
                "sProcessing": true,
                "sLoadingRecords": "In Caricamento...",
                "aaData": dtData,
                "aoColumns": [
                    { "sTitle": "Id" },
                    { "sTitle": "Path" },
                    { "sTitle": "Descrizione" },
                    {
                        "sTitle": "",
                        "mData": null,
                        "sClass": "center",
                        "sDefaultContent": '<a href="" title="Visualizza Collaborazione" class="fa fa-pencil editor_view"></a>'
                    },
                    {
                        "sTitle":"",
                        "mData": null,
                        "sClass": "center",
                        "sDefaultContent": '<a href="" title="Cancella Collaborazione" class="fa fa-times editor_remove"></a>'
                    }
                ]
            });
            $('#dataTableCollaborazioni').on('click', 'a.editor_remove', function (e) {
                e.preventDefault();
                var risposta = confirm('Vuoi cancellare la collaborazione selezionata?');
                if (risposta) {
                    var target_row = $(this).closest("tr").get(0); // this line did the trick
                    var id = $(this).closest("tr").find('td:first-child').text();
                    var aPos = oTable.fnGetPosition(target_row);
                    oTable.fnDeleteRow(aPos);
                    var jsonText = JSON.stringify({ id: id });
                    $.ajax({
                        url: "WebServiceSite.asmx/DeleteCollaborazioni",
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
            $('#dataTableCollaborazioni').on('click', 'a.editor_view', function (e) {
                e.preventDefault();
                var id = $(this).closest("tr").find('td:first-child').text();
                window.location.href = "VediCollaborazione.aspx?Id="+id;
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