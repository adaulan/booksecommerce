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

    </style>

    <jsp:include page="navbar.jsp"/>
    <body>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="../IMAGES/sit.png" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="../IMAGES/livraria-banner.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="../IMAGES/bannercoloredbooks.png" alt="Third slide">
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
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

                        <p class="detail">Edgar Allan Poe Box
                            <a href="#" class="price">Price-40RS</a>
                        </p>
                        <div class="cart">
                            <a href="#">Add To Cart</a>  
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- SLIDER 2 END  -->
        
        <script type="text/javascript" src="../JS/swiper.min.js"></script>
        <script src="../JS/script.js"></script>   
    </body>
</html>
