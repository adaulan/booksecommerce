<%-- 
    Document   : Cadastro de Produtos
    Created on : 30/03/2020, 17:21:45
    Author     : Adaulan 
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/booksicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Produtos</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>

    </head>
    <jsp:include page="navbar.jsp"/>

    <body onload="mensagemCadastro()">

        <div class="heading-bar"></div>

        <!-- INICIO DO BODY -->

        <div id="body-changes" class="text-center">

            <form  id="fadeForm" class="form-type needs-validation" method="post" 
                   action="${pageContext.request.contextPath}/cadastroProdutoServlet" >
                <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                    Cadastrado com Sucesso!!
                </div>
                <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                    Ocorreu uma falha ao cadastrar produto!
                </div>
                <input id="alertaR" type="hidden" value="${alertaResposta}">
                
                <div class="row justify-content-center">
                    <div class="form-group col-6">
                        <h2>Livro</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-6">
                        <label> Título do livro: </label>
                        <input type="text" class="form-control" placeholder="Título do Livro" 
                               id="ProdutoName" name="NomeLivro" required>
                    </div>
                    <div class="form-group col-6">
                        <label> Quantidade: </label>
                        <input type="number" class="form-control" placeholder="10" id="ProdutoName" name="Quantidade"
                               required>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-6">
                        <label> Autor: </label>
                        <input type="text" class="form-control" placeholder="Autor" id="ProdutoName" name="Autor" required>
                    </div>
                    <div class="form-group col-6">
                        <label> Editora: </label>
                        <input type="text" class="form-control" placeholder="Editora" id="ProdutoName" name="Editora" required>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-12 ">
                        <label> Descrição: </label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="Descricao" required></textarea>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-3">
                        <label>Valor Venda:</label>
                        R$:<input type="text" id="dinheiro" class="form-control" style="display:inline-block"
                                  name="ValorVenda" placeholder="R$00,00" maxlength="7" 
                                  onKeyPress="return(moeda(this, '.', ',', event))" required/>
                    </div>
                    <div class="form-group col-3">
                        <label>Valor Compra:</label>
                        R$:<input type="text" id="dinheiro1" name="ValorCusto" class="form-control" style="display:inline-block" 
                                  placeholder="R$00,00" maxlength="7" onKeyPress="return(moeda(this, '.', ',', event))"
                                  required/>
                    </div>
                    <div class="form-group col-3">
                        <label>Ano:</label>
                        <input type="String" name="DataCadastro" class=" form-control" style="display:inline-block"
                               maxlength="4" required/>
                    </div>
                    <div class="form-group col-3">
                        <label> Categoria: </label>
                        <select class="form-control" name="Categoria" required>  
                            <option disabled selected style="display: none;" >Categoria</option>
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
                               placeholder="0" maxlength="4" required/>
                    </div>
                    <div class="form-group col-3">
                        <label> Acabamento: </label>
                        <select class="form-control" name="Acabamento" required>  
                            <option disabled selected style="display: none;" required>Acabamento</option>
                            <option  value="Capa Mole">Brochura</option>
                            <option  value="Capa Dura">Capa Dura</option>
                        </select>
                    </div>
                    <div class="form-group col-3">
                        <label> Idioma: </label>
                        <select class="form-control" name="Idioma" required>  
                            <option disabled selected style="display: none;">Idioma</option>
                            <option  value="Português" required>Português</option>
                            <option  value="Inglês">Inglês</option>
                            <option  value="Espanhol">Espanhol</option>
                        </select>
                    </div>
                    <div class="form-group col-3">
                        <label>Altura:</label>
                        <input type="int" name="Altura" class="form-control" style="display:inline-block" required
                               placeholder="23cm" maxlength="4"/>
                    </div>
                    <div class="form-group col-3">
                        <label>Largura:</label>
                        <input type="int" name="Largura" class="form-control" style="display:inline-block"
                               placeholder="10cm" maxlength="4" required/>
                    </div>
                    <div class="form-group col-3">
                        <label>Peso:</label>
                        <input type="int" name="Peso" class="form-control" style="display:inline-block" 
                               placeholder="0.46" maxlength="4" required/>
                    </div>
                    <div class="form-group col-3">
                        <label>ISBN:</label>
                        <input type="text" name="ISBN" class=" form-control" style="display:inline-block" maxlength="13"
                               required/>
                    </div>
                    <div class="form-group col-3">
                        <label> Tag: </label>
                        <select class="form-control" name="Tag" required>  
                            <option disabled selected style="display: none;">Tags Especiais</option>
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
                               name="Image" onchange="uploadFile()" required>
                        <label class="custom-file-label" for="customFile">Importar imagem do Produto</label>
                        <p id="labelImagem" style="display:none;">Preview de Imagem:</p>
                        <img alt="Imagem" src="" id="target" style="max-width:300px; max-height: 300px;display:none;">
                        <img alt="Imagem" src="" id="target1" style="max-width:300px; max-height: 300px;display:none;">
                        <img alt="Imagem" src="" id="target2" style="max-width:300px; max-height: 300px;display:none;">
                        <input type="hidden" id="base64" name="imagemB64">
                        <input type="hidden" id="base641" name="imagemB641">
                        <input type="hidden" id="base642" name="imagemB642">
                    </div>
                </div>
                <!------>

                <div class="row ">
                    <div class ="form group col-9 ">
                    </div>
                    <div class ="form group   col-sm-3 ">
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
        </script>
    </body>
</html>

