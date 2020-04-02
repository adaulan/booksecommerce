/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.LivroDAO;
import MODELS.Livro;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Adaulan
 */
@WebServlet(name = "editarProdutoServlet", urlPatterns = {"/editarProdutoServlet"})
public class editarProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int ID = Integer.parseInt(request.getParameter("ID"));
        System.out.println(ID + " <= ID encontrado!");
        Livro L = null;

        try {
            L = LivroDAO.getByID(ID);
            System.out.println(L.getTitulo() + " <= Nome do Objeto");
        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO produto: " + e);
        }
        request.setAttribute("ID", ID);
        request.setAttribute("livro", L);
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("JSP-PAGES/editarProdutos.jsp");
        dispatcher.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        System.out.println("ENTROU NO SERVLET");
        int ID =  Integer.parseInt(request.getParameter("ID"));
        String Status = "A";
        String Titulo = request.getParameter("Titulo");
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

        Livro L = new Livro(ID, Status, Titulo, Autor, Editora, Descricao, Imagem, Imagem1, Imagem2, ValorVenda, ValorCusto, Categoria, Quantidade,
                Data, Paginas, Acabamento, Idioma, Altura, Largura, Peso, ISBN, Tag);

        try {
            LivroDAO.atualizar(L);

        } catch (Exception e) {
            System.out.println(e);
        }

        request.getRequestDispatcher("JSP-PAGES/consultaProdutos.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
