<%-- 
    Document   : consultaCarrinho
    Created on : 20/04/2020, 15:21:42
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
                    <div class="col-8" style="">

                        <h3>Itens no Carrinho</h3>
                        <p style="color:black;">Data: ${dataAtual}| Itens: ${quantidadeDeItens}| Valor: ${valorTotalNoCarrinho}</p>
                        <div class="table-wrapper-scroll-y my-custom-scrollbar" id="style-1" style="min-height:700px ;max-height:800px;">
                            <table class="table">
                                <tbody>
                                    <c:forEach items ="${listaCarrinho}" var="produto">
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
                                                <form method="post" action="${pageContext.request.contextPath}/editarNoCarrinhoServlet">
                                                    <input type="hidden" value="${produto.getID()}" name="ID">
                                                    <input type="number" name="quantidade" min="1" max="100" value="${produto.getQuantidade()}">
                                                    <button type="submit" id="primaryButton${produto.getID()}" onclick="document.getElementById('primaryButton').click()"
                                                            style="display:none;"/>
                                                </form>
                                            </td>
                                            <td>
                                                <button onclick="document.getElementById('primaryButton${produto.getID()}').click()" class="btn-form-button edit-button" id="btn-form-search"  type="button" alt="Editar Produto"><i class="fas fa-plus-circle"></i></button>
                                            </td>   
                                            <!-- FIM TD DE ACRESCIMO DE PRODUTO -->
                                            <!-- TD DE EXCLUSÃO DE PRODUTO -->
                                            <td>
                                                <form  method="post" action="${pageContext.request.contextPath}/deletarProdutoServlet">
                                                    <input type="hidden" value="${produto.getID()}" name="ID">
                                                    <!-- Button trigger modal -->
                                                    <button type="button" class="btn btn-excluir" data-toggle="modal" data-target="#modalExclusao${produto.getID()}" id="btn-form-search"> 
                                                        <i class="fa fa-times"></i>
                                                    </button>

                                                    <!-- MODAL CONFIRMAR EXCLUSÃO-->
                                                    <div class="modal fade" id="modalExclusao${produto.getID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLongTitle">Deletar Produto</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div>
                                                                    <input style="max-height: 150px; margin-top:20px;" type="image" src="${produto.getImagem()}" value="submit">
                                                                    <input name="ID" type="hidden" value="${produto.getID()}"/>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Tem certeza que deseja deletar o Produto?
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

                    <div class="col-4" style="background-color:red;" >
                        <a href="#" class="btn btn-block btn-lg btn-primary" style="border-radius:0px;width:100%; ">
                            <i class="fa fa-shopping-cart"></i>
                            Adicionar ao Carrinho</a>
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
        <script src="${pageContext.request.contextPath}/JSP-STYLES/JS/script.js"></script>
    </body>
</html>