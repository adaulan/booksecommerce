/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.EnderecoDAO;
import MODELS.Endereco;
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
@WebServlet(name = "cadastrarEnderecoServlet", urlPatterns = {"/cadastrarEnderecoServlet"})
public class cadastrarEnderecoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        /* Pega o ID na Página */
        int ID = Integer.parseInt(request.getParameter("ID"));
        
        /* CRIA OS ATRIBUTOS NO REQUEST*/
        request.setAttribute("IDEndereco", ID);
        /* RETORNA PRA PÁGINA DE EDITAR PRODUTOS */
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("JSP-PAGES/CRUD-ENDERECO/cadastrarEndereco.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int IDUSUARIO = Integer.parseInt(request.getParameter("ID"));
        String status = "A";
        String cep = request.getParameter("cep");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String endereco = request.getParameter("endereco");
        String complemento = request.getParameter("complemento");

        Endereco E = new Endereco(IDUSUARIO, status, cep, cidade, estado, endereco, complemento);

        try {
            if (EnderecoDAO.inserir(E)) {
                request.setAttribute("msgResposta", "Cadastrado com sucesso!");

            } else {
                request.setAttribute("msgResposta", "Não Foi possível efetuar o cadastro!");

            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        }
        request.getRequestDispatcher("homeServlet").forward(request, response);
    }

}
