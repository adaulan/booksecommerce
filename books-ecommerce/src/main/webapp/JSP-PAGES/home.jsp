<%-- 
    Document   : home
    Created on : 26/03/2020, 13:52:50
    Author     : Adaulan 
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style type="text/css">
    </style>

    <jsp:include page="navbar.jsp"/>

    <body>
        <div class="heading-bar"></div>

        <!-- INICIO DO BODY -->

        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/sit.png" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/livraria-banner.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/bannercoloredbooks.png" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="heading-bar"></div>

        <div class="heading">
            <h4>Mais Populares</h4>
        </div>
        <div class="swiper-container">
            <div class="swiper-wrapper">

                <c:forEach items ="${listaProduto}" var="produto">
                    <div class="swiper-slide">
                        <div class="slider-box">
                            <p class="time"><c:out value="${produto.getTag()}"/></p>
                            <div class="img-box">
                                <img src="${produto.getImagem()}">
                            </div>
                            <p class="detail" id="productTitle"><c:out value="${produto.getTitulo()}"/>
                            <span id="autor" class="detail"><c:out value="${produto.getAutor()}"/></span>
                            <a href="#" class="price"><span id="valorUnitario" onload="formatToReal()"><c:out value="${produto.formatarValor(produto.getValorVenda())}"/></span></a>
                            </p>
                            <div class="cart">
                                <a href="#">COMPRAR</a>  
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>
        </div>
        <!-- SLIDER 1 -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <!--Slide 1-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 2-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>
                <!--Slide 3-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>
                <!--Slide 4-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 5-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 6-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 7-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 8-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 9-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 10-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- SLIDER 1 END  -->
        <div class="heading">
            <h4>Novos Livros</h4>
        </div>
        <!-- SLIDER 2 -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <!--Slide 1-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 2-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>
                <!--Slide 3-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>
                <!--Slide 4-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 5-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 6-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 7-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 8-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 9-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

                <!--Slide 10-------------------------------->
                <div class="swiper-slide">


                    <div class="slider-box">
                        <p class="time">New</p>
                        <div class="img-box">
                            <img src="../IMAGES/edgarallanpoe.jpg">
                        </div>

                        <p class="detail" id="productTitle">Edgar Allan Poe Box
                            <span id="autor" class="detail">Autor</span>
                            <a href="#" class="price">R$ <span id="valorUnitario">50,00</span></a>
                        </p>
                        <div class="cart">
                            <a href="#">COMPRAR</a>  
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- SLIDER 2 END  -->
        <!-- FIM DO BODY -->
        <div class="heading-bar"></div>

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
    </body>
</html>
