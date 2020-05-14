/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.EnderecoDAO;
import MODELS.Endereco;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "consultaEnderecoServlet", urlPatterns = {"/consultaEnderecoServlet"})
public class consultaEnderecoServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int ID = Integer.parseInt(request.getParameter("ID"));
        
        try {
        /* Pega os Dados no Banco */
            List<Endereco> listaEndereco = EnderecoDAO.listByID(ID);
            request.setAttribute("listaEndereco", listaEndereco);
        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO endereco: " + e);
        }
        /* RETORNA PRA PÁGINA DE CONSULTAR ENDERECOS */
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("JSP-PAGES/CRUD-ENDERECO/consultaEndereco.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
    
}
