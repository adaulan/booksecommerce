/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.UsuarioDAO;
import MODELS.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
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
        int ID = Integer.parseInt(request.getParameter("ID"));
        String Nome = request.getParameter("nome");
        System.out.println(Nome);
        String Status = "A";
        String Email = request.getParameter("email");
        System.out.println(Email);
        String DataNasc = request.getParameter("dataNascimento");
        System.out.println(DataNasc);
        String Usuario = request.getParameter("usuario");
        System.out.println(Usuario);
        String Senha = request.getParameter("senha");
        System.out.println(Senha);
        String Tipo = request.getParameter("cargo");
        System.out.println(Tipo);
        String Celular = request.getParameter("celular");
        System.out.println(Celular);
        String CPF = request.getParameter("CPF");
        System.out.println(CPF);
        
        Usuario user = new Usuario(ID,Status, Nome, Usuario, Senha, Email, Tipo, DataNasc, Celular, CPF);
        
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
