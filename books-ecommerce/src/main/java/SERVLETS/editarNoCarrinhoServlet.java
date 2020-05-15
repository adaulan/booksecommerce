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
import java.io.PrintWriter;
import java.util.ArrayList;
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
        /* ------------- USUARIO DESLOGADO ------------------- */
        if (sessao.getAttribute("loginStatus").equals("deslogado")) {
            int IDProduto = Integer.parseInt(request.getParameter("ID"));
            int quantidade;
            List<Livro> listaLivroCarrinho = (ArrayList) sessao.getAttribute("listaCarrinho");
            if (request.getParameter("quantidade").equals("") || Integer.parseInt(request.getParameter("quantidade")) == 0) {
                for (Livro forLivro : listaLivroCarrinho) {
                    if (forLivro.getID() == IDProduto) {
                        listaLivroCarrinho.remove(forLivro);
                        break;
                    }
                }
            } else {
                quantidade = Integer.parseInt(request.getParameter("quantidade"));

                for (Livro forLivro : listaLivroCarrinho) {
                    if (forLivro.getID() == IDProduto) {
                        listaLivroCarrinho.remove(forLivro);
                        forLivro.setQuantidade(quantidade);
                        listaLivroCarrinho.add(forLivro);
                    }
                }
            }
            sessao.setAttribute("listaCarrinho", listaLivroCarrinho);
            request.getRequestDispatcher("consultaCarrinhoServlet").forward(request, response);
            
            
        } /* ------------- USUARIO LOGADO ------------------- */ else {
            int IDProduto = Integer.parseInt(request.getParameter("ID"));
            String status = "A";
            int quantidade;

            if (request.getParameter("quantidade").equals("") || Integer.parseInt(request.getParameter("quantidade")) == 0) {
                quantidade = 0;
                status = "I";
            } else {
                quantidade = Integer.parseInt(request.getParameter("quantidade"));
            }
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
