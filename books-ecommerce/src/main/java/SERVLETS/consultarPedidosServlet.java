/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.CarrinhoDAO;
import MODELS.Pedido;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "consultarPedidosServlet", urlPatterns = {"/consultarPedidosServlet"})
public class consultarPedidosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();

        int IDUsuario = (int) sessao.getAttribute("IDUsuario");

        List<Pedido> listaPedidos = null;
        try {
            listaPedidos = CarrinhoDAO.listarPedidos(IDUsuario);
        } catch (Exception ex) {
            Logger.getLogger(consultarPedidosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        sessao.setAttribute("listaPedidos", listaPedidos);
        request.getRequestDispatcher("JSP-PAGES/meusPedidos.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();

        int IDUsuario = (int) sessao.getAttribute("IDUsuario");

        List<Pedido> listaPedidos = null;
        try {
            listaPedidos = CarrinhoDAO.listarPedidos(IDUsuario);
        } catch (Exception ex) {
            Logger.getLogger(consultarPedidosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        sessao.setAttribute("listaPedidos", listaPedidos);
        request.getRequestDispatcher("JSP-PAGES/meusPedidos.jsp").forward(request, response);

    }

}
