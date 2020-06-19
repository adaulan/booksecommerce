<%-- 
    Document   : detalhesProduto
    Created on : 02/04/2020, 15:03:37
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
        <title>Detalhes</title>
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

        <!-- INICIO DO BODY -->
        <div id="body-details" class="text-center container">
            <!-- INICIO FORM -->

            <form action="" method = "post" accept-charset="UTF-8">

                <div class="form-type col" id="FadeForm" style="margin: 1%; background-color:white; width:100%;">

                    <div class="row align-items-center" style="padding:3%;">

                        <!-- DIV IMAGEM -->
                        <div class="form-group col" style="" >
                            <img alt="Imagem" src="${detalheLivro.getImagem()}" id="target" style="max-width:450px;
                                 max-height: 450px;">
                            <img alt="Imagem" src="" id="target1" style="max-width:300px; max-height: 300px;display:none;">
                            <img alt="Imagem" src="" id="target2" style="max-width:300px; max-height: 300px;display:none;">
                            <input type="hidden" id="base64" name="imagemB64">
                            <input type="hidden" id="base641" name="imagemB641">
                            <input type="hidden" id="base642" name="imagemB642">
                        </div>
                        <!-- FIM DIV IMAGEM -->
                        <!-- DIV COMPRA -->
                        <div id="div-box-compra" class="form-group col align-items-center" >
                            <div class="row">
                                <div class="col">
                                    <h2><c:out value="${detalheLivro.getTitulo()}"/></h2>
                                    <p>Autor: <span><c:out value="${detalheLivro.getAutor()}"/></span> | 
                                        <span>Editora: <c:out value="${detalheLivro.getEditora()}"/> </span><p>
                                </div>
                            </div>
                            <hr>
                            <div class="row justify-content-around align-items-center">
                                <div class="col-4">
                                    <p style="font-size:30px;"><c:out value="${detalheLivro.formatarValor(detalheLivro.getValorVenda())}"/><p>
                                    <p style="font-size:14px;">Em até <strong>2x sem Juros</strong> no Cartão</p>
                                </div>
                                <div class="col-6" >
                                    <form></form><!-- CORREÇÃO DE BUG -->
                                    <form method="post" action="${pageContext.request.contextPath}/adicionarNoCarrinhoServlet">
                                        <input type="number" name="quantidade" value="1" style="display:none;">
                                        <input type="hidden" value="${detalheLivro.getID()}" name="ID">
                                        <input type="submit" class="btn btn-block btn-lg btn-primary" style="border-radius:0px;width:100%;" value="Adicionar ao Carrinho">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- FIM DIV COMPRA -->
                    </div> 
                </div>
                <!-- FIM AREA DE COMPRA -->
                <!-- INICIO DO SWIPER DE PRODUTOS DO MESMO AUTOR -->
                <div class="heading" style="width: 250px;">
                    <h4><c:out value="${textoHeader}"/></h4>
                </div>
                <div class="swiper-container" >
                    <div class="swiper-wrapper">
                        <!-- FORM PARA CONSERTO DE BUG NA PÁGINA -->
                        <form class="clear"></form>
                        <!-- FIM DE FORM PARA CONSERTO DE BUG NA PÁGINA -->
                        <c:forEach items ="${listaAutor}" var="produto">
                            <div class="swiper-slide">
                                <div class="slider-box">
                                    <p class="time"><c:out value="${produto.getTag()}"/></p>


                                    <form method="post" action="${pageContext.request.contextPath}/detalhesProdutoServlet">
                                        <div class="img-box">
                                            <input style="max-height: 170px;" type="image" src="${produto.getImagem()}" value="submit">
                                            <input name="ID" type="hidden" value="${produto.getID()}"/>
                                            <input name="autor" type="hidden" value="${produto.getAutor()}"/>
                                        </div>
                                    </form>


                                    <p class="detail" id="productTitle"><c:out value="${produto.getTitulo()}"/>
                                        <span id="autor" class="detail"><c:out value="${produto.getAutor()}"/></span>
                                        <a href="#" class="price"><span id="valorUnitario" onload=""><c:out value="${produto.formatarValor(produto.getValorVenda())}"/></span></a>
                                    </p>
                                    <div class="cart">
                                        <a href="#">COMPRAR</a>  
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <!-- FIM DO SWIPER DE PRODUTOS DO MESMO AUTOR -->
                <!-- DETALHES -->
                <div id="FadeForm" class="form-type container" style="margin-left:10px; background-color:white;
                     height:auto; max-width: 1300px; width:100%; padding:2%">
                    <div class="row justify-content-start" style="text-align:left; color: black;">
                        <div class="col-md-12">
                            <h3>Descrição</h3><br/>
                            <p><c:out value="${detalheLivro.getDescricao()}"/></p>
                        </div>
                    </div>
                    <hr>
                    <div class="row justify-content-start" style="text-align:left; color: black;">
                        <div class="col-md-12">
                            <h3>Caracteristicas</h3><br/>
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <td>Autor</td>
                                        <td><c:out value="${detalheLivro.getAutor()}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Numero de Páginas</td>
                                        <td><c:out value="${detalheLivro.getPaginas()}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Ano</td>
                                        <td><c:out value="${detalheLivro.getData()}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Acabamento</td>
                                        <td><c:out value="${detalheLivro.getAcabamento()}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Idioma</td>
                                        <td><c:out value="${detalheLivro.getIdioma()}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Editora</td>
                                        <td><c:out value="${detalheLivro.getEditora()}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Altura(cm)</td>
                                        <td><c:out value="${detalheLivro.getAltura()}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Largura(cm)</td>
                                        <td><c:out value="${detalheLivro.getLargura()}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Peso</td>
                                        <td><c:out value="${detalheLivro.getPeso()}"/></td>
                                    </tr>
                                    <tr>
                                        <td>ISBN</td>
                                        <td><c:out value="${detalheLivro.getISBN()}"/></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- FIM DETALES -->

            </form>


            <!-- FIM DO BODY -->


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
