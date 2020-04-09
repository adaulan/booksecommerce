/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.UsuarioDAO;
import MODELS.Usuario;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "consultaUsuarioSistemaServlet", urlPatterns = {"/consultaUsuarioSistemaServlet"})
public class consultaUsuarioSistemaServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                HttpSession sessao = request.getSession();
        request.setCharacterEncoding("UTF-8");
        
        try {
            List<Usuario> listaUsuario = UsuarioDAO.buscar(request.getParameter("Busca"));
            
            request.setAttribute("listaUsuario", listaUsuario);
            sessao.setAttribute("listaUsuario", listaUsuario);
        } catch (Exception e) {
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
