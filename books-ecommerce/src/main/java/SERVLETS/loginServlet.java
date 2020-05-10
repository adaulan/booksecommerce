/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.LoginDAO;
import MODELS.Senha;
import MODELS.Usuario;
import java.io.IOException;
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
                
              
            request.setAttribute("usuario", user);
            request.setAttribute("loginText", user.getUsuario());
            request.setAttribute("tipo", user.getTipo());
            
            request.getRequestDispatcher("homeServlet")
                     .forward(request, response);
        } else {
             // Se erro, reapresenta tela de login com msg de erro
             request.setAttribute("msgErro", "Usuário ou senha inválidos");
             request.getRequestDispatcher("homeServlet")
                     .forward(request, response);
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
