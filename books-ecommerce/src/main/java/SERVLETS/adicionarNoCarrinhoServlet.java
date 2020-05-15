/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.CarrinhoDAO;
import MODELS.Carrinho;
import MODELS.Livro;
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
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            int IDCarrinho = (int) sessao.getAttribute("IDUsuario");

            Carrinho carrinho = new Carrinho(IDCarrinho, IDProduto, quantidade, status);
            try {
                Carrinho itemNoCarrinho = CarrinhoDAO.getByID(IDCarrinho, IDProduto);
                if (itemNoCarrinho == null) {
                    if (CarrinhoDAO.inserir(carrinho)) {
                        request.setAttribute("msgResposta", "Adicionado com sucesso!");
                    } else {
                        request.setAttribute("msgResposta", "Não Foi possível adicionar!");
                    }
                } else {
                    itemNoCarrinho.setQuantidade(itemNoCarrinho.getQuantidade() + 1);
                    if (CarrinhoDAO.atualizarQuantidade(itemNoCarrinho)) {
                        request.setAttribute("msgResposta", "Adicionado com sucesso!");
                    } else {
                        request.setAttribute("msgResposta", "Não Foi possível adicionar!");
                    }
                }
            } catch (Exception e) {
                e.getLocalizedMessage();
                System.out.println(e);
            }
            /* -------------DISPLAY DE ITENS DO CARRINHO-------------------- */
            List<Livro> listaLivroCarrinho = null;
            try {
                listaLivroCarrinho = CarrinhoDAO.listarProdutos((int) sessao.getAttribute("IDUsuario"));
            } catch (Exception ex) {
                Logger.getLogger(consultaCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            int quantidadeDeItens = 0;
            if (listaLivroCarrinho != null) {
                for (Livro L : listaLivroCarrinho) {
                    quantidadeDeItens = quantidadeDeItens + L.getQuantidade();
                }
            }
            sessao.setAttribute("quantidadeDeItens", quantidadeDeItens);
            /* -------------FIM DISPLAY DE ITENS DO CARRINHO-------------------- */
            request.getRequestDispatcher("JSP-PAGES/home.jsp").forward(request, response);

        }

    }

}
