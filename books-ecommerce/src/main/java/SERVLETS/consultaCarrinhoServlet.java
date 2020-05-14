/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.CarrinhoDAO;
import MODELS.Livro;
import java.io.IOException;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
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
@WebServlet(name = "consultaCarrinhoServlet", urlPatterns = {"/consultaCarrinhoServlet"})
public class consultaCarrinhoServlet extends HttpServlet {

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
        HttpSession sessao = request.getSession();
        String loginStatus = (String) sessao.getAttribute("loginStatus");

        if (loginStatus == null || loginStatus.equals("deslogado")) {
            request.getRequestDispatcher("JSP-PAGES/home.jsp").forward(request, response);
        }

        int IDUsuario = (int) sessao.getAttribute("IDUsuario");

        List<Livro> listaLivroCarrinho = null;
        try {
            listaLivroCarrinho = CarrinhoDAO.listarProdutos(IDUsuario);
        } catch (Exception ex) {
            Logger.getLogger(consultaCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        //----------------------VALOR/QUANTIDADE/DATA---------------------------
        float valorTotal = 0;
        int quantidadeDeItens = 0;
        if (listaLivroCarrinho != null) {

            for (Livro L : listaLivroCarrinho) {
                valorTotal = valorTotal + (L.getValorVenda() * L.getQuantidade());
                quantidadeDeItens = quantidadeDeItens + L.getQuantidade();
            }
        }
        //Formatando Valores para PTBR
        Locale ptBr = new Locale("pt", "BR");
        String valorString = NumberFormat.getCurrencyInstance(ptBr).format(valorTotal);
        LocalDate myObj = LocalDate.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedDate = myObj.format(myFormatObj);
        //----------------------VALOR/QUANTIDADE/DATA---------------------------
        
        request.setAttribute("dataAtual", formattedDate);
        request.setAttribute("valorTotalNoCarrinho", valorString);
        request.setAttribute("quantidadeDeItens", quantidadeDeItens);
        request.setAttribute("listaCarrinho", listaLivroCarrinho);

        request.getRequestDispatcher("JSP-PAGES/consultaCarrinho.jsp").forward(request, response);
    }
}
