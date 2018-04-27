var urlAnnuncio = "Admin/WebServiceSite.asmx/GetAnnuncio";


$(document).ready(function () {
    $("#mq").numeric();
    $("#mq2").numeric();
    $("#camere").numeric();
    $("#camere2").numeric();
    $("#prezzo").numeric();
    $("#prezzo2").numeric();
    $("#loader").show();
    var cod = getParameterByName('Codice');
    GetAnnuncio(cod);
    GetProvincie();
    $("#ricerca").click(function (e) {
        e.preventDefault();
        var search = GetValue();
        window.location = "Immobili.aspx" + search;
    });
});

function GetAnnuncio(codice) {
    var jsonText = JSON.stringify({ Codice: codice });
    $.ajax({
        url: urlAnnuncio,
        dataType: "json",
        type: "POST",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            var obj=results.d;
            var annuncio =new Annuncio(obj.Codice,obj.Prezzo,obj.Tipologia,obj.Stato,obj.Provincia,obj.Comune,obj.Zona,obj.Mq,obj.Bagni,obj.Box,obj.Camere,obj.Ascensore,obj.Locali,obj.Piano,obj.ClasseEnergetica,obj.Contratto,obj.Riscaldamento,obj.Descrizione,obj.DescrizioneBreve,obj.Thumbnail,obj.ListFoto,obj.BoxDoppio,obj.PostoAuto,obj.MqTerreno);
            // RenderItemCarousel(array, "#annunciTmpl", "#ultimiannunci");
            $("meta[property='og\\:title']").attr("content", annuncio.DescrizioneBreve);
            $("meta[property='og\\:description']").attr("content", annuncio.DescrizioneBreve);
            $("meta[property='og\\:url']").attr("content", "http://www.immobiliaredoroteni.it/SchedaImmobile.aspx?Codice="+annuncio.Codice);
            $("meta[property='og\\:site_name']").attr("content", annuncio.DescrizioneBreve);
            $("meta[property='og\\:image']").attr("content", annuncio.Thumbnail);
            RenderItem(annuncio, "#annuncioTmpl", "#overview");
        }
    });
}
function RenderItem(data, templateid, container) {
    var template = $.templates(templateid);
    var htmlOutput = template.render(data);
     $("#loader").hide();
     $(container).html(htmlOutput);
     InviaEmailSito();
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
function GetProvincie() {
    $.ajax({
        url: "Admin/WebServiceSite.asmx/GetProvincie",
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            RenderItemProv(results.d, "#provTmpl", "#provincie");
        }
    });
}

function GetComuni(sigla) {
    var jsonText = JSON.stringify({ sigla: sigla });
    $.ajax({
        url: "Admin/WebServiceSite.asmx/GetComuni",
        dataType: "json",
        type: "POST",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        error: function (err) {
            alert("Error:" + err.responseText);
        },
        success: function (results) {
            RenderItemCom(results.d, "#comTmpl", "#comuni");
        }
    });
}

function RenderItemProv(data, templateid, container) {
    var template = $.templates(templateid);
    var htmlOutput = template.render(data);
    $(container).html(htmlOutput);
    $(container).append($("<option></option>")
         .attr("value", "-1")
         .attr('selected', 'selected')
         .text("Seleziona Provincia"));
    $(container).bind("change", function () { GetComuni($(container + " option:selected").val()); });
}

function RenderItemCom(data, templateid, container) {
    var template = $.templates(templateid);
    var htmlOutput = template.render(data);
    $(container).html(htmlOutput);
    $(container).append($("<option></option>")
         .attr("value", "-1")
         .attr('selected', 'selected')
         .text("Seleziona Comune"));
}

function FotoAnnuncio(path) {
    this.Path = path;
}
function GetValue() {
    var contratto = "", provincia = "", comune = "", tipologia = "";
    var codice = $("#codice").text();
    if ($("#contratto option:selected").val() !== "-1") {
        contratto = $("#contratto option:selected").text();
        if (contratto != "Tutte le tipologie") {
            contratto = $("#contratto option:selected").text();
        } else {
            contratto = "Tutte";
        }
    }
    if ($("#provincie option:selected").val() != "-1") {
        provincia = $("#provincie option:selected").text();
    }
    if ($("#comuni option:selected").val() != "-1") {
        comune = $("#comuni option:selected").text();
    }
    if ($("#tipologia option:selected").val() != "-1") {
        tipologia = $("#tipologia option:selected").text();
    }

    var prezzo = $("#prezzo").val();
    var prezzo2 = $("#prezzo2").val();
    var camere = $("#camere").val();
    var camere2 = $("#camere2").val();
    var mq = $("#mq").val();
    var mq2 = $("#mq2").val();

    var stringquery = "?Codice=" + codice + "&Contratto=" + contratto + "&Tipologia=" + tipologia + "&Provincia=" + provincia + "&Comune=" + comune + "&Prezzo=" + prezzo + "_" + prezzo2 + "&Camere=" + camere + "_" + camere2 + "&Mq=" + mq + "_" + mq2;
    return stringquery;
}

function Annuncio(codice,prezzo,tipologia,stato,provincia,comune,zona,mq,bagni,box,camere,ascensore,locali,piano,classeEnergetica,contratto,riscaldamento,descrizione,descrizioneBreve,pathfoto,listafoto,boxdoppio, postoauto,mqterreno) {
    this.Codice = codice;
    if (prezzo != 0) {
       this.Prezzo = "€ "+prezzo;
    } else {
        this.Prezzo = "Tratt.Risevata";
    }
    if(tipologia == "Capannone/Magazzino") {
        this.Prezzo = "€ " + prezzo +"/mq";
    }
    this.Tipologia = tipologia;
    this.Stato = stato;
    this.Riscaldamento = riscaldamento;
    this.Provincia=provincia;
    this.Comune=comune;
    this.Zona = zona;
    this.Mq = mq;
    if (this.Mq != null) {
        this.Mq = mq + "Mq c.a.";
    } else {
        this.Mq="N.D."
    }
    if (this.MqTerreno != null && this.MqTerreno != undefined && this.MqTerreno != "") {
        this.MqTerreno = mqterreno + "Mq di terreno";
    } else {
        this.MqTerreno = "Nessun terreno";
    }
    if(bagni>1)
        this.Bagni = bagni+" Bagni";
    else
        this.Bagni = bagni + " Bagno";
    this.BoxDoppio = boxdoppio;
    this.PostoAuto = postoauto;
    if (box != null) {
        box = box.toLowerCase().replace(/\b[a-z]/g, function (letter) {
            return letter.toUpperCase();
        });
    }
    this.Box = box + " Garage";
    if (this.BoxDoppio === "Si" && this.PostoAuto === "No" && this.Box === "No") {
        this.Box = "Doppio Garage";
    }
    if (this.BoxDoppio === "Si" && this.PostoAuto === "Si" && this.Box === "No") {
        this.Box = "Doppio Garage e posto auto";
    }
    if (this.BoxDoppio === "Si" && this.PostoAuto === "No" && this.Box === "Si") {
        this.Box = "Garage e Doppio Garage";
    }
    if (this.BoxDoppio === "No" && this.PostoAuto === "Si" && this.Box === "No") {
        this.Box = "Posto auto";
    }
    if (this.BoxDoppio === "No" && this.PostoAuto === "No" && this.Box === "Si") {
        this.Box = "Si Garage";
    }
    if (this.BoxDoppio === "No" && this.PostoAuto === "No" && this.Box === "No") {
        this.Box = "No Garage";
    }
    if (this.BoxDoppio === "No" && this.PostoAuto === "Si" && this.Box === "Si") {
        this.Box = "Garage e posto auto";
    }
    if (this.Box === "null Garage") {
        this.Box = "N.D.";
    }
    if (camere > 1)
        this.Camere = camere + " Vani";
    else
        this.Camere = camere + " Vano";
    this.Ascensore=ascensore;
    if (locali > 1)
        this.Locali = locali + " Locali";
    else
        this.Locali = locali + " Locale";
    this.Piano = piano;
    if (classeEnergetica.indexOf('-') === -1) {
        this.ClasseEnergetica = classeEnergetica;
        this.IPE = "n.d.";
    } else {
        this.ClasseEnergetica = classeEnergetica.split("-")[0];
        this.IPE = classeEnergetica.split("-")[1] + " kwh/m²";
    }
    this.Contratto=contratto;
    this.DescrizioneBreve=descrizioneBreve;
    this.Descrizione=descrizione;
    this.Thumbnail = pathfoto;
    
    var fotoannuncio=[]
    $.each(listafoto, function (i, obj) {
        var fa = new FotoAnnuncio();
        fa.Path = obj.Path;
        fa.Thumbnail = obj.Thumbnail;
        fotoannuncio.push(fa);
    });
    this.Listafoto = fotoannuncio;

}

function validateNumber(phone)
{
    var filter=/\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
    if(filter.test(phone)){
        return true;
    }else{
        return false;
    }
}
function validaEmail(sEmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(sEmail)) {
        return true;
    } else {
        return false;
    }
}


function InviaEmailSito() {
    $("#contact-submit").click(function (e) {
        e.preventDefault();
        var checkemail = 0;
        var checkphone = 0;
        var nome = $("#contact-name").val();
         var telefono = $("#contact-phone").val();
        var email = $("#contact-email").val();
        if ($.trim(email).length == 0) {
            alert('Inserire un indirizzo email valido');
            e.preventDefault();
        }
        if (validaEmail(email)) {
            checkemail = 0;
        }
        else {
            checkemail = 1;
            alert('Inserire un indirizzo email valido');
            e.preventDefault();
        }
       if (validateNumber(telefono)) {
            checkphone = 0;
        }
        else {
            checkphone = 1;
            alert('Inserire un numero di telefono valido');
            e.preventDefault();
        }
        if (checkemail == 0 && checkphone == 0) {
            $('#loaderemailok').show();
            var oggetto = "Richiesta per immobile COD.: " + $("#formrichiediinfo").attr('data-codice');
            var message = $("#contact-message").val();
            var check = 0;
            if ((nome == "" || email == "" || oggetto == "" || message == "" || telefono == "") || (nome == undefined || email == undefined || oggetto == undefined || message == undefined || telefono == undefined)) {
                check = 1;
                alert("Tutti i campi sono obbligatori!");
                $('#loaderemailok').hide();
            }
            if (check == 0) {
                var messaggio = new Object();
                messaggio.Nome = nome;
                messaggio.Email = email;
                messaggio.Telefono = telefono;
                messaggio.Oggetto = oggetto;
                messaggio.Testo = message;
                var jsonText = JSON.stringify({ messaggio: messaggio });
                $.ajax({
                    url: "../../SchedaImmobile.aspx/InviaEmail",
                    dataType: "json",
                    type: "POST",
                    data: jsonText,
                    contentType: "application/json; charset=utf-8",
                    error: function (err) {
                        alert("Error occured");
                        $('#loaderemailok').hide();
                    },
                    success: function (results) {
                        $('#loaderemailok').hide();
                        $('#sendmessage').delay(2000).fadeOut(700);
                        $('input[type=text]').val('');
                        $('textarea').val('');
                    }
                });
            }
        }
    });
}