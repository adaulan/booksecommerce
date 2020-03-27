<%-- 
    Document   : home
    Created on : 26/03/2020, 13:52:50
    Author     : Adaulan 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="../CSS/style.css"/>
        <link rel="stylesheet" href="../CSS/swiper.min.css"/>
    </head>
    <style type="text/css">
        .heading-bar {
            margin: 0px auto;
            height: 60px;
            background-color: #F8F8F8 !important;
            border: 1px solid rgba(187,187,187,0.40);
        }

        footer {
            height: 360px;
            padding: 15px;
        }

        .footerBox{
            height: 200px;
            width: 400px;
            color: black;
            float:right;

        }
        footer ul a, h3{
            color:#585858;
        }

        footer ul a:hover{
            text-decoration: none;
            color:#848484;
        }


        footer hr{
            clear:both;
            margin-top:220px;
        }

        #copyright {
            color: black;
            font-size: 9px;
            font-style: italic;
        }

        #copyrightBox{
            clear:both;
            height:80px;
            width:100%;
            text-align: center;
            padding-top: 30px;
            padding-bottom: 0px;
        }

        #copyrightBox p{
            margin-top:1px;
            margin-bottom:1px;
        }




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
                    <img class="d-block w-100" src="../IMAGES/LANDING-PAGE/sit.png" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="../IMAGES/LANDING-PAGE/livraria-banner.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="../IMAGES/LANDING-PAGE/bannercoloredbooks.png" alt="Third slide">
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
        <!-- SLIDER 1 -->
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
        <script type="text/javascript" src="../JS/swiper.min.js"></script>
        <script src="../JS/script.js"></script>   
    </body>
</html>
