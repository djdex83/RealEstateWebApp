function CaricaOnLoad() {
    OnLoad();
    Update();
}



function OnLoad() {
    var id = getParameterByName("Id");
    var jsonText = JSON.stringify({ Id: id });
    $.ajax({
        url: "WebServiceSite.asmx/GetCollaborazione",
        dataType: "json",
        type: "POST",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            var Collaborazione = results.d;
            $("#descrizione").val(Collaborazione.Descrizione);
            Collaborazione.Thumbnail = "../img/collaborazioni/resized/r_" + Collaborazione.Path.split('/')[1];
            Collaborazione.Path = "../img/collaborazioni/" + Collaborazione.Path.split('/')[1];
            OnCompleteFoto(Collaborazione);
        }
    });
}



function OnCompleteFoto(results) {
    $("#foto").empty();
    $("#fototmpl").tmpl(results).appendTo("#foto");
};


function Update() {

    $('#btupdateCollaborazione').click(function (e) {
        e.preventDefault();
        $('#loader').show();
        var Collaborazione = new Object();
        var id = getParameterByName("Id");
        Collaborazione.Id = id;
        var DescrizioneBreve = $('#descrizione').val();
        Collaborazione.Descrizione = DescrizioneBreve;
        var jsonText = JSON.stringify({ collaborazione: Collaborazione });
        $.ajax({
            url: "WebServiceSite.asmx/UpdateCollaborazione",
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
                //Pulire tutti i campi
                $('input[type="text"]').val("");
            }
        });
    });
}


function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function CheckField() {
}