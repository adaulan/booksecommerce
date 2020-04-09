<%-- 
    Document   : consultaProdutos
    Created on : 31/03/2020, 14:23:14
    Author     : Adaulan 
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Produtos</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style type="text/css">
    </style>

    <jsp:include page="navbar.jsp"/>

    <body>

        <div class="heading-bar"></div>
        <div class="clear"></div>
        <!-- INICIO DO BODY -->
        <div id="body-changes" class="text-center" style="margin-top: 20px;">
            <form id="FadeForm" class="form-type" 
                  action="${pageContext.request.contextPath}/consultaProdutoServlet" method = "post" accept-charset="UTF-8">
                <div class="row justify-content-center">
                    <h2>Consulta</h2>
                </div>
                <div class="row justify-content-center">
                    <div class="input-group col-12">

                        <input type="text" class="form-control" placeholder="O que você busca?" aria-label="Recipient's username" aria-describedby="button-addon2" name="Busca">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Pesquisar <i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row justify-content-center">
                    <div class="form-group col-12">
                        <div class="table-wrapper-scroll-y my-custom-scrollbar" id="style-1">
                            <table class="table" style="color: white;">
                                <thead>
                                    <tr>
                                         <th scope="col">Capa</th>
                                        <th scope="col">Título</th>
                                        <th scope="col">Autor</th>
                                        <th scope="col">Editora</th>
                                        <th scope="col">Ano</th>
                                        <th scope="col">Categoria</th>
                                        <th scope="col">Valor</th>
                                        <th scope="col">Quantidade</th>
                                        <th scope="col">Opções</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- primeiro form ignorado pelo metodo! --%>
                                <form method="get" action="${pageContext.request.contextPath}/ProdutoEditar">
                                    <input type="hidden" value="${livro.getID()}" name="ID">
                                </form>
                                <%--<c:set var="${listaClientes}" scope="result" value="${null}"/>--%>
                                <%-- primeiro form ignorado pelo metodo! --%>
                                <c:forEach items ="${listaProduto}" var="produto">
                                    <tr>
                                        <td><img src="${produto.getImagem()}" style="max-height: 80px;"></td>
                                        <td><c:out value="${produto.getTitulo()}"/></td>
                                        <td><c:out value="${produto.getAutor()}"/></td>
                                        <td><c:out value="${produto.getEditora()}"/></td>
                                        <td><c:out value="${produto.getData()}"/></td>
                                        <td><c:out value="${produto.getCategoria()}"/></td>
                                        <td><c:out value="${produto.getValorVenda()}"/></td>
                                        <td><c:out value="${produto.getQuantidade()}"/></td>
                                        <td>
                                            <form method="get" action="${pageContext.request.contextPath}/editarProdutoServlet">
                                                <input type="hidden" value="${produto.getID()}" name="ID">
                                                <button class="btn-form-button " id="btn-form-search"  type="submit" alt="Editar Produto"><i class="fa fa-edit"></i></button>
                                            </form>
                                        </td>
                                        <td>
                                            <form  method="post" action="${pageContext.request.contextPath}/ProdutoExcluir">
                                                <input type="hidden" value="${produto.getID()}" name="id">
                                                <button id="btn-form-search" type="submit" alt="Remover Produto"><i class="fa fa-times"></i></button>                                        
                                            </form>
                                        </td>    
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
        </div>

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
    </body>
</html>
