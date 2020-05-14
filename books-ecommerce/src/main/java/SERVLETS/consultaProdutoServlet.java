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
@WebServlet(name = "consultaProdutoServlet", urlPatterns = {"/consultaProdutoServlet"})
public class consultaProdutoServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessao = request.getSession();
        request.setCharacterEncoding("UTF-8");

        try {
            List<Livro> listaProduto = LivroDAO.buscar(request.getParameter("Busca"));
            String tipo = (String) sessao.getAttribute("tipo");
            request.setAttribute("listaProduto", listaProduto);
            sessao.setAttribute("listaProduto", listaProduto);
        } catch (Exception e) {
            System.out.println(e);
        }
        

        request.getRequestDispatcher("JSP-PAGES/CRUD-PRODUTOS/consultaProdutos.jsp").forward(request, response);

    }

}
