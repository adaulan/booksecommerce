/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import DAO.CarrinhoDAO;
import DAO.EnderecoDAO;
import MODELS.Carrinho;
import MODELS.Endereco;
import MODELS.Livro;
import MODELS.Pedido;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "fecharPedidoServlet", urlPatterns = {"/fecharPedidoServlet"})
public class fecharPedidoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
        Pedido P = new Pedido();
        String STATUS = "aguardando pagamento";
        int IDUsuario = (int) sessao.getAttribute("IDUsuario");

        try {
            P = CarrinhoDAO.getPedidoByIDCliente(IDUsuario);
            if (CarrinhoDAO.atualizarStatusPedido(STATUS, P.getID())) {
                
            } else {
                request.setAttribute("alertaResposta", "falha");
            }
        } catch (Exception ex) {
            Logger.getLogger(fecharPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        List<Livro> listaLivroCarrinho = null;
        try {
            listaLivroCarrinho = CarrinhoDAO.listarProdutos(IDUsuario);

            if (listaLivroCarrinho != null) {
                for (Livro L : listaLivroCarrinho) {
                    Carrinho C = CarrinhoDAO.getByID(IDUsuario, L.getID());
                    C.setIDPedido(P.getID());
                    C.setStatus("I");
                    CarrinhoDAO.atualizarIDPedido(C);
                }
            }

        } catch (Exception ex) {
            Logger.getLogger(consultaCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("consultarPedidosServlet").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();

        int IDUsuario = (int) sessao.getAttribute("IDUsuario");
        java.sql.Date sqlDate = new java.sql.Date(System.currentTimeMillis());

        List<Livro> listaLivroCarrinho = null;
        try {
            listaLivroCarrinho = CarrinhoDAO.listarProdutos(IDUsuario);
        } catch (Exception ex) {
            Logger.getLogger(consultaCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        //----------------------VALOR---------------------------
        float valorTotal = 0;
        if (listaLivroCarrinho != null) {

            for (Livro L : listaLivroCarrinho) {
                valorTotal = valorTotal + (L.getValorVenda() * L.getQuantidade());
            }
        }

        String formaDePagamento = request.getParameter("formaPagamento");
        int IDEndereco = Integer.parseInt(request.getParameter("IDEndereco"));
        String STATUS = "Não concluído";

        try {
            if (CarrinhoDAO.inserirPedido(IDUsuario, sqlDate, valorTotal, formaDePagamento, IDEndereco, STATUS)) {
                
            } else {
                request.setAttribute("alertaResposta", "falha");
            }
        } catch (Exception ex) {
            Logger.getLogger(fecharPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        Endereco E = new Endereco();
        try {
            E = EnderecoDAO.getByID(IDEndereco);
        } catch (Exception ex) {
            Logger.getLogger(fecharPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        sessao.setAttribute("enderecoDeEntrega", E);
        request.getRequestDispatcher("JSP-PAGES/resumoPedido.jsp").forward(request, response);
    }

}
