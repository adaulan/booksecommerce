/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.CarrinhoDAO;
import MODELS.Carrinho;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "adicionarNoCarrinhoServlet", urlPatterns = {"/adicionarNoCarrinhoServlet"})
public class adicionarNoCarrinhoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
        if (sessao.getAttribute("loginStatus") == "deslogado") {
            request.getRequestDispatcher("JSP-PAGES/home.jsp").forward(request, response);
        } else {
            int IDProduto = Integer.parseInt(request.getParameter("ID"));
            String status = "A";
            int IDCarrinho = (int) sessao.getAttribute("IDUsuario");
            
            Carrinho carrinho = new Carrinho(IDCarrinho,IDProduto,status);
            
             try {
            if (CarrinhoDAO.inserir(carrinho)) {
                request.setAttribute("msgResposta", "Adicionado com sucesso!");
            } else {
                request.setAttribute("msgResposta", "Não Foi possível adicionar!");    
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        }
        request.getRequestDispatcher("JSP-PAGES/home.jsp").forward(request, response);
            
        }

    }

}
