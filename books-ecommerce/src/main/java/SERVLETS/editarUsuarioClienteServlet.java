/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.LoginDAO;
import DAO.UsuarioDAO;
import MODELS.Senha;
import MODELS.Usuario;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adaulan
 */
@WebServlet(name = "editarUsuarioClienteServlet", urlPatterns = {"/editarUsuarioClienteServlet"})
public class editarUsuarioClienteServlet extends HttpServlet {




    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int ID = Integer.parseInt(request.getParameter("IDUpdate"));
        String Nome = request.getParameter("nomeUpdate");
        String Email = request.getParameter("EMAILUpdate");
        String DataNasc = request.getParameter("DATAUpdate");
        String Usuario = request.getParameter("usuarioUpdate");
        String Senha = request.getParameter("senha1Update");
        String Celular = request.getParameter("CELULARUpdate");
        String CPF = request.getParameter("CPFUpdate");
        Senha crypto = new Senha();
        Usuario U;
        
        if (Senha.equals("")) {
            System.out.println("SENHA NULL");
            try {
                U = UsuarioDAO.getByID(ID);
                Senha = U.getSenha();
            } catch (Exception ex) {
                Logger.getLogger(editarUsuarioSistemaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            Senha = crypto.hashSenha(Senha);
        }
        
        Usuario user = new Usuario(ID, Nome, Usuario, Senha, Email, DataNasc, Celular, CPF);
        
        Usuario usuario = null;
        try {
            if (UsuarioDAO.atualizarCliente(user)) {
                 request.setAttribute("alertaResposta", "sucesso");
                 /* Loga o usuario novamente com as informações atualizados */
                 usuario = LoginDAO.Logar(user.getUsuario());
                 request.setAttribute("usuario", usuario);
            } else {
                request.setAttribute("alertaResposta", "falha");
                
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        }
        request.getRequestDispatcher("homeServlet").forward(request, response);

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
