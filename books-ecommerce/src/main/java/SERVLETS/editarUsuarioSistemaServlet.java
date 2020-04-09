/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.UsuarioDAO;
import MODELS.Senha;
import MODELS.Usuario;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adaulan
 */
@WebServlet(name = "editarUsuarioSistemaServlet", urlPatterns = {"/editarUsuarioSistemaServlet"})
public class editarUsuarioSistemaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        /* Pega o ID na Página */
        int ID = Integer.parseInt(request.getParameter("ID"));
        String tipoUsuario = request.getParameter("tipo");
        Usuario U = null;

        try {
            /* Pega os Dados no Banco */
            U = UsuarioDAO.getByID(ID);
        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO produto: " + e);
        }
        /* CRIA OS ATRIBUTOS NO REQUEST*/
        request.setAttribute("ID", ID);
        request.setAttribute("usuario", U);
        /* RETORNA PRA PÁGINA DE EDITAR PRODUTOS */
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("JSP-PAGES/editarUsuarios.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int ID = Integer.parseInt(request.getParameter("IDUpdate"));
        String Nome = request.getParameter("nome");
        String Status = "A";
        String Email = request.getParameter("email");
        String DataNasc = request.getParameter("dataNascimento");
        String Usuario = request.getParameter("usuario");
        String Senha = request.getParameter("senha");
        String Tipo = request.getParameter("cargo");
        String Celular = request.getParameter("celular");
        String CPF = request.getParameter("CPF");
        Senha crypto = new Senha();
        Usuario user = new Usuario(ID,Status, Nome, Usuario, crypto.hashSenha(Senha), Email, Tipo, DataNasc, Celular, CPF);
        
        try {
            if (UsuarioDAO.atualizar(user)) {
                 request.setAttribute("alertaResposta", "sucesso");
                
            } else {
                request.setAttribute("alertaResposta", "falha");
                
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        }
        request.getRequestDispatcher("JSP-PAGES/consultaUsuario.jsp").forward(request, response);

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
