/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.LivroDAO;
import MODELS.Livro;
import java.io.IOException;
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
@WebServlet(name = "detalhesProdutoServlet", urlPatterns = {"/detalhesProdutoServlet"})
public class detalhesProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
        /* INSTANCIA O ID */
        int ID = Integer.parseInt(request.getParameter("ID"));
        /* INSTANCIA OS OBJETOS */
        Livro L = null;
        List<Livro> listaAutor = null;
        List<Livro> listaTag = null;

        try {
            L = LivroDAO.getByID(ID);
            listaAutor = LivroDAO.buscarPorAutor(request.getParameter("autor"), ID);

            request.setAttribute("listaAutor", listaAutor);
            request.setAttribute("textoHeader", "Do Mesmo Autor:");

            sessao.setAttribute("listaAutor", listaAutor);

            if (listaAutor == null) {
                listaTag = LivroDAO.buscarPorTag(request.getParameter("tag"));
                request.setAttribute("textoHeader", "Semelhantes:");
                request.setAttribute("listaAutor", listaTag);

                sessao.setAttribute("listaAutor", listaTag);

            } 

        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO produto: " + e);
        }
        request.setAttribute("ID", ID);
        request.setAttribute("detalheLivro", L);

        sessao.setAttribute("listaAutor", listaAutor);

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("JSP-PAGES/detalhesProduto.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
