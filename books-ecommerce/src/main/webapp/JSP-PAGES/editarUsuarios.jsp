<%-- 
    Document   : editarUsuarios
    Created on : 08/04/2020, 22:23:49
    Author     : Adaulan 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/booksicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edição de Usuário</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/jquery-ui.css"/>

    </head>
    <jsp:include page="navbar.jsp"/>

    <body onload="mensagemCadastro()">

        <div class="heading-bar"></div>

        <!-- INICIO DO BODY -->

        <div id="body-changes" class="text-center">

            <form id="fadeForm" class="form-type needs-validation" 
                  method="post" action="${pageContext.request.contextPath}/editarUsuarioSistemaServlet" 
                  accept-charset="UTF-8" name="usuarioForm">

                <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                    Cadastrado com Sucesso!!
                </div>
                <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                    Ocorreu uma falha ao cadastrar usuario!
                </div>
                <input id="alertaR" type="hidden" value="${alertaResposta}">
                <!-- INICIO CADASTRO DE USUARIO -->

                <div class="row justify-content-center">
                    <div class="form-group col-6">
                        <h2>Usuário</h2>
                    </div>
                    <input type="hidden" value="${usuario.getID()}" name="ID">
                </div>
                <div id="erro" class="alert alert-danger" role="alert" style='display:none'>
                    <span id='mensagemVal'></span> invalido!
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4">
                        <label> Nome Completo: </label>
                        <input type="text" class="form-control" placeholder="Nome" required name="nome" id="nome"
                               minlength="5" value="${usuario.getNome()}">
                    </div>
                    <div class="form-group col-4 ">
                        <label> CPF: </label>
                        <input type="text" class="form-control" placeholder="###.###.###-##" required name="CPF" id="cpf"
                               minlength="" onfocus="validaCPF()" value="${usuario.getCPF()}">
                    </div>
                    <div class="form-group col-4">
                        <label> Data de Nascimento: </label>
                        <input type="text" class="form-control" placeholder="00/00/0000" required name="dataNascimento"
                               id="data" maxlength="10" onfocus="" value="${usuario.getDataNascimento()}">
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4 ">
                        <label> Celular: </label>
                        <input type="text" class="form-control" placeholder="(00)0000-0000" required
                               id="celular" name="celular" id="celular" maxlength="15" value="${usuario.getCelular()}">
                    </div>
                    <div class="form-group col-4 ">
                        <label> Email: </label>
                        <input id="email" type="text" class="form-control" placeholder="exemplo@email.com" name="email"
                               onblur="checarEmail('usuarioForm', 'email')" value="${usuario.getEmail()}" required >
                    </div>
                    <div class=" form-group col-4 ">
                        <label> Cargo: </label>
                        <select class="form-control" name="cargo" id="cargo" required >
                            <option selected>Escolha...</option>
                            <c:forEach  var="cargo" begin="0">
                                <option selected  value="${usuario.getTipo()}">${usuario.getTipo()}</option>
                                <option  value="administrador">Administrador</option>
                                <option  value="estoquista">Estoquista</option>
                                <option  value="cliente">Cliente</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4 ">
                        <label> Usuário: </label>
                        <input type="text" class="form-control" placeholder="Username/Login" required name="usuario" id="usuario"
                               value="${usuario.getUsuario()}">
                    </div>
                    <div class="form-group col-4 ">
                        <label> Senha: </label>
                        <input type="password" class=" form-control" placeholder="*********" required name="senha" id="senha"
                               value="${usuario.getSenha()}">
                    </div>
                    <div class="form-group col-4 ">
                        <label> Confirmar Senha: </label>
                        <input type="password" class=" form-control" placeholder="*********" required name="confirmaSenha" 
                               id="confirmaSenha" onblur="checarSenha('usuarioForm', 'senha', 'confirmaSenha')" value="${usuario.getSenha()}">
                    </div>

                </div>    
                <div class="row ">
                    <div class ="form group col-9 ">
                    </div>
                    <div class ="form group   col-sm-3 ">
                        <button type="reset" class="btn btn-primary" id="btn-form"> Cancelar </button>
                        <button type="submit" class="btn btn-primary btn-confirmar" id="btn-form" > Confirmar </button>
                    </div>
                </div>


            </form>
        </div>
        <!-- FIM FORM CADASTRO DE USUARIO -->


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
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery.mask.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery-ui.js"></script>
        <script type="text/javascript">
                                   $(document).ready(function () {
                                       var campoCPF = $("#cpf");
                                       
                                       campoCPF.mask('000.000.000-00', {reverse: true});
                                       var campoData = $("#data");
                                       campoData.mask('99/99/9999');
                                       var campoCelular = $("#celular");
                                       campoCelular.mask('(99)999999999');
                                   });



        </script>
    </body>
</html>