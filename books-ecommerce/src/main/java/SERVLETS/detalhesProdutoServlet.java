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
@WebServlet(name = "detalhesProdutoServlet", urlPatterns = {"/detalhesProdutoServlet"})
public class detalhesProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
        request.setAttribute("detalheLivro", L);
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("JSP-PAGES/detalhesProduto.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
