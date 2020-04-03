<%-- 
    Document   : navbar
    Created on : 26/03/2020, 13:53:19
    Author     : Adaulan 
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- BOOTSTRAP -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
              crossorigin="anonymous">

        <!-- LOGIN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css" integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">
        <style type="text/css">
            body {
                margin: 0 auto;
            }
            #top-bar {
                width: 100%;
                margin: 0 auto;
                background-color: #F2F2F2;
                height: 40px;
                font-family: sans-serif;
                color: #848484;
                text-align: right;
                border: 1px solid rgba(187,187,187,0.40);
            }

            #signin-div {
                height: 40px;
                padding-top: 5px;
                margin-right:200px; 
            }

            #signin-div a{
                margin-left:20px;
                color:#585858;
            }

            #signin-div a:hover{
                text-decoration: none;
                color: #848484;
            }


            .clear {
                clear:both;
            }


        </style>
        <title>Navbar</title>
    </head>
    <body>
        <!-- TOP BAR -->
        <div id="top-bar">
            <div id="signin-div" class="top-bar-section">

                <button type="text" class="btn" data-toggle="modal" data-target="#exampleModalCenter" id="loginButton"> 
                    <c:forEach items ="${loginText}" var="loginText">
                        <a href="#" ><span id="signin-text"><c:out value="${loginText}"/></span></a>
                        </c:forEach>
                </button>

                <!-- FIM MODAL LOGIN -->
                <a href="#"><img src="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/cart.png"></a>

            </div>
        </div>
        <!-- NAVBAR -->
        <input type="hidden" value="${tipo}" id="tipoUsuario">
        <nav class="navbar navbar-expand-sm navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="home.jsp">
                    <img src="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/booksicon.png">
                    Livraria Projeto x</a>
                <button class="navbar-toggler"
                        data-toggle="collapse"
                        data-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item" id="home">
                            <a class="nav-link" href="${pageContext.request.contextPath}/homeServlet">Home</a>
                        </li>
                        <li class="nav-item" hidden id="about">
                            <a class="nav-link" href="#">About</a>   
                        </li>
                        <li class="nav-item" hidden>
                            <a class="nav-link" href="#">Services</a>
                        </li>
                        <li class="nav-item" hidden>
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Produtos</a>
                            <div class="dropdown-menu">
                                <a href="${pageContext.request.contextPath}/JSP-PAGES/cadastrarProdutos.jsp" class="dropdown-item">Cadastro</a>
                                <a href="${pageContext.request.contextPath}/JSP-PAGES/consultaProdutos.jsp" class="dropdown-item">Consulta</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Clientes</a>
                            <div class="dropdown-menu">
                                <a href="#" class="dropdown-item">Cadastro</a>
                                <a href="#" class="dropdown-item">Consulta</a>
                            </div>
                        </li>
                    </ul>

                    <form class="form-inline ml-auto">
                        <input type="text" class="form-control mr-2" placeholder="Busca">
                        <button class="btn btn-outline-success">Busca</button>
                    </form>
                </div>
            </div>
        </nav>



        <!-- Modal LOGIN-->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                <div class="modal-content" style="background: transparent; border:none; max-width:800px; height: 800px;width:800px;">

                    <div class="form-singin">
                        <div class="" id="" >
                            <form  action = "${pageContext.request.contextPath}/loginServlet" method = "post" style="text-align: center;">
                                <i class="fa fa-journal-whills"></i>
                                <h1 class="h3 mb-3 font-weight-normal">Insira seus dados</h1>
                                <label for="inputUsuario" class="sr-only">Usuário</label>
                                <input type="usuario" id="inputUsuario" class="form-control" placeholder="Usuário" required="" autofocus="" name="inputName">
                                <label for="inputSenha" class="sr-only">Senha</label>
                                <input type="password" id="inputSenha" class="form-control" placeholder="Senha" required="" name="inputSenha">
                                <c:out value="${msgErro}"/>
                                <br>
                                <button class="btn btn-lg btn-primary btn-block" type="submit" id="btn-singin"> Entrar <i class="fas fa-sign-in-alt"></i> </button>
                                
                            </form>
                            <br/>
                            <button data-toggle="modal" data-target="#exampleModalCenter2" class="btn btn-lg btn-primary btn-block" id="btn-singin"> Inscrever-se <i class="fas fa-user-plus"></i> </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Modal INSCREVER-SE-->
        <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                <div class="modal-content" style="background: transparent; border:none; width:1000px; height:1000px;">
                    <!--<div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>-->
                    <form name="formCad" id="FadeForm" class="form-type form-singin" method="post" action="${pageContext.request.contextPath}/cadastrarUsuarioServlet" accept-charset="UTF-8">
                        <div class="row justify-content-center">
                            <div class="form-group col-6">
                                <h2>Usuário</h2>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-10">
                                <label> Nome Completo: </label>
                                <input type="text" class="form-control" placeholder="Nome" required name="nome" id="nome">
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-10 ">
                                <label> Email: </label>
                                <input type="text" class="form-control" placeholder="exemplo@email.com" required name="email" id="email">
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-10">
                                <label> Data de Nascimento: </label>
                                <input type="text" class="form-control" placeholder="00/00/0000" required name="dataNascimento" id="dataNascimento"  onkeyup="mascara('##/##/####', this, event)" >
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-10 ">
                                <label> Usuário: </label>
                                <input type="text" class="form-control" placeholder="Usuário/Login" required name="usuario" id="username">
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-10 ">
                                <label> Senha: </label>
                                <input type="password" class=" form-control" placeholder="*********" required name="senha" id="Senha">
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-10 ">
                                <label> Confirmar Senha: </label>
                                <input type="password" class=" form-control" placeholder="*********" required name="senha2" id="Senha">
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class ="form group col-4 ">
                                <button type="reset" class="btn btn-primary" id="btn-form" data-dismiss="modal"> Cancelar </button>
                            </div>
                            <div class ="form group   col-4 " style="margin-right:10px;">
                                <button type="submit" class="btn btn-primary" id="btn-form" > Confirmar </button>
                            </div>
                        </div>

                    </form>
                    <!--<div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-warning">Confirmar</button>
                    </div>-->
                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" 
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toggles/2.0.4/toggles.min.js"></script>
        <script type="text/javascript">
        </script>
    </body>

</html>
