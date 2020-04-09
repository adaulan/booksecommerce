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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adaulan
 */
@WebServlet(name = "cadastrarUsuarioClienteServlet", urlPatterns = {"/cadastrarUsuarioClienteServlet"})
public class cadastrarUsuarioClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String Nome = request.getParameter("nome");
        System.out.println(Nome);
        String Email = request.getParameter("EMAIL");
        System.out.println(Email);
        String DataNasc = request.getParameter("DATA");
        System.out.println(DataNasc);
        String Usuario = request.getParameter("usuario");
        System.out.println(Usuario);
        String Senha = request.getParameter("senha1");
        System.out.println(Senha);
        String Tipo = "cliente";
        System.out.println(Tipo);
        String Celular = request.getParameter("CELULAR");
        System.out.println(Celular);
        String CPF = request.getParameter("CPF");
        System.out.println(Celular);
        Usuario user = new Usuario(Nome, Usuario, Senha, Email, Tipo, DataNasc, Celular, CPF);
        System.out.println(user.getNome());

        try {
            if (UsuarioDAO.inserir(user)) {
                request.setAttribute("msgResposta", "Cadastrado com sucesso!");
                
            } else {
                request.setAttribute("msgResposta", "Não Foi possível efetuar o cadastro!");
                
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        }
        request.getRequestDispatcher("JSP-PAGES/home.jsp").forward(request, response);
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
