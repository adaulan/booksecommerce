<%-- 
    Document   : editarEndereco
    Created on : 09/05/2020, 23:31:20
    Author     : Adaulan 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/booksicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Endereço</title>
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
                  method="post" action="${pageContext.request.contextPath}/editarEnderecoServlet" 
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
                        <input type="hidden" value="${endereco.getID()}" name="ID">
                        <h2>Endereço</h2>
                    </div>
                </div>
                <div id="erro" class="alert alert-danger" role="alert" style='display:none'>
                    <span id='mensagemVal'></span> invalido!
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4 ">
                        <label> CEP: </label>
                        <input type="text" class="form-control" placeholder="00000-000" required name="cep" id="cep" 
                               maxlength="10" onkeypress="return onlynumber();" onkeyup="mascara('#####-###', this, event)"
                               value="${endereco.getCEP()}">
                    </div>
                    <div class="form-group col-4 ">
                        <label> Cidade: </label>
                        <input type="text" class="form-control" placeholder="Chicago" required name="cidade" 
                               id="cidade" maxlength="255" value="${endereco.getCidade()}">
                    </div>
                    <div class="form-group col-4">
                        <label> Estado: </label>
                        <select class="form-control" name="estado" id="estado" required >
                            <option selected>Escolha...</option>
                            <option selected  value="${endereco.getEstado()}">${endereco.getEstado()}</option>
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AP">Amapá</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="DF">Distrito Federal</option>
                            <option value="ES">Espírito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Grande do Sul</option>
                            <option value="RO">Rondônia</option>
                            <option value="RR">Roraima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SE">Sergipe</option>
                            <option value="TO">Tocantins</option>
                        </select>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-8 ">
                        <label> Endereço: </label>
                        <input type="text" class="form-control" placeholder="1234 Main St" name="endereco" 
                               id="endereco" required maxlength="255" value="${endereco.getEndereco()}">
                    </div>
                    <div class="form-group col-4">
                        <label> Complemento: </label>
                        <input type="text" class="form-control" placeholder="Apartament" name="complemento" 
                               id="complemento" required maxlength="20" value="${endereco.getComplemento()}">
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
