<%-- 
    Document   : navbar
    Created on : 26/03/2020, 13:53:19
    Author     : Adaulan 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- BOOTSTRAP -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
              crossorigin="anonymous">
        <style type="text/css">
            body {
                margin: 0 auto;
            }
            #top-bar {
                width: 100%;
                margin: 0 auto;
                background-color: #F2F2F2;
                height: 40px;
                font-family: sans-serif;
                color: #848484;
                text-align: right;
            }

            #signin-div {
                margin-right: 300px;
            }

            .clear {
                clear:both;
            }

        </style>
        <title>Navbar</title>
    </head>
    <body>
        <!-- TOP BAR -->
        <div id="top-bar">
            <div id="signin-div" class="top-bar-section">

                <a><span id="signin-text"> Login/Inscreva-se</span></a>

            </div>
            <!-- NAVBAR -->
            <nav class="navbar navbar-expand-sm navbar-light bg-light mb-3">
                <div class="container">
                    <a class="navbar-brand" href="home.jsp">
                        <img src="../IMAGES/booksicon.png">
                        Livraria Projeto x</a>
                    <button class="navbar-toggler"
                            data-toggle="collapse"
                            data-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">About</a>   
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Services</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
                            </li>
                        </ul>

                        <form class="form-inline ml-auto">
                            <input type="text" class="form-control mr-2" placeholder="Search">
                            <button class="btn btn-outline-success">Search</button>
                        </form>
                    </div>
                </div>
            </nav>
            <div class="clear"></div>

            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
                    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
            crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
                    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
            crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
                    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" 
            crossorigin="anonymous"></script>
    </body>

</html>
