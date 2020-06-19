<%-- 
    Document   : editarProdutos
    Created on : 02/04/2020, 09:05:19
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
        <title>Editar Produtos</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style type="text/css">
    </style>

    <jsp:include page="../navbar.jsp"/>

    <body onload="testaTipo()">
        <div class="heading-bar"></div>
        <!-- INICIO DO BODY -->


        <div id="body-changes" class="text-center">

            <form  id="fadeForm" class="form-type needs-validation" method="post" 
                   action="${pageContext.request.contextPath}/editarProdutoServlet" >
                <div class="row justify-content-center">
                    <div class="form-group col-6">
                        <h2>Livro</h2>
                        <input type="hidden" value="${livro.getID()}" name="ID">
                        <input type="hidden" value="${tipo}" id="tipoUsuario">
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-6">
                        <label> Título do livro: </label>
                        <input type="text" class="form-control" placeholder="Título do Livro" 
                               id="ProdutoName" name="Titulo" value="${livro.getTitulo()}" required>
                    </div>
                    <div class="form-group col-6">
                        <label> Quantidade: </label>
                        <input type="number" class="form-control" placeholder="10" id="quantidade" name="Quantidade"
                               value="${livro.getQuantidade()}" required>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-6">
                        <label> Autor: </label>
                        <input type="text" class="form-control" placeholder="Autor" id="ProdutoName" name="Autor"
                               value="${livro.getAutor()}" required>
                    </div>
                    <div class="form-group col-6">
                        <label> Editora: </label>
                        <input type="text" class="form-control" placeholder="Editora" id="ProdutoName" name="Editora"
                               value="${livro.getEditora()}" required>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-12 ">
                        <label> Descrição: </label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="Descricao"
                                  value="${livro.getDescricao()}" required>${livro.getDescricao()}</textarea>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-3">
                        <label>Valor Venda:</label>
                        R$:<input type="text" id="dinheiro" class="form-control" style="display:inline-block"
                                  name="ValorVenda" placeholder="R$00,00" maxlength="7" 
                                  value="${livro.getValorVenda()}" onload="return(moeda(this, '.', ',', event))" required/>
                    </div>
                    <div class="form-group col-3">
                        <label>Valor Compra:</label>
                        R$:<input type="text" id="dinheiro1" name="ValorCusto" class="form-control" style="display:inline-block" 
                                  placeholder="R$00,00" maxlength="7" onload="return(moeda(this, '.', ',', event))"
                                  value="${livro.getValorCusto()}" required/>
                    </div>
                    <div class="form-group col-3">
                        <label>Ano:</label>
                        <input type="String" name="DataCadastro" class=" form-control" style="display:inline-block"
                               maxlength="4" value="${livro.getData()}" required/>
                    </div>
                    <div class="form-group col-3">
                        <label> Categoria: </label>
                        <select class="form-control" name="Categoria" id="categoria" required>  
                            <option selected  value="${livro.getCategoria()}">${livro.getCategoria()}</option>
                            <option  value="Administração">Administração</option>
                            <option  value="Autoajuda">Autoajuda</option>
                            <option  value="Biografia">Biografia</option>
                            <option  value="Direito">Direito</option>
                            <option  value="Filosofia">Filosofia</option>
                            <option  value="Gastronomia">Gastronomia</option>
                            <option  value="História">História</option>
                            <option  value="HQs">HQs</option>
                            <option  value="Infantil">Infantil</option>
                            <option  value="Literatura Estrangeira">Literatura Estrangeira</option>
                            <option  value="Literatura Nacional">Literatura Nacional</option>
                            <option  value="Psicologia">Psicologia</option>
                            <option  value="Religião">Religião</option>
                            <option  value="Teen">Teen</option>
                        </select>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-6">
                        <h2>Caracteristicas</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-3">
                        <label>Número de Páginas:</label>
                        <input type="int" name="NumPag" class="form-control" style="display:inline-block"
                               placeholder="0" maxlength="4" value="${livro.getPaginas()}" required/>
                    </div>
                    <div class="form-group col-3">
                        <label> Acabamento: </label>
                        <select class="form-control" name="Acabamento" id="acabamento" required>  
                            <option selected value="${livro.getAcabamento()}" required>${livro.getAcabamento()}</option>
                            <option  value="Brochura">Brochura</option>
                            <option  value="Capa Dura">Capa Dura</option>
                        </select>
                    </div>
                    <div class="form-group col-3">
                        <label> Idioma: </label>
                        <select class="form-control" name="Idioma" id="idioma" required>  
                            <option  selected value="${livro.getIdioma()}">${livro.getIdioma()}</option>
                            <option  value="Português" required>Português</option>
                            <option  value="Inglês">Inglês</option>
                            <option  value="Espanhol">Espanhol</option>
                        </select>
                    </div>
                    <div class="form-group col-3">
                        <label>Altura:</label>
                        <input type="int" name="Altura" class="form-control" style="display:inline-block" required
                               placeholder="23cm" maxlength="4" value="${livro.getAltura()}"/>
                    </div>
                    <div class="form-group col-3">
                        <label>Largura:</label>
                        <input type="int" name="Largura" class="form-control" style="display:inline-block"
                               placeholder="10cm" maxlength="4" value="${livro.getLargura()}" required/>
                    </div>
                    <div class="form-group col-3">
                        <label>Peso:</label>
                        <input type="int" name="Peso" class="form-control" style="display:inline-block" 
                               placeholder="0.46" maxlength="4" value="${livro.getPeso()}" required/>
                    </div>
                    <div class="form-group col-3">
                        <label>ISBN:</label>
                        <input type="text" name="ISBN" class=" form-control" style="display:inline-block" maxlength="13"
                               value="${livro.getISBN()}" required/>
                    </div>
                    <div class="form-group col-3">
                        <label> Tag: </label>
                        <select class="form-control" name="Tag" id="tag" required>  
                            <option  selected value="${livro.getTag()}">${livro.getTag()}</option>
                            <option  value="Mais Vendidos" required>Mais Vendidos</option>
                            <option  value="Lançamento">Lançamento</option>
                            <option  value="Clássico">Clássico</option>
                            <option  value=" ">Sem Tag</option>
                        </select>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-8">
                        <input type="file" class="custom-file-input form-control" id="customFile"
                               name="Image" onchange="uploadFile()">
                        <label class="custom-file-label" for="customFile">Importar imagem do Produto</label>
                        <p id="labelImagem" style="display:block;">Preview de Imagem:</p>
                        <img alt="Imagem" src="${livro.getImagem()}" id="target" style="max-width:300px; max-height: 300px;display:inline;">
                        <img alt="Imagem" src="" id="target1" style="max-width:300px; max-height: 300px;display:none;">
                        <img alt="Imagem" src="" id="target2" style="max-width:300px; max-height: 300px;display:none;">
                        <input type="hidden" id="base64" name="imagemB64" value="${livro.getImagem()}">
                        <input type="hidden" id="base641" name="imagemB641">
                        <input type="hidden" id="base642" name="imagemB642">
                    </div>
                </div>
                <!------>

                <div class="row ">
                    <div class ="form group col-9 ">
                    </div>
                    <div class ="form group col-sm-3 ">
                        <button type="reset" class="btn btn-primary" id="btn-form"> Cancelar </button>
                        <button type="submit" class="btn btn-primary" id="btn-form"> Confirmar </button>
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
        <script type="text/javascript">
                          $(document).ready(function testaTipo(){ 
                               
                                if ($('#tipoUsuario').val() === 'estoquista') {
                                $('.form-control').prop("readonly", true);
                                $('#quantidade').prop("readonly", false);
                                 $('form input[type="file"]').prop("disabled", true);
                                /* CATEGORIA DISABLE*/
                                $('#categoria').css("background", '#eee');
                                $('#categoria').css("pointer-events", 'none');
                                $('#categoria').css("touch-action", 'none');

                                /* ACABAMENTO DISABLE*/
                                $('#acabamento').css("background", '#eee');
                                $('#acabamento').css("pointer-events", 'none');
                                $('#acabamento').css("touch-action", 'none');

                                /* IDIOMA DISABLE*/
                                $('#idioma').css("background", '#eee');
                                $('#idioma').css("pointer-events", 'none');
                                $('#idioma').css("touch-action", 'none');

                                /* TAG DISABLE*/
                                $('#tag').css("background", '#eee');
                                $('#tag').css("pointer-events", 'none');
                                $('#tag').css("touch-action", 'none');
                            }
                        });
                        
        </script>
    </body>
</html>