
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

function CategoriaFotoChange() {
    $('#selgal').change(function () {
        GetListaFotoByGalleria($(this).val());
    });
}


function GetListaFotoByGalleria(galleria) {
    var jsonText = JSON.stringify({ gallery: galleria });
    $.ajax({
        url: "WebServiceAdmin.asmx/GetFotoByGalleryAdmin",
        dataType: "json",
        type: "POST",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            OnCompleteListaFoto(results.d);
            $("a[rel*='prettyPhoto']").prettyPhoto({ social_tools: false });
            DeleteFoto();
            SetCopertina();
            $('#listafoto .fa-edit').on('click', function () {
                $('#editFotoModal').modal({
                    show: true
                });
                var id = $(this).attr('id');
                var descrizione = $(this).attr('descrizione');
                $("#descrizionefoto").attr("idf", id);
                $("#descrizionefoto").val(descrizione);
                $("#updatefoto").click(function (e) {
                    e.preventDefault();
                    SalvaModificaFoto();
                });
            });
        }
    });
}

function SalvaModificaFoto() {
    var id=$("#descrizionefoto").attr("idf");
    var descrizione = $("#descrizionefoto").val();
    var jsonText = JSON.stringify({ idfoto: id,descrizione:descrizione });
    $.ajax({
        url: "WebServiceAdmin.asmx/UpdateFoto",
        dataType: "json",
        type: "POST",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            if (results.d == true) {
                alert("Foto aggiornata correttamente!");
                $('#editFotoModal button.close').click();
                GetListaFotoByGalleria($('#selgal').val());
            }
        }
    });
}




function DeleteFoto() {
    $(".delete").click(function (e) {
        var idfoto = $(this).attr("id");
        var risposta = confirm('Vuoi cancellare la foto selezionata?');
        if (risposta) {
            var jsonText = JSON.stringify({ idfoto: idfoto });
            $.ajax({
                url: "WebServiceAdmin.asmx/DeleteFoto",
                dataType: "json",
                type: "POST",
                data: jsonText,
                contentType: "application/json; charset=utf-8",
                error: function (err) {
                    alert("Error:" + err.responseText);
                },
                success: function (results) {
                    if (results.d == true) {
                        alert("Foto cancellata correttamente!");
                        GetListaFotoByGalleria($('#selgal').val());
                    }
                }
            });
        }
    });
}
function SetCopertina() {
    $(".copertina").click(function (e) {
        var idfoto = $(this).attr("id");
        var idgalleria = $(this).attr("id-gal");
        var risposta = confirm('Vuoi impostare la foto come copertina dell\'album?');
        if (risposta) {
            var jsonText = JSON.stringify({ idfoto: idfoto, idgallery:idgalleria });
            $.ajax({
                url: "WebServiceAdmin.asmx/SetCopertina",
                dataType: "json",
                type: "POST",
                data: jsonText,
                contentType: "application/json; charset=utf-8",
                error: function (err) {
                    alert("Error:" + err.responseText);
                },
                success: function (results) {
                    if (results.d == true) {
                        alert("Aggiornamento effettuato correttamente!");
                    } else {
                        alert("Errore nell'aggiornamento!");
                    }
                }
            });
        }
    });
}
function OnCompleteListaFoto(results) {
    $("#listafoto").empty();
    $("#listafototmpl").tmpl(results).appendTo("#listafoto");
};
