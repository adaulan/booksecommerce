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
@WebServlet(name = "editarNoCarrinhoServlet", urlPatterns = {"/editarNoCarrinhoServlet"})
public class editarNoCarrinhoServlet extends HttpServlet {

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
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            int IDUsuario = (int) sessao.getAttribute("IDUsuario");
            // ----------------------TESTE DE CLICK--------------------------------------
            // Testa se o Usuario clicou apenas no Adicionar sem adicionar uma nova quantidade
            Carrinho itemNoCarrinho = null;
            try {
                itemNoCarrinho = CarrinhoDAO.getByID(IDUsuario, IDProduto);
                if (quantidade == itemNoCarrinho.getQuantidade()) {
                    quantidade = quantidade + 1;
                }
            } catch (Exception ex) {
                Logger.getLogger(editarNoCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            // ----------------------FIM DO TESTE--------------------------------------
            Carrinho carrinho = new Carrinho(IDUsuario, IDProduto, quantidade, status);

            try {
                if (CarrinhoDAO.atualizarQuantidade(carrinho)) {
                    request.setAttribute("msgResposta", "Adicionado com sucesso!");
                } else {
                    request.setAttribute("msgResposta", "Não Foi possível adicionar!");
                }
            } catch (Exception e) {
                e.getLocalizedMessage();
                System.out.println(e);
            }
            request.getRequestDispatcher("consultaCarrinhoServlet").forward(request, response);

        }
    }

}
