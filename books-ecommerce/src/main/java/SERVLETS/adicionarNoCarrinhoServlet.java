/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.CarrinhoDAO;
import DAO.LivroDAO;
import MODELS.Carrinho;
import MODELS.Livro;
import java.io.IOException;
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

        /* ------------------- USUARIO DESLOGADO ---------------- */
        if (sessao.getAttribute("loginStatus").equals("deslogado")) {
            int IDProduto = Integer.parseInt(request.getParameter("ID"));
            String status = "A";
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            int IDCarrinho = 0;

            Carrinho carrinho = new Carrinho(IDCarrinho, IDProduto, quantidade, status);
            Livro L = null;
            try {
                L = LivroDAO.getByID(IDProduto);
                L.setQuantidade(quantidade);
            } catch (Exception ex) {
                Logger.getLogger(adicionarNoCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (sessao.getAttribute("listaCarrinho") == null) {
                List<Livro> listaLivroCarrinho = new ArrayList<Livro>();
                listaLivroCarrinho.add(L);
                int quantidadeDeItens = 0;
                if (listaLivroCarrinho != null) {
                    for (Livro forLivro : listaLivroCarrinho) {
                        quantidadeDeItens = quantidadeDeItens + L.getQuantidade();
                    }
                }

                sessao.setAttribute("listaCarrinho", listaLivroCarrinho);
                sessao.setAttribute("quantidadeDeItens", quantidadeDeItens);
            } else {
                List<Livro> listaLivroCarrinho = (ArrayList) sessao.getAttribute("listaCarrinho");
                boolean exist = false;
                for(Livro forLivro : listaLivroCarrinho){
                    if(forLivro.getID() == IDProduto){
                        listaLivroCarrinho.remove(forLivro);
                        forLivro.setQuantidade(forLivro.getQuantidade() + quantidade);
                        listaLivroCarrinho.add(forLivro);
                        exist = true;
                    }
                }
                
                if(exist == false){
                    listaLivroCarrinho.add(L);
                } 
                
                int quantidadeDeItens = 0;
                if (listaLivroCarrinho != null) {
                    for (Livro forLivro : listaLivroCarrinho) {
                        quantidadeDeItens = quantidadeDeItens + forLivro.getQuantidade();
                    }
                }
                sessao.setAttribute("listaCarrinho", listaLivroCarrinho);
                sessao.setAttribute("quantidadeDeItens", quantidadeDeItens);
            }

            request.getRequestDispatcher("JSP-PAGES/home.jsp").forward(request, response);

            /* ------------------- FIM USUARIO DESLOGADO ---------------- */
            /* ------------------- USUARIO LOGADO ---------------- */
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
