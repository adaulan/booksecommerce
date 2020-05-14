/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.LivroDAO;
import MODELS.Livro;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adaulan
 */
@WebServlet(name = "editarProdutoServlet", urlPatterns = {"/editarProdutoServlet"})
public class editarProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        /* Pega o ID na Página */
        int ID = Integer.parseInt(request.getParameter("ID"));
        String tipoUsuario = request.getParameter("tipo");
        Livro L = null;

        try {
            /* Pega os Dados no Banco */
            L = LivroDAO.getByID(ID);
        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO produto: " + e);
        }
        /* CRIA OS ATRIBUTOS NO REQUEST*/
        request.setAttribute("ID", ID);
        request.setAttribute("livro", L);
        /* RETORNA PRA PÁGINA DE EDITAR PRODUTOS */
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("JSP-PAGES/CRUD-PRODUTOS/editarProdutos.jsp");
        dispatcher.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        /* Cria os Parametros a partir dos itens preenchidos */
        int ID = Integer.parseInt(request.getParameter("ID"));
        String Status = "A";
        String Titulo = request.getParameter("Titulo");
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

        /*CRIA OBJETO LIVRO*/
        Livro L = new Livro(ID, Status, Titulo, Autor, Editora, Descricao, Imagem, Imagem1, Imagem2, ValorVenda, ValorCusto, Categoria, Quantidade,
                Data, Paginas, Acabamento, Idioma, Altura, Largura, Peso, ISBN, Tag);

        try {
            /* ATUALIZA NO BANCO ATRAVÉS DA DAO*/
            if (LivroDAO.atualizar(L)) {
                request.setAttribute("alertaResposta", "sucesso");
            } else {
                request.setAttribute("alertaResposta", "falha");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        /* RETORNA PRA PÁGINA DE CONSULTA*/
        request.getRequestDispatcher("consultaProdutoServlet").forward(request, response);

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
