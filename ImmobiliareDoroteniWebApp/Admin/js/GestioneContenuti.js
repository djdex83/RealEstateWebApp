function CaricaOnLoad() {
    $(document).ready(function (e) {
        $('#wysihtml5').wysihtml5();
        SelezionaContenutiChange();
        UpdateContenuti();
    });
}

function SelezionaContenutiChange() {
    $('#selpaginacontenuti').change(function () {
        var jsonText = JSON.stringify({ pagina: $(this).val() });
        $.ajax({
            url: "WebServiceSite.asmx/GetContenutoPagina",
            dataType: "json",
            type: "POST",
            data: jsonText,
            contentType: "application/json; charset=utf-8",
            error: function (err) {
                alert("Error:" + err.responseText);
            },
            success: function (results) {
                var editorInstance = $('#wysihtml5').data("wysihtml5").editor;
                editorInstance.setValue(results.d, true);
            }
        });
    });
}

function UpdateContenuti() {
    $('#savecontenutibutton').click(function (e) {
        $('#loader').css('visibility', 'visible');
        var paginat = $('#selpaginacontenuti').val();
        var testot = $('#wysihtml5').val();
        var jsonText = JSON.stringify({ pagina: paginat, testo: testot });
        $.ajax({
            url: "WebServiceSite.asmx/UpdateContenuti",
            dataType: "json",
            type: "POST",
            data: jsonText,
            contentType: "application/json; charset=utf-8",
            error: function (err) {
                alert("Error:" + err.responseText);
            },
            success: function () {
                $('#loader').css('visibility', 'hidden');
                $('#msgdone').css('display', 'block');
                $('#showfotobutton').css('visibility', 'visible');
                $('#msgdone').delay(1000).fadeOut(700);

            }
        });
    });
}
