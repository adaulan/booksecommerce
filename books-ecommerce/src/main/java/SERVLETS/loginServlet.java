/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.CarrinhoDAO;
import DAO.LoginDAO;
import MODELS.Livro;
import MODELS.Senha;
import MODELS.Usuario;
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
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int IdUsuario;
        String usuario = request.getParameter("inputName");
        String senha = request.getParameter("inputSenha");
        Usuario user = null;
        try {
            user = LoginDAO.Logar(usuario);
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e + " Erro no Login!");
        }
        Senha crypto = new Senha();

        if (user != null && crypto.checkPassword(senha, user.getSenha())) {
            // Se sucesso, salva usuario na sessao e redireciona para /protegido/home
            HttpSession sessao = request.getSession();
            sessao.setAttribute("usuario", user);
            sessao.setAttribute("loginText", user.getUsuario());
            sessao.setAttribute("tipo", user.getTipo());
            sessao.setAttribute("IDUsuario", user.getID());
            sessao.setAttribute("loginStatus", "logado");

            request.setAttribute("usuario", user);
            request.setAttribute("loginText", user.getUsuario());
            request.setAttribute("tipo", user.getTipo());

            /* -------------DISPLAY DE ITENS DO CARRINHO-------------------- */
            List<Livro> listaLivroCarrinho = null;
            try {
                listaLivroCarrinho = CarrinhoDAO.listarProdutos(user.getID());
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
            request.getRequestDispatcher("homeServlet")
                    .forward(request, response);
        } else {
            // Se erro, reapresenta tela de login com msg de erro
            request.setAttribute("msgErro", "Usuário ou senha inválidos");
            request.getRequestDispatcher("homeServlet").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
