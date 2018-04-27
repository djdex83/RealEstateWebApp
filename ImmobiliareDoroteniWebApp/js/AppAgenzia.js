var urlCollaborazioni = "Admin/WebServiceSite.asmx/Get10Collaborazioni";
/*global jQuery:false */
$(window).load(function () {
    "use strict";
    GetCollaborazioni();
});

function GetCollaborazioni() {
    $.ajax({
        url: urlCollaborazioni,
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            var array = [];
            $.each(results.d, function (i, obj) {
                array.push(new Collaborazione(obj.Id, obj.Path, obj.Descrizione));
            });
            RenderItem(array, "#collaborazioniTmpl", "#collaborazioni");
        }
    });
}
function RenderItem(data, templateid, container) {
    var template = $.templates(templateid);
    var htmlOutput = template.render(data);
    $(container).html(htmlOutput);

}
function Collaborazione(Id, Path, Descrizione) {
    this.Id = Id;
    this.Descrizione = Descrizione;
    this.Path = "/img/collaborazioni/" + Path.split('/')[2];
    this.Thumbnail = "/img/collaborazioni/resized/r_" + Path.split('/')[2];
}