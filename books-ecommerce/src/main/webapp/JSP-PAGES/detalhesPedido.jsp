<%-- 
    Document   : detalhesPedido
    Created on : 29/05/2020, 06:59:22
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

                        <h3>Detalhes do Pedido</h3>
                        <!-- ------------ALERTA----------- -->
                        <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                            Endereço Removido
                        </div>
                        <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                            Ocorreu uma falha ao remover endereço!
                        </div>
                        <input id="alertaR" type="hidden" value="${alertaResposta}">
                        <!-- ------------ FIM ALERTA----------- -->
                        <h3>Pedido</h3>
                        <div class="col-12" id="style-1" style="min-height:350px ;max-height:800px;">
                            <table class="table">
                                <tr>
                                </tr>
                                <tbody>
                                    <tr>
                                        <th scope="col"><h3>Código do Pedido: <c:out value="${Pedido.getID()}"/></h3></th>
                                    </tr>
                                    <tr>
                                        <th scope="col">Data</th>
                                        <td><p>
                                                <c:out value="${Pedido.formatarData(Pedido.getDataPedido())}"/>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">Valor</th>
                                        <td><c:out value="${Pedido.formatarValor(Pedido.getValor())}"/></td>
                                    </tr>
                                    <!-- TD DE DETALHES DE PEDIDO -->
                                    <tr>
                                        <th scope="col">Status</th>
                                        <td>
                                            <c:out value="${Pedido.getStatus()}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">Forma de Pagamento</th>
                                        <td>
                                            <c:out value="${Pedido.getFormaDePagamento()}"/>
                                        </td>
                                    </tr>
                                    <!-- FIM TD DE DETALHES DE PEDIDO -->
                                    </tr>
                                </tbody> 
                            </table>
                        </div>
                        <h3>Itens</h3>
                        <p style="color:black;">Data: ${dataAtual}| Itens: ${quantidade}| Valor Total: ${valorTotal}</p>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="row">Capa</th>
                                    <th scope="row">Título/Autor</th>
                                    <th scope="row">Valor Unitário</th>
                                    <th scope="row">Quantidade</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items ="${listaProdutoPedido}" var="produto">
                                    <tr>
                                        <td>
                                            <form method="post" action="${pageContext.request.contextPath}/detalhesProdutoServlet">
                                                <div>
                                                    <input style="max-width:80px;margin:5px;" type="image" src="${produto.getImagem()}" value="submit">
                                                    <input name="ID" type="hidden" value="${produto.getID()}"/>
                                                </div>
                                            </form>
                                        </td>
                                        <td style="max-width:250px;">
                                            <p>
                                                <c:out value="${produto.getTitulo()}"/>
                                            </p>
                                            <p>
                                                <c:out value="${produto.getAutor()}"/>
                                            </p>
                                        </td>
                                        <td><c:out value="${produto.formatarValor(produto.getValorVenda())}"/></td>
                                        <!-- TD DE ACRESCIMO DE PRODUTO -->
                                        <td>
                                            ${produto.getQuantidade()}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody> 
                        </table>
                        <h3>Endereço de Entrega</h3>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>
                                        CEP: ${EnderecoEntregaPedido.getCEP()}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cidade: ${EnderecoEntregaPedido.getCidade()}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Estado: ${EnderecoEntregaPedido.getEstado()}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Endereço: ${EnderecoEntregaPedido.getEndereco()}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Complemento: ${EnderecoEntregaPedido.getComplemento()}
                                    </td>
                                </tr>
                            </tbody> 
                        </table>

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

            function displayPagamentoCartao() {
                $('#creditCard').css("display", "block");
                $('#boleto').css("display", "none");
                $('#paymentMethod').val("Cartão");
            }
            ;
            function displayPagamentoBoleto() {
                $('#boleto').css("display", "block");
                $('#creditCard').css("display", "none");
                $('#paymentMethod').val("Boleto");
            }
            ;

            function setIDEndereco(ID) {
                $('#addressID').val(ID);
            }
            ;



        </script>
    </body>
</html>