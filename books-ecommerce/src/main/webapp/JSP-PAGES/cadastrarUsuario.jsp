<%-- 
    Document   : cadastrarUsuario
    Created on : 03/04/2020, 11:24:41
    Author     : Adaulan 
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/booksicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css" integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css" integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">
    </head>
    <style type="text/css">
        #body-changes{
            background-image: url("${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LOGIN-PAGE/booksbackground.jpg");
            background-size: cover;
        }
    </style>

    <body class="text-center" id=body-changes style="padding-top:10%;">

        <form name="formCad" id="FadeForm" class="form-type" method="post" action="${pageContext.request.contextPath}/CadastroUsuario" accept-charset="UTF-8">
            <div class="row justify-content-center">
                <div class="form-group col-6">
                    <h2>Usuário</h2>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="form-group col-4">
                    <label> Nome Completo: </label>
                    <input type="text" class="form-control" placeholder="Nome" required name="nome" id="nome">
                </div>
                <div class="form-group col-4 ">
                    <label> Email: </label>
                    <input type="text" class="form-control" placeholder="exemplo@email.com" required name="email" id="email">
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="form-group col-4 ">
                    <label> Usuário: </label>
                    <input type="text" class="form-control" placeholder="Usuário/Login" required name="username" id="username">
                </div>
                <div class="form-group col-4">
                    <label> Data de Nascimento: </label>
                    <input type="text" class="form-control" placeholder="00/00/0000" required name="dataNascimento" id="dataNascimento"  onkeyup="mascara('##/##/####', this, event)" >
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="form-group col-4 ">
                    <label> Senha: </label>
                    <input type="password" class=" form-control" placeholder="*********" required name="Senha" id="Senha">
                </div>
                <div class="form-group col-4 ">
                    <label> Confirmar Senha: </label>
                    <input type="password" class=" form-control" placeholder="*********" required name="Senha" id="Senha">
                </div>
            </div>    
            <div class="row ">
                <div class ="form group col-9 ">
                </div>
                <div class ="form group   col-sm-3 ">
                    <button type="reset" class="btn btn-primary" id="btn-form"> Cancelar </button>
                    <button type="submit" class="btn btn-primary" id="btn-form" > Confirmar </button>
                </div>
            </div>

        </form>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/swiper.min.js"></script>
        <script src="${pageContext.request.contextPath}/JSP-STYLES/JS/script.js"></script>
    </body>
</html>
