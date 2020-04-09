/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.LivroDAO;
import MODELS.Livro;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "homeServlet", urlPatterns = {"/homeServlet"})
public class homeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sessao = request.getSession();
        request.setCharacterEncoding("UTF-8");
        try {
            List<Livro> listaMaisVendidos = LivroDAO.listarMaisVendidos();
            List<Livro> listaNovos = LivroDAO.listarNovos();
            List<Livro> listaMenorPreco = LivroDAO.listarMenorPreco();

            request.setAttribute("listaMaisVendidos", listaMaisVendidos);
            request.setAttribute("listaNovos", listaNovos);
            request.setAttribute("listaMenorPreco", listaMenorPreco);

            sessao.setAttribute("listaMaisVendidos", listaMaisVendidos);
            sessao.setAttribute("listaNovos", listaNovos);
            sessao.setAttribute("listaMenorPreco", listaMenorPreco);

            if (sessao.getAttribute("loginText") == null) {
                request.setAttribute("loginText", "Login/Inscrever-se");
                sessao.setAttribute("loginText", "Login/Inscrever-se");
            } else {

            }

            if (sessao.getAttribute("tipo") == null) {
                request.setAttribute("tipo", "cliente");
                sessao.setAttribute("tipo", "cliente");
                sessao.setAttribute("datatarget", "#exampleModalCenter");//MUDA O MODAL AO CLICAR NO NOME DA PESSOA NO HEADER
            } else {
                if (sessao.getAttribute("tipo").equals("administrador")) {
                    request.setAttribute("tipo", "administrador");
                    sessao.setAttribute("tipo", "administrador");
                    sessao.setAttribute("datatarget", "#exampleModalCenter3");
                } else if (sessao.getAttribute("tipo").equals("estoquista")) {
                    request.setAttribute("tipo", "estoquista");
                    sessao.setAttribute("tipo", "estoquista");
                    sessao.setAttribute("datatarget", "#exampleModalCenter3");
                } else if (sessao.getAttribute("tipo").equals("cliente")) {
                    request.setAttribute("tipo", "cliente");
                    sessao.setAttribute("tipo", "cliente");
                    sessao.setAttribute("datatarget", "#exampleModalCenter3");
                } else {
                    request.setAttribute("tipo", "cliente");
                    sessao.setAttribute("tipo", "cliente");
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        request.getRequestDispatcher("JSP-PAGES/home.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
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
