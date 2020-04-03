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

/**
 *
 * @author Adaulan
 */
@WebServlet(name = "deletarProdutoServlet", urlPatterns = {"/deletarProdutoServlet"})
public class deletarProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int ID = Integer.parseInt(request.getParameter("ID"));
        System.out.println(ID + " <= ID encontrado!");
        Livro L = null;

        try {
            L = LivroDAO.getByID(ID);
            L.setStatus("I");
            LivroDAO.atualizarStatus(L);
            List<Livro> listaProduto = LivroDAO.listar();

            request.setAttribute("listaProduto", listaProduto);
        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO produto: " + e);
        }

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("JSP-PAGES/consultaProdutos.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
