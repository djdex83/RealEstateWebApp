var oTable;

function AggiornaEvento() {
    $('#updateevento').click(function (e) {
        e.preventDefault();
        $('#loader').show();
        //var files = $('#listafile').val().split(';');
        var evento = new Object();
        var descr = $('#titoloevento').val();
        var testo = $('#wysihtml5').val();
        evento.idEvento = $('#updateevento').attr("id-foto");
        evento.titoloevento = descr;
        evento.testoevento = testo;
        evento.dataevento = $('#dataevento').val();
        evento.fotoevento = "";
        var jsonText = JSON.stringify({ evento: evento });
        $.ajax({
            url: "WebServiceAdmin.asmx/UpdateEvento",
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
function metisTableEventi() {
    "use strict";
     $('#dp3').datepicker();
     $('#wysihtml5').wysihtml5();
     $.ajax({
         url: "WebServiceAdmin.asmx/GetTuttiEventi",
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
                        this.idEvento,
                        this.DataEvento,
                        this.TitoloEvento,
                        this.TestoEvento
                ]);
             });
             $(".sortableTable").tablesorter();
             oTable = $('#dataTableEventi').dataTable({
                 "sDom": "<'pull-right'l>t<'row'<'col-lg-6'f><'col-lg-6'p>>",
                 "sPaginationType": "bootstrap",
                 "aaData": dtData,
                 "aoColumns": [
                    { "sTitle": "Id", "sWidth": "5%", "sClass": "center" },
                    { "sTitle": "Data", "sWidth": "10%", "sClass": "center" },
                    { "sTitle": "Titolo", "sWidth": "20%", "sClass": "center" },
                    { "sTitle": "Testo", "sWidth": "58%" },
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
             $('#dataTableEventi').on('click', 'a.editor_remove', function (e) {
                 var risposta = confirm('Vuoi cancellare l\'evento  selezionato?');
                 if (risposta) {
                     e.preventDefault();
                     var target_row = $(this).closest("tr").get(0); // this line did the trick
                     var id = $(this).closest("tr").find('td:first-child').text();
                     var aPos = oTable.fnGetPosition(target_row);
                     oTable.fnDeleteRow(aPos);
                     var jsonText = JSON.stringify({ idevento: id });
                     $.ajax({
                         url: "WebServiceAdmin.asmx/DeleteEvento",
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
             $('#dataTableEventi').on('click', 'a.editor_edit', function (e) {
                 e.preventDefault();
                 $("#ModificaEvento").show();
                 $('#titoloevento').val($(this).parent().parent().children(':nth(2)').text());
                 $('#dataevento').val($(this).parent().parent().children(':nth(1)').text());
                 $('#updateevento').attr("id-foto",$(this).parent().parent().children(':nth(0)').text());
                 var editorInstance = $('#wysihtml5').data("wysihtml5").editor;
                 editorInstance.setValue($(this).parent().parent().children(':nth(3)').html(), true);
                 var jsonText = JSON.stringify({ id: $(this).parent().parent().children(':nth(0)').text() });
                 $.ajax({
                     url: "WebServiceAdmin.asmx/GetEvento",
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
                             $("#fotoevento").attr('src', "../" + results.d.Fotoevento);
                             $(".thumbnail").attr('href', "../" + results.d.Fotoevento);
//                             $(".cambia").attr('id', results.d.IdFotoevento);
//                             $(".delete").attr('id', results.d.IdFotoevento);
//                             $(".cambia").click(function (e) {
//                                 var risposta = confirm('Sei sicuro di cambiare la foto dell\'evento?');
//                                 if (risposta) {
//                                     $("#formcambiafoto").show();
//                                     $("#formfotoevento").hide();
//                                 }
//                             });
                         }
                     }
                 });
             });
         }
     });
}
