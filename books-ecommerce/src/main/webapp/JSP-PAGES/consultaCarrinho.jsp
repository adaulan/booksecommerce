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
                <div class="col-8" style="background-color:purple;">

                    <h3>IDPEDIDO</h3></p>
                    <p style="color:black;">Data: 20/04/2020| Itens: 3| Valor: R$ 100,00</p>
                    <image src="../JSP-STYLES/IMAGES/DETALHESTEST/boxhplovecraft.jpg" style="max-width:80px;margin:5px;"/>
                    <image src="../JSP-STYLES/IMAGES/DETALHESTEST/boxnordicos.jpg" style="max-width:80px;"/>
                    <image src="../JSP-STYLES/IMAGES/DETALHESTEST/gameofthrones.jpg" style="max-width:80px;"/>


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