$(document).ready(function () {
    InviaEmailSito();
});

var ReCaptcha_Key = "6LcHeAsTAAAAAAPELQxiPaowYRCl9iG5svvR8snp";
var ReCaptcha_Secret = "6LcHeAsTAAAAADLp1sZ12um4uNfpjaZXa90FU0YR";

function validateNumber(phone) {
    var filter = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
    if (filter.test(phone)) {
        return true;
    } else {
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
        var checkemail = 0;
        var checkphone = 0;

        e.preventDefault();
        $.ajax({
            url: "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret+"&response=g-recaptcha-response",
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            error: function (err) {
            },
            success: function (results) {
                alert("CIao");
            }
        });
        var nome = $(".contact-name").val();
        var telefono = $(".contact-phone").val();
        var email = $(".contact-email").val();
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
            var oggetto = $(".contact-oggetto").val();
            var message = $(".contact-richiesta").val();
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
                    url: "../../Contatti.aspx/InviaEmail",
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
                        $('#sendmessage').delay(500).fadeIn(1500);
                        $('#sendmessage').delay(1000).fadeOut(1500);
                        $('input[type=text]').val('');
                        $('textarea').val('');
                    }
                });
            }
        }
    });
}