/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.CarrinhoDAO;
import DAO.LivroDAO;
import MODELS.Livro;
import MODELS.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "consultaPedidosSistemaServlet", urlPatterns = {"/consultaPedidosSistemaServlet"})
public class consultaPedidosSistemaServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession sessao = request.getSession();
        request.setCharacterEncoding("UTF-8");

        try {
            List<Pedido> listaPedidos = CarrinhoDAO.listarPedidos();
            request.setAttribute("listaPedidos", listaPedidos);
            sessao.setAttribute("listaPedidos", listaPedidos);
        } catch (Exception e) {
            System.out.println(e);
        }
        

        request.getRequestDispatcher("JSP-PAGES/consultaPedidos.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */

}
