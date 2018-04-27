var oTable;

function metisTableOrdini() {
    "use strict";
    $.ajax({
        url: "WebServiceAdmin.asmx/GetOrdini",
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
                        this.Ordine,
                        this.Data,
                        this.Nome,
                        this.Cognome,
                        this.Email,
                        this.Citta,
                        this.Dimensione,
                        this.Quantita,
                        this.Foto
                ]);
            });
            $(".sortableTable").tablesorter();
            oTable = $('#dataTableOrdini').dataTable({
                "sDom": "<'pull-right'l>t<'row'<'col-lg-6'f><'col-lg-6'p>>",
                "sPaginationType": "bootstrap",
                "aaData": dtData,
                "aoColumns": [
                    { "sTitle": "Ordine" },
                    { "sTitle": "Data",
                        "bSearchable": false,
                        "sType": 'date',
                        "mRender": function (oObj) {
                            return dtConvFromJSON(oObj); 
                        }
                    },
                    { "sTitle": "Nome" },
                    { "sTitle": "Cognome" },
                    { "sTitle": "Email" },
                    { "sTitle": "Citta" },
                    { "sTitle": "Quantita" },
                    { "sTitle": "Totale" },
                    { "sTitle": "Foto" },
                    {
                        "sTitle": "Admin",
                        "mData": null,
                        "sClass": "center",
                        "sDefaultContent": '<a href="" class="editor_remove">Delete</a>'
                    }
                ]
            });
            $('#dataTableOrdini').on('click', 'a.editor_remove', function (e) {
                e.preventDefault();
                var risposta = confirm('Vuoi cancellare l\'ordine selezionato?');
                if (risposta) {
                    var target_row = $(this).closest("tr").get(0); // this line did the trick
                    var id = $(this).closest("tr").find('td:first-child').text();
                    var aPos = oTable.fnGetPosition(target_row);
                    oTable.fnDeleteRow(aPos);
                    var jsonText = JSON.stringify({ ordine: id });
                    $.ajax({
                        url: "WebServiceAdmin.asmx/DeleteOrdine",
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
    var d =   curr_date.toString() + '/'+ curr_month.toString() +'/' + curr_year ;
    return d;
}