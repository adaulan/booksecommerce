<%-- 
    Document   : consultaUsuario
    Created on : 08/04/2020, 21:09:31
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
        <title>Consulta de Usuários</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style type="text/css">

    </style>

    <jsp:include page="navbar.jsp"/>

    <body onload="mensagemCadastro()">

        <div class="heading-bar"></div>
        <div class="clear"></div>
        <!-- INICIO DO BODY -->
        <div id="" class="text-center" style="margin-top: 20px;">
            <form id="FadeForm" class="form-type" 
                  action="${pageContext.request.contextPath}/consultaUsuarioSistemaServlet" method = "post" accept-charset="UTF-8"
                  style="max-width: 1300px; height:auto; max-height: 800px;">
                <!-- ALERTA DE SUCESSO OU FALHA -->
                <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                    Atualizado com Sucesso!!
                </div>
                <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                    Ocorreu uma falha ao atualizar produto!
                </div>
                <input id="alertaR" type="hidden" value="${alertaResposta}">

                <!-- TABELA DE CONSULTA -->
                <div class="row justify-content-center">
                    <h2>Consulta</h2>
                </div>
                <div class="row justify-content-center">
                    <div class="input-group col-12">
                        <input type="text" class="form-control" placeholder="O que você busca?" 
                               aria-label="Recipient's username" aria-describedby="button-addon2" name="Busca">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Pesquisar <i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row justify-content-center">
                    <div class="form-group col-12">
                        <div class="table-wrapper-scroll-y my-custom-scrollbar" id="style-1" style="height:500px;">
                            <table class="table" style="color: white;">
                                <thead>
                                    <tr>
                                        <th scope="col">Nome</th>
                                        <th scope="col">Usuario</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Tipo</th>
                                        <th scope="col">Data de Nascimento</th>
                                        <th scope="col">Celular</th>
                                        <th scope="col">Opções</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- ESSE FORM É UM FORM QUE QUEBRA PARA RESOLVER UM BUG! --%>
                                <form></form>
                                <%-- FIM --%>
                                <c:forEach items ="${listaUsuario}" var="usuario">
                                    <tr>

                                        <td style="max-width:250px;"><c:out value="${usuario.getNome()}"/></td>
                                        <td><c:out value="${usuario.getUsuario()}"/></td>
                                        <td><c:out value="${usuario.getEmail()}"/></td>
                                        <td><c:out value="${usuario.getTipo()}"/></td>
                                        <td><c:out value="${usuario.getDataNascimento()}"/></td>
                                        <td><c:out value="${usuario.getCelular()}"/></td>


                                        <!-- TD DE EDIÇÃO DE USUARIO -->
                                        <td>
                                            <form method="get" action="${pageContext.request.contextPath}/editarUsuarioSistemaServlet">
                                                <input type="hidden" value="${usuario.getID()}" name="ID">
                                                <input name="tipo" type="hidden" value="${tipo}" id="tipoUsuario"/>
                                                <!-- BOTÃO DE ADMIN -->
                                                <button class="btn-form-button edit-button" id="btn-form-search"  type="submit" alt="Editar Produto"><i class="fa fa-edit"></i></button>
                                            </form>
                                        </td>

                                        <!-- TD DE ENDEREÇO DO USUARIO -->
                                        <td><input type="hidden" value="${usuario.getID()}" name="ID">

                                            <input name="tipo" type="hidden" value="${tipo}" id="tipoUsuario"/>
                                            <!-- BOTÃO DE ENDEREÇO -->
                                            <button type="button" class="btn" data-toggle="modal" data-target="#modalEndereco${usuario.getID()}" id="btn-form-search"> 
                                                <i class="fas fa-address-card"></i>
                                            </button>

                                            <!-- MODAL OPÇÕES DE ENDEREÇO-->
                                            <div class="modal fade" id="modalEndereco${usuario.getID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                                                    <div class="modal-content" style="border:none; max-width:330px; max-height: 380px;margin-left:100px;">
                                                        <input type="hidden" value="${usuario.getID()}" name="ID">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLongTitle">Opções de Endereço</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="row justify-content-center">
                                                            <div class="form-group col-12">
                                                                <form method="get" action="${pageContext.request.contextPath}/cadastrarEnderecoServlet">
                                                                    <input type="hidden" value="${usuario.getID()}" name="ID">
                                                                    <div>
                                                                        <button type="submit" class="btn btn-md btn-warning btn-block">Cadastrar Novo</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="row justify-content-center">
                                                            <div class="form-group col-12">
                                                                <form method="get" action="${pageContext.request.contextPath}/consultaEnderecoServlet">
                                                                    <input type="hidden" value="${usuario.getID()}" name="ID">
                                                                    <div>
                                                                        <button type="submit" class="btn btn-md btn-warning btn-block">Visualizar Endereços</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- FIM MODAL -->   

                                        </td>
                                        <!-- FIM TD -->   
                                        <!-- TD DE EXCLUSÃO DE USUARIO -->
                                        <td><input type="hidden" value="${usuario.getID()}" name="ID">
                                            <form  method="post" action="${pageContext.request.contextPath}/deletarUsuarioServlet">

                                                <!-- Button trigger modal -->
                                                <button type="button" class="btn" data-toggle="modal" data-target="#modalExclusao${usuario.getID()}" id="btn-form-search"> 
                                                    <i class="fa fa-times"></i>
                                                </button>

                                                <!-- MODAL CONFIRMAR EXCLUSÃO-->
                                                <div class="modal fade" id="modalExclusao${usuario.getID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                                                        <div class="modal-content">
                                                            <input type="hidden" value="${usuario.getID()}" name="ID">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLongTitle">Deletar Usuario</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Tem certeza que deseja deletar o Usuario ${usuario.getNome()}?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                                <button type="submit" class="btn btn-warning">Confirmar</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- FIM MODAL -->
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- FIM DO BODY -->
        <div class="footer-bar"></div>

        <!--FOOTER -->
        <footer>
            <div class="footerBox">
                <h3>Criadores</h3>
                <ul>
                    <li>
                        <p><a href="#">Adaulan Gomes</a></p>
                    </li>
                    <li>
                        <p><a href="#">Vitor Rodrigues</a></p>
                    </li>
                </ul>
            </div>


            <div class="footerBox">
                <h3>Sobre</h3>
                <ul>
                    <li>
                        <p><a href="#">Quem somos</a></p>
                    </li>
                    <li>
                        <p><a href="#">Trabalhe Conosco</a></p>
                    </li>
                    <li>
                        <p><a href="#">Termos de Compra</a></p>
                    </li>
                    <li>
                        <p><a href="#">Vale presente</a></p>
                    </li>
                </ul>
            </div>

            <div class="footerBox">
                <h3>Social</h3>
                <ul>
                    <li>
                        <p><a href="#">Facebook</a></p>
                    </li>
                    <li>
                        <p><a href="#">Twitter</a></p>
                    </li>
                    <li>
                        <p><a href="#">Instagram</a></p>
                    </li>
                    <li>
                        <p><a href="#">YouTube</a></p>
                    </li>
                </ul>
            </div>

            <hr>

            <div id="copyrightBox">
                <p id="copyright">
                    As ofertas são válidas por tempo determinado e/ou enquanto durarem os estoques. Nosso serviço de entregas não permite encomendas feitas com endereçamento de Caixa Postal.</p>
                <p id="copyright"> 
                    Os preços apresentados no site não são obrigatoriamente iguais aos apresentados na rede de lojas físicas do Projeto X, e somente são válidos para as compras efetuadas no ato de sua exibição.
                </p>
                <p id="copyright"> 
                    Projeto X é uma empresa do grupo Projeto X S.A., CNPJ nº 54.345.056/0054-07, Av Faria Lima, nº 15461, São Paulo – SP.
                </p>
            </div>
        </footer>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/swiper.min.js"></script>
        <script src="${pageContext.request.contextPath}/JSP-STYLES/JS/script.js"></script>   
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>
