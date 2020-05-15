<%-- 
    Document   : finalizarCompra
    Created on : 15/05/2020, 00:06:31
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
        <title>Detalhes do Pedido</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style type="text/css">
        #body-details {
            margin:20px;
            max-height: 650px;
            max-width: 1280px;
            width:100%;
            font-family: HomepageBaukasten-Book;
        }
    </style>

    <jsp:include page="navbar.jsp"/>

    <body>
        <div class="heading-bar"></div>
        <!-- INICIO DO BODY DA PÁGINA -->
        <div>
            <div class="form-type col" id="FadeForm" style="margin: 1%; background-color:white; width:98%;">

                <div class="row align-items-center" style="padding:3%;">
                    <div class="col-12" style="">

                        <h3>Endereço de Entrega</h3>
                        <p style="color:black;">Escolha o Endereço para Entrega</p>

                        <!-- ------------ALERTA----------- -->
                        <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                            Endereço Removido
                        </div>
                        <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                            Ocorreu uma falha ao remover endereço!
                        </div>
                        <input id="alertaR" type="hidden" value="${alertaResposta}">
                        <!-- ------------ FIM ALERTA----------- -->

                        <div class="table-wrapper-scroll-y my-custom-scrollbar" id="style-1" style="min-height:200px ;max-height:800px;">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Escolha</th>
                                        <th scope="col">CEP</th>
                                        <th scope="col">Endereço</th>
                                        <th scope="col">Cidade</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Complemento</th>
                                        <th scope="col">Opções</th>
                                        <!-- MODAL DE CADASTRO DE ENDEREÇO -->
                                        <th>
                                            <button style="width:50px; height:40px;" class="btn-form-button"  data-toggle="modal" data-target="#modalAdicionar" id="btn-form-search" alt="Adicionar Produto"><i class="fas fa-plus-circle"></i> </button>
                                            <div class="modal fade" id="modalAdicionar" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
                                                 onload="masks()">
                                                <div class="modal-dialog modal-dialog-centered-lg" role="document" style="color: black;">
                                                    <div class="modal-content" style="background: transparent; border:none; width:600px; height:450px; margin-top:120px;">

                                                        <form id="fadeForm" class="form-type needs-validation col" 
                                                              method="post" action="${pageContext.request.contextPath}/cadastrarEnderecoServlet" 
                                                              accept-charset="UTF-8" name="usuarioForm" style="margin: 1%; background-color:white; width:98%;color:black;">

                                                            <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                                                                Cadastrado com Sucesso!!
                                                            </div>
                                                            <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                                                                Ocorreu uma falha ao cadastrar usuario!
                                                            </div>
                                                            <input id="alertaR" type="hidden" value="${alertaResposta}">
                                                            <!-- INICIO CADASTRO DE USUARIO -->
                                                            <div class="row justify-content-center">
                                                                <div class="form-group col-4">
                                                                    <input type="hidden" value="${IDUsuario}" name="ID"> 
                                                                    <input type="hidden" value="frontEnd" name="frontEnd"> 
                                                                    <h3>Endereço</h3>
                                                                </div>
                                                            </div>
                                                            <div id="erro" class="alert alert-danger" role="alert" style='display:none'>
                                                                <span id='mensagemVal'></span> invalido!
                                                            </div>
                                                            <div class="row justify-content-center">
                                                                <div class="form-group col-4 ">
                                                                    <label> CEP: </label>
                                                                    <input type="text" class="form-control" placeholder="00000-000" required name="cep" id="cep" maxlength="10" onkeypress="return onlynumber();" onkeyup="mascara('#####-###', this, event)">
                                                                </div>
                                                                <div class="form-group col-4 ">
                                                                    <label> Cidade: </label>
                                                                    <input type="text" class="form-control" placeholder="São Paulo" required name="cidade" id="cidade" maxlength="255">
                                                                </div>
                                                                <div class="form-group col-4">
                                                                    <label> Estado: </label>
                                                                    <select class="form-control" name="estado" id="estado" required >
                                                                        <option selected>Escolha...</option>
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
                                                                <div class="form-group col-12 ">
                                                                    <label> Endereço: </label>
                                                                    <input type="text" class="form-control" placeholder="1234 Main St" name="endereco" id="endereco" required maxlength="255">
                                                                </div>
                                                            </div>
                                                            <div class="row justify-content-center">
                                                                <div class="form-group col-12">
                                                                    <label> Complemento: </label>
                                                                    <input type="text" class="form-control" placeholder="Apartament" name="complemento" id="complemento"  maxlength="20">
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
                                        </th>
                                        <!-- FIM MODAL DE CADASTRO DE ENDEREÇO -->
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- ESSE FORM É UM FORM QUE QUEBRA PARA RESOLVER UM BUG! --%>
                                <form></form>
                                <%-- FIM --%>
                                <c:forEach items ="${listaEndereco}" var="endereco">
                                    <tr>
                                        <td><input type="radio" name="ID" value="${endereco.getID()}"></td>
                                        <td><c:out value="${endereco.getCEP()}"/></td>
                                        <td style="max-width:250px;"><c:out value="${endereco.getEndereco()}"/></td>
                                        <td><c:out value="${endereco.getCidade()}"/></td>
                                        <td><c:out value="${endereco.getEstado()}"/></td>
                                        <td><c:out value="${endereco.getComplemento()}"/></td>


                                        <!-- TD DE EDIÇÃO DE ENDERECO -->
                                        <td><button style="width:50px; height:40px;" class="btn-form-button"  data-toggle="modal" data-target="#modalEditar${endereco.getID()}" id="btn-form-search" alt="Editar Endereço"><i class="fa fa-edit"></i> </button>
                                            <div class="modal fade" id="modalEditar${endereco.getID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
                                                 onload="masks()">
                                                <div class="modal-dialog modal-dialog-centered-lg" role="document" style="color: black;">
                                                    <div class="modal-content" style="background: transparent; border:none; width:600px; height:450px; margin-top:120px;">

                                                        <form id="fadeForm" class="form-type needs-validation" 
                                                              method="post" action="${pageContext.request.contextPath}/editarEnderecoServlet" 
                                                              accept-charset="UTF-8" name="usuarioForm" style="margin: 1%; background-color:white; width:98%;color:black;">

                                                            <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                                                                Cadastrado com Sucesso!!
                                                            </div>
                                                            <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                                                                Ocorreu uma falha ao cadastrar usuario!
                                                            </div>
                                                            <input id="alertaR" type="hidden" value="${alertaResposta}">
                                                            <!-- INICIO EDIÇÃO DE ENDEREÇO -->
                                                            <div class="row justify-content-center">
                                                                <div class="form-group col-4">
                                                                    <input type="hidden" value="${endereco.getID()}" name="ID">  
                                                                    <input type="hidden" value="frontEnd" name="frontEnd"> 
                                                                    <h3>Endereço</h3>
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
                                                                <div class="form-group col-12 ">
                                                                    <label> Endereço: </label>
                                                                    <input type="text" class="form-control" placeholder="1234 Main St" name="endereco" 
                                                                           id="endereco" required maxlength="255" value="${endereco.getEndereco()}">
                                                                </div>

                                                            </div>
                                                            <div class="row justify-content-center">
                                                                <div class="form-group col-12">
                                                                    <label> Complemento: </label>
                                                                    <input type="text" class="form-control" placeholder="Apartament" name="complemento" 
                                                                           id="complemento" required maxlength="20" value="${endereco.getComplemento()}">
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

                                        </td> 
                                        <!-- TD DE EXCLUSAO DE ENDERECO -->
                                        <td >
                                            <form  method="post" action="${pageContext.request.contextPath}/deletarEnderecoServlet">
                                                <input type="hidden" value="${endereco.getID()}" name="ID">
                                                <input type="hidden" value="frontEnd" name="frontEnd">
                                                <input type="hidden" value="redirectToFinalizarCompra" name="finalizarCompra">
                                                <!-- Button trigger modal -->
                                                <button style="width:50px; height:40px;" type="button" class="btn-form-button" data-toggle="modal" data-target="#modalExclusao${endereco.getID()}" id="btn-form-search"> 
                                                    <i class="fa fa-times"></i>
                                                </button>

                                                <!-- MODAL CONFIRMAR EXCLUSÃO-->
                                                <div class="modal fade" id="modalExclusao${endereco.getID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                                                        <div class="modal-content">
                                                            <input type="hidden" value="${endereco.getID()}" name="ID">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLongTitle">Deletar Endereço</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Tem certeza que deseja deletar o Endereço: ${endereco.getEndereco()}?
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
                    <div class="col">

                    </div>
                    <div class="col" style="padding:1%;color:black;">
                        <div class="col-12" style="">
                            <h3>Forma de Pagamento</h3>
                        </div>
                        <p style="color:black;margin-top:20px;">Cartão de Crédito</p>
                        <div class="row justify-content-start">
                            <div class="form-group col-3">
                                <label> Nome no cartão: </label>
                                <input type="text" class="form-control" placeholder="Nome escrito no cartão" 
                                       id="ProdutoName" name="NomeLivro" required>
                            </div>
                            <div class="form-group col-3">
                                <label> Número </label>
                                <input type="text" class="form-control" placeholder="4040 6054 1503 6587" id="ProdutoName" name="Quantidade"
                                       required>
                            </div>
                        </div>
                        <div class="row justify-content-start">
                            <div class="form-group col-2">
                                <label> Expiração: </label>
                                <input type="text" class="form-control" placeholder="Data de Expiração" 
                                       id="ProdutoName" name="NomeLivro" required>
                            </div>
                            <div class="form-group col-1">
                                <label> CVV </label>
                                <input type="text" class="form-control" placeholder="292" id="ProdutoName" name="Quantidade"
                                       required>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- FIM DO BODY DA PÁGINA -->
            <!--FOOTER -->
            <div class="footer-bar"></div>
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
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/swiper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/script.js"></script>
        <script type="text/javascript">
                                                                               $(document).ready(function () {

                                                                                   if ($('#alertaR').val() === "sucesso") {
                                                                                       $('#RespostaSucesso').css("display", "block");
                                                                                       setTimeout(function () {
                                                                                           $('#RespostaSucesso').css("display", "none");
                                                                                       }, 5000);
                                                                                   } else if ($('#alertaR').val() === "falha") {
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
                                                                               });


        </script>
    </body>
</html>
