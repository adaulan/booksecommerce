/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//Swipper Script
var swiper = new Swiper('.swiper-container', {
    slidesPerView: 5.5,
    spaceBetween: 10,
    pagination: {
        el: '.swiper-pagination',
        clickable: true
    }
});
//Redirecionar para Home
function redirectToPage(jspAddress) {
    window.location.href = jspAddress;
}

//Mudar o nome do input ao escolher imagem
$('#customFile').on('change', function () {

    var fileName = $(this).val().replace('C:\\fakepath\\', " ");
    $(this).next('.custom-file-label').html(fileName);
});
/* IMAGENS EM BINARIO */
function uploadFile() {

    $("#labelImagem").css("display", "block");
    $("#target").css("display", "inline");
    var target = document.querySelector("img[id=target]");
    var file = document.querySelector("input[type=file]").files[0];
    var reader = new FileReader();
    reader.onloadend = function () {

        target.src = reader.result;
        $("#base64").val(reader.result);
    };
    if (file) {
        reader.readAsDataURL(file);
    } else {
        target.src = "";
    }

}
;
// Mascaras para valor monetário
function moeda(a, e, r, t) {
    let n = ""
            , h = j = 0
            , u = tamanho2 = 0
            , l = ajd2 = ""
            , o = window.Event ? t.which : t.keyCode;
    if (13 == o || 8 == o)
        return !0;
    if (n = String.fromCharCode(o),
            -1 == "0123456789".indexOf(n))
        return !1;
    for (u = a.value.length,
            h = 0; h < u && ("0" == a.value.charAt(h) || a.value.charAt(h) == r); h++)
        ;
    for (l = ""; h < u; h++)
        -1 != "0123456789".indexOf(a.value.charAt(h)) && (l += a.value.charAt(h));
    if (l += n,
            0 == (u = l.length) && (a.value = ""),
            1 == u && (a.value = "0" + r + "0" + l),
            2 == u && (a.value = "0" + r + l),
            u > 2) {
        for (ajd2 = "",
                j = 0,
                h = u - 3; h >= 0; h--)
            3 == j && (ajd2 += e,
                    j = 0),
                    ajd2 += l.charAt(h),
                    j++;
        for (a.value = "",
                tamanho2 = ajd2.length,
                h = tamanho2 - 1; h >= 0; h--)
            a.value += ajd2.charAt(h);
        a.value += r + l.substr(u - 2, u)
    }
    return !1
}
;

function mensagemCadastro() {
    if ($('#alertaR').val() === "sucesso") {
        $('#RespostaSucesso').css("display", "block");
        setTimeout(function () {
            $('#RespostaSucesso').css("display", "none");
        }, 5000);
    } else if ($('#alertaR').val() == "falha") {
        if ($('#alertaR').val() === "sucesso") {
            $('#RespostaFalha').css("display", "block");
            setTimeout(function () {
                $('#RespostaFalha').css("display", "none");
            }, 5000);
        } else {
        }
        ;
    }
    ;
}

function ativaDivLogin() {
    $("#loginButton").trigger('click');
}
;
/* TESTA O TIPO DE USUARIO NA FUNÇÃO EDITAR */
function testaTipo() {
    if ($('#tipoUsuario').val() === 'estoquista') {
        $('.form-control').prop("readonly", true);
        $('#quantidade').prop("readonly", false);
        $('form input[type="file"]').prop("disabled", true);
        /* CATEGORIA DISABLE*/
        $('#categoria').css("background", '#eee');
        $('#categoria').css("pointer-events", 'none');
        $('#categoria').css("touch-action", 'none');

        /* ACABAMENTO DISABLE*/
        $('#acabamento').css("background", '#eee');
        $('#acabamento').css("pointer-events", 'none');
        $('#acabamento').css("touch-action", 'none');

        /* IDIOMA DISABLE*/
        $('#idioma').css("background", '#eee');
        $('#idioma').css("pointer-events", 'none');
        $('#idioma').css("touch-action", 'none');

        /* TAG DISABLE*/
        $('#tag').css("background", '#eee');
        $('#tag').css("pointer-events", 'none');
        $('#tag').css("touch-action", 'none');
    }
}

/* VALIDAÇÃO DE CAMPOS */
function validaCPF() {

    $('#cpf').focusout(function testaCPF() {
        var strCPF = $('#cpf').val();
        strCPF = strCPF.replace(/\.|\-/g, '');
        var Soma;
        var Resto;
        Soma = 0;
        if (strCPF === "00000000000") {
            $('#erro').fadeIn();
            $('#mensagemVal').html('CPF');
            $('.btn-confirmar').prop('disabled', true);
            return false;
        }

        for (i = 1; i <= 9; i++)
            Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (11 - i);
        Resto = (Soma * 10) % 11;
        if ((Resto === 10) || (Resto === 11)) {
            Resto = 0;
        }
        if (Resto !== parseInt(strCPF.substring(9, 10))) {
            $('#erro').fadeIn();
            $('#mensagemVal').html('CPF');
            $('.btn-confirmar').prop('disabled', true);
            return false;
        }
        Soma = 0;
        for (i = 1; i <= 10; i++)
            Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (12 - i);
        Resto = (Soma * 10) % 11;
        if ((Resto === 10) || (Resto === 11))
            Resto = 0;
        if (Resto !== parseInt(strCPF.substring(10, 11))) {
            $('#erro').fadeIn();
            $('#mensagemVal').html('CPF');
            $('.btn-confirmar').prop('disabled', true);

            return false;
        }

        $('.btn-confirmar').prop('disabled', false);
        $('#erro').fadeOut();
        return true;

    }
    );
}

function validaCPFCliente() {

    $('#CPF').focusout(function testaCPF() {
        var strCPF = $('#CPF').val();
        strCPF = strCPF.replace(/\.|\-/g, '');
        var Soma;
        var Resto;
        Soma = 0;
        if (strCPF === "00000000000") {
            $('#erroCliente').fadeIn();
            $('#mensagemValCliente').html('CPF');
            $('.btn-confirmar-cliente').prop('disabled', true);

            return false;
        }

        for (i = 1; i <= 9; i++)
            Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (11 - i);
        Resto = (Soma * 10) % 11;
        if ((Resto === 10) || (Resto === 11)) {
            Resto = 0;
        }
        if (Resto !== parseInt(strCPF.substring(9, 10))) {
            $('#erroCliente').fadeIn();
            $('#mensagemValCliente').html('CPF');
            $('.btn-confirmar-cliente').prop('disabled', true);
            return false;
        }
        Soma = 0;
        for (i = 1; i <= 10; i++)
            Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (12 - i);
        Resto = (Soma * 10) % 11;
        if ((Resto === 10) || (Resto === 11))
            Resto = 0;
        if (Resto !== parseInt(strCPF.substring(10, 11))) {
            $('#erroCliente').fadeIn();
            $('#mensagemValCliente').html('CPF');
            $('.btn-confirmar-cliente').prop('disabled', true);

            return false;
        }

        $('.btn-confirmar-cliente').prop('disabled', false);
        $('#erroCliente').fadeOut();
        return true;

    }
    );
}

function checarEmail(form, email) {
    if (document.forms[form][email].value === ""
            || document.forms[form][email].value.indexOf('@') < 1
            || document.forms[form][email].value.indexOf('\.') < 3)
    {
        $('#erro').fadeIn();
        $('#mensagemVal').html('EMAIL');
        $('.btn-confirmar').prop('disabled', true);
        return false;
    } else {
        $('#erro').fadeOut();
        $('.btn-confirmar').prop('disabled', false);
    }
}

function checarEmailCliente(form, email) {
    if (document.forms[form][email].value === ""
            || document.forms[form][email].value.indexOf('@') < 1
            || document.forms[form][email].value.indexOf('\.') < 3)
    {
        $('#erroCliente').fadeIn();
        $('#mensagemValCliente').html('EMAIL');
        $('.btn-confirmar-cliente').prop('disabled', true);
        return false;
    } else {
        $('#erroCliente').fadeOut();
        $('.btn-confirmar-cliente').prop('disabled', false);
    }
}

function checarSenha(form, senha, confirmaSenha) {
    if (document.forms[form][senha].value !== document.forms[form][confirmaSenha].value)
    {
        alert('funciona');
        $('#erro').fadeIn();
        $('#mensagemVal').html('Campo de senha');
        $('.btn-confirmar').prop('disabled', true);
        return false;
    } else {
        $('#erro').fadeOut();
        $('.btn-confirmar').prop('disabled', false);
    }
}


function checarSenhaCliente(form, senha, confirmaSenha) {
    if (document.forms[form][senha].value !== document.forms[form][confirmaSenha].value)
    {
        
        $('#erroCliente').fadeIn();
        $('#mensagemValCliente').html('Campo de senha');
        $('.btn-confirmar-cliente').prop('disabled', true);
        return false;
    } else {
        $('#erroCliente').fadeOut();
        $('.btn-confirmar-cliente').prop('disabled', false);
    }
}

