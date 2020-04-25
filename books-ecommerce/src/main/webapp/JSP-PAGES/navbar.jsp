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
                background-color:  #0E9092 !important;
                height: 40px;
                font-family: sans-serif;
                color: #FD7F66;
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
                color:#FD7F66;
            }

            #signin-div a:hover{
                text-decoration: none;
                color: #DFE5E1;
            }


            .clear {
                clear:both;
            }


        </style>
        <title>Navbar</title>
    </head>
    <body onload="testaLogin()">
        <!-- TOP BAR -->
        <div id="top-bar">
            <div id="signin-div" class="top-bar-section">

                <button type="text" class="btn" data-toggle="modal" data-target="${datatarget}" id="loginButton"> 
                    <c:forEach items ="${loginText}" var="loginText">
                        <a href="#" ><span id="signin-text"><c:out value="${loginText}"/></span></a>
                        <input type="hidden" value="${tipo}" id="loginInput" class="tipo"/>
                    </c:forEach>
                </button>


                <a href="#"><img src="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/cart.png"></a>

            </div>
        </div>
        <!-- NAVBAR -->
        <input type="hidden" value="${tipo}" id="tipoUsuario">
        <nav class="navbar navbar-expand-sm navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/homeServlet">
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
                        <li class="nav-item" style="display:none" id="about">
                            <a class="nav-link" href="#">About</a>   
                        </li>
                        <li class="nav-item" hidden>
                            <a class="nav-link" href="#">Services</a>
                        </li>
                        <li class="nav-item" hidden>
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                        <li id="produtos" class="nav-item dropdown" style="display:none">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Produtos</a>
                            <div class="dropdown-menu">
                                <a href="${pageContext.request.contextPath}/JSP-PAGES/cadastrarProdutos.jsp" class="dropdown-item">Cadastro</a>
                                <a href="${pageContext.request.contextPath}/JSP-PAGES/consultaProdutos.jsp" class="dropdown-item">Consulta</a>
                            </div>
                        </li>
                        <li id="clientes" class="nav-item dropdown" style="display:none">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Clientes</a>
                            <div class="dropdown-menu">
                                <a href="#" class="dropdown-item">Cadastro</a>
                                <a href="#" class="dropdown-item">Consulta</a>
                            </div>
                        </li>
                        <li id="usuarios" class="nav-item dropdown" style="display:none">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Usuarios</a>
                            <div class="dropdown-menu">
                                <a href="${pageContext.request.contextPath}/JSP-PAGES/cadastrarUsuario.jsp" class="dropdown-item">Cadastro</a>
                                <a href="${pageContext.request.contextPath}/JSP-PAGES/consultaUsuario.jsp" class="dropdown-item">Consulta</a>
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
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
             >
            <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                <div class="modal-content" style="background: transparent; border:none; max-width:330px; height: 380px;margin-left:100px;">

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
        <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
             onload="masks()">
            <div class="modal-dialog modal-dialog-centered-lg" role="document" style="color: black;">
                <div class="modal-content" style="background: transparent; border:none; width:600px; height:450px; margin-top:120px;">

                    <form name="formCad" class="form-type form-singin-cad" method="post" action="${pageContext.request.contextPath}/cadastrarUsuarioClienteServlet" 
                          accept-charset="UTF-8">
                        <div class="row justify-content-center">
                            <div class="form-group col-3">
                                <h2>Usuário</h2>
                            </div>
                        </div>
                        <div id="erroCliente" class="alert alert-danger" role="alert" style='display:none'>
                            <span id='mensagemValCliente'></span> invalido!
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-6">
                                <label> Nome Completo: </label>
                                <input type="text" class="form-control" placeholder="Nome" required name="nome" id="nome" minlength="5">
                            </div>
                            <div class="form-group col-6 ">
                                <label> Email: </label>
                                <input type="text" class="form-control" placeholder="exemplo@email.com" required 
                                       name="EMAIL" id="email" onblur="checarEmailCliente('formCad', 'EMAIL')">
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-6">
                                <label> Data de Nascimento: </label>
                                <input type="text" class="form-control" placeholder="00/00/0000" required name="DATA" id="DATA"  onkeyup=""
                                       >
                            </div>
                            <div class="form-group col-6 ">
                                <label> Celular: </label>
                                <input type="text" class="form-control" placeholder="(00)0000-0000" required
                                       id="CELULAR" name="CELULAR" id="celular" maxlength="15">
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-6 ">
                                <label> CPF: </label>
                                <input type="text" class="form-control" placeholder="###.###.###-##" required name="CPF" id="CPF"
                                       minlength="" onfocus="validaCPFCliente()">
                            </div>
                            <div class="form-group col-6 ">
                                <label> Usuário: </label>
                                <input type="text" class="form-control" placeholder="Usuário/Login" required name="usuario" id="username">
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-6 ">
                                <label> Senha: </label>
                                <input type="password" class=" form-control" placeholder="*********" required name="senha1" id="Senha">
                            </div>
                            <div class="form-group col-6 ">
                                <label> Confirmar Senha: </label>
                                <input type="password" class=" form-control" placeholder="*********" required name="senha2" id="Senha"
                                       onblur="checarSenhaCliente('formCad', 'senha1', 'senha2')">
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class ="form group col-3 ">
                                <button type="reset" class="btn btn-primary" id="btn-form" data-dismiss="modal"> Cancelar </button>
                            </div>
                            <div class ="form group   col-3">
                                <button type="submit" class="btn btn-primary btn-confirmar-cliente" id="btn-form" > Confirmar </button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <!-- Modal LOGOUT-->
        <div class="modal fade" id="exampleModalCenter3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                <div class="modal-content" style="background: transparent; border:none; max-width:330px; height: 200px;margin-left:100px;">

                    <div class="form-singin">
                        <div class="" id="" >
                            <form  action = "${pageContext.request.contextPath}/logoutServlet" method = "post" style="text-align: center;">
                                <i class="fa fa-journal-whills"></i>
                                <h1 class="h3 mb-3 font-weight-normal">Deseja sair?</h1>
                                <br>
                                <button class="btn btn-lg btn-primary btn-block" type="submit" id="btn-singin"> Logout <i class="fas fa-sign-in-alt"></i> </button>
                            </form>
                            <br/>

                            <!-- ATUALIZAR CADASTRO FORM -->
                            <button data-toggle="modal" data-target="#exampleModalCenter4" class="btn btn-lg btn-primary btn-block" id="btn-singin"> Atualizar Cadastro <i class="fas fa-edit"></i> </button>

                            <div class="modal fade" id="exampleModalCenter4" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
                                 onload="">
                                <div class="modal-dialog modal-dialog-centered-lg" role="document" style="color: black;">
                                    <div class="modal-content" style="background: transparent; border:none; width:600px; height:450px; margin-top:120px;">

                                        <form name="formCadUpdate" class="form-type form-singin-cad" method="post" action="${pageContext.request.contextPath}/editarUsuarioClienteServlet" 
                                              accept-charset="UTF-8">
                                            <div class="row justify-content-center">
                                                <div class="form-group col-3">
                                                    <h2>Usuário</h2>
                                                </div>
                                            </div>
                                            <div id="erroUpdate" class="alert alert-danger" role="alert" style='display:none'>
                                                <span id='mensagemValUpdate'></span> invalido!
                                            </div>
                                            <div class="row justify-content-center">
                                                <input type="hidden" value="${usuario.getID()}" name="IDUpdate">
                                                <div class="form-group col-6">
                                                    <label> Nome Completo: </label>
                                                    <input type="text" class="form-control" placeholder="Nome" required name="nomeUpdate" id="nome" minlength="5"
                                                           value="${usuario.getNome()}">
                                                </div>
                                                <div class="form-group col-6 ">
                                                    <label> Email: </label>
                                                    <input type="text" class="form-control" placeholder="exemplo@email.com" required 
                                                           name="EMAILUpdate" id="emailUpdate" onblur="checarEmailUpdate('formCadUpdate', 'EMAIL')"
                                                           value="${usuario.getEmail()}">
                                                </div>
                                            </div>
                                            <div class="row justify-content-center">
                                                <div class="form-group col-6">
                                                    <label> Data de Nascimento: </label>
                                                    <input type="text" class="form-control" placeholder="00/00/0000" required name="DATAUpdate" id="DATAUpdate"  onkeyup=""
                                                           value="${usuario.getDataNascimento()}">
                                                </div>
                                                <div class="form-group col-6 ">
                                                    <label> Celular: </label>
                                                    <input type="text" class="form-control" placeholder="(00)0000-0000" required
                                                           id="CELULARUpdate" name="CELULARUpdate" maxlength="15"
                                                           value="${usuario.getCelular()}">
                                                </div>
                                            </div>
                                            <div class="row justify-content-center">
                                                <div class="form-group col-6 ">
                                                    <label> CPF: </label>
                                                    <input type="text" class="form-control" placeholder="###.###.###-##" required name="CPFUpdate" id="CPFUpdate"
                                                           minlength="" onfocus="validaCPFUpdate()" value="${usuario.getCPF()}">
                                                </div>
                                                <div class="form-group col-6 ">
                                                    <label> Usuário: </label>
                                                    <input type="text" class="form-control" placeholder="Usuário/Login" required name="usuarioUpdate" id="username"
                                                           value="${usuario.getUsuario()}">
                                                </div>
                                            </div>
                                            <div class="row justify-content-center">
                                                <div class="form-group col-6 ">
                                                    <label> Senha: </label>
                                                    <input type="password" class=" form-control" placeholder="*********" name="senha1Update" id="Senha"
                                                           value="">
                                                </div>
                                                <div class="form-group col-6 ">
                                                    <label> Confirmar Senha: </label>
                                                    <input type="password" class=" form-control" placeholder="*********" name="senha2" id="Senha"
                                                           onblur="checarSenhaUpdate('formCadUpdate', 'senha1', 'senha2')">
                                                </div>
                                            </div>
                                            <div class="row justify-content-center">
                                                <div class ="form group col-3 ">
                                                    <button type="reset" class="btn btn-primary" id="btn-form" data-dismiss="modal"> Cancelar </button>
                                                </div>
                                                <div class ="form group   col-3">
                                                    <button type="submit" class="btn btn-primary btn-confirmar-update" id="btn-form" > Confirmar </button>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" 
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toggles/2.0.4/toggles.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery.mask.min.js"></script>

        <script type="text/javascript">

                                                               function testaLogin() {
                                                                   if ($('#loginInput').val() === 'cliente') {
                                                                       $('#produtos').css('display', 'none');
                                                                       $('#clientes').css('display', 'none');
                                                                       $('#usuarios').css('display', 'none');

                                                                       /* CPF DISABLE*/
                                                                       $('#CPFUpdate').css("background", '#eee');
                                                                       $('#CPFUpdate').css("pointer-events", 'none');
                                                                       $('#CPFUpdate').css("touch-action", 'none');

                                                                       /* EMAIL DISABLE*/
                                                                       $('#emailUpdate').css("background", '#eee');
                                                                       $('#emailUpdate').css("pointer-events", 'none');
                                                                       $('#emailUpdate').css("touch-action", 'none');

                                                                   } else if ($('#loginInput').val() === 'administrador') {
                                                                       $('#produtos').css('display', 'block');
                                                                       $('#clientes').css('display', 'block');
                                                                       $('#usuarios').css('display', 'block');
                                                                   } else if ($('#loginInput').val() === 'estoquista') {
                                                                       $('#produtos').css('display', 'block');
                                                                       $('#clientes').css('display', 'none');
                                                                       $('#usuarios').css('display', 'none');
                                                                                                                                              /* CPF DISABLE*/
                                                                       $('#CPFUpdate').css("background", '#eee');
                                                                       $('#CPFUpdate').css("pointer-events", 'none');
                                                                       $('#CPFUpdate').css("touch-action", 'none');

                                                                       /* EMAIL DISABLE*/
                                                                       $('#emailUpdate').css("background", '#eee');
                                                                       $('#emailUpdate').css("pointer-events", 'none');
                                                                       $('#emailUpdate').css("touch-action", 'none');
                                                                   }
                                                               }


                                                               $(document).ready(function () {
                                                                   var campoCPF = $("#CPF");
                                                                   campoCPF.mask('000.000.000-00', {reverse: true});
                                                                   var campoData = $("#DATA");
                                                                   campoData.mask('99/99/9999');
                                                                   var campoCelular = $("#CELULAR");
                                                                   campoCelular.mask('(99)999999999');
                                                               });
                                                               $(document).ready(function () {
                                                                   var campoCPF = $("#CPFUpdate");
                                                                   campoCPF.mask('000.000.000-00', {reverse: true});
                                                                   var campoData = $("#DATAUpdate");
                                                                   campoData.mask('99/99/9999');
                                                                   var campoCelular = $("#CELULARUpdate");
                                                                   campoCelular.mask('(99)999999999');
                                                               });



        </script>
    </body>

</html>
