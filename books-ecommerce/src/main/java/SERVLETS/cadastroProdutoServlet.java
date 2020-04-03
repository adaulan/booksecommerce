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
        System.out.println("ENTROU NO SERVLET");
        
        String Status = "A";
        String Titulo = request.getParameter("NomeLivro");
        System.out.println(Titulo);
        String Autor = request.getParameter("Autor");
        System.out.println(Autor);
        String Editora = request.getParameter("Editora");
        System.out.println(Editora);
        String Descricao = request.getParameter("Descricao");
        System.out.println(Descricao);
        String Imagem = request.getParameter("imagemB64");
        System.out.println(Imagem);
        String Imagem1 = request.getParameter("imagemB641");
        System.out.println(Imagem1);
        String Imagem2 = request.getParameter("imagemB642");
        System.out.println(Imagem2);
        float ValorVenda = Float.parseFloat(request.getParameter("ValorVenda").replaceAll("\\,", "\\."));
        System.out.println(ValorVenda);
        float ValorCusto = Float.parseFloat(request.getParameter("ValorCusto").replaceAll("\\,", "\\."));
        System.out.println(ValorCusto);
        String Categoria = request.getParameter("Categoria");
        System.out.println(Categoria);
        int Quantidade = Integer.parseInt(request.getParameter("Quantidade"));
        System.out.println(Quantidade);
        String Data = request.getParameter("DataCadastro");
        System.out.println(Data);
        int Paginas = Integer.parseInt(request.getParameter("NumPag"));
        System.out.println(Paginas);
        String Acabamento = request.getParameter("Acabamento");
        System.out.println(Acabamento);
        String Idioma = request.getParameter("Idioma");
        System.out.println(Idioma);
        String Altura = request.getParameter("Altura");
        System.out.println(Altura);
        String Largura = request.getParameter("Largura");
        System.out.println(Largura);
        float Peso = Float.parseFloat(request.getParameter("Peso"));
        System.out.println(Peso);
        String ISBN = request.getParameter("ISBN");
        System.out.println(ISBN);
        String Tag = request.getParameter("Tag");
        System.out.println(Tag);
        
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
