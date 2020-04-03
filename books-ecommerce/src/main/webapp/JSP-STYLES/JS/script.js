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
//IMAGENS EM BINÁRIO
/*
 function uploadFile() {
 $("#labelImagem").css("display", "block");
 $("#target").css("display", "inline");
 
 var target = document.querySelector("img[id=target]");
 var target1 = document.querySelector("img[id=target1]");
 var target2 = document.querySelector("img[id=target2]");
 var file = document.querySelector("input[type=file]").files[0];
 var file1 = document.querySelector("input[type=file]").files[1];
 var file2 = document.querySelector("input[type=file]").files[2];
 
 var reader = new FileReader();
 var reader1 = new FileReader();
 var reader2 = new FileReader();
 
 reader.onloadend = function () {
 target.src = reader.result;
 $("#base64").val(reader.result);
 };
 if (file) {
 reader.readAsDataURL(file);
 } else {
 target.src = "";
 }
 //Reader1
 reader1.onloadend = function () {
 $("#target1").css("display", "inline");
 target1.src = reader1.result;
 $("#base641").val(reader1.result);
 };
 if (file) {
 reader1.readAsDataURL(file1);
 } else {
 target.src = "";
 }
 //Reader2
 reader2.onloadend = function () {
 $("#target2").css("display", "inline");
 
 target2.src = reader2.result;
 $("#base642").val(reader2.result);
 };
 if (file) {
 reader2.readAsDataURL(file2);
 } else {
 target.src = "";
 }
 
 
 };
 */
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
};

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
        };
    };
}

function ativaDivLogin() {
    $("#loginButton").trigger('click');
};
