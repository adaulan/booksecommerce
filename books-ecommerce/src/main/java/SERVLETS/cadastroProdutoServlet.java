/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.LivroDAO;
import MODELS.Livro;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adaulan
 */
@WebServlet(name = "cadastroProdutoServlet", urlPatterns = {"/cadastroProdutoServlet"})
public class cadastroProdutoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String Status = "A";
        String Titulo = request.getParameter("NomeLivro");
        String Autor = request.getParameter("Autor");
        String Editora = request.getParameter("Editora");
        String Descricao = request.getParameter("Descricao");
        String Imagem = request.getParameter("imagemB64");
        String Imagem1 = request.getParameter("imagemB641");
        String Imagem2 = request.getParameter("imagemB642");
        float ValorVenda = Float.parseFloat(request.getParameter("ValorVenda").replaceAll("\\,", "\\."));
        float ValorCusto = Float.parseFloat(request.getParameter("ValorCusto").replaceAll("\\,", "\\."));
        String Categoria = request.getParameter("Categoria");
        int Quantidade = Integer.parseInt(request.getParameter("Quantidade"));
        String Data = request.getParameter("DataCadastro");
        int Paginas = Integer.parseInt(request.getParameter("NumPag"));
        String Acabamento = request.getParameter("Acabamento");
        String Idioma = request.getParameter("Idioma");
        String Altura = request.getParameter("Altura");
        String Largura = request.getParameter("Largura");
        float Peso = Float.parseFloat(request.getParameter("Peso"));
        String ISBN = request.getParameter("ISBN");
        String Tag = request.getParameter("Tag");
        
        Livro L = new Livro(Status, Titulo, Autor, Editora, Descricao, Imagem, Imagem1, Imagem2, ValorVenda, ValorCusto, Categoria, Quantidade,
                Data, Paginas, Acabamento, Idioma, Altura, Largura, Peso, ISBN, Tag);

        try {
            if (LivroDAO.inserir(L)) {
                request.setAttribute("alertaResposta", "sucesso");
            } else {
                request.setAttribute("alertaResposta", "falha");
            }
        } catch (Exception ex) {
            Logger.getLogger(cadastroProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("JSP-PAGES/cadastrarProdutos.jsp").forward(request, response);
    }

}
