/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Adaulan
 */
 /* public class produtoDAO {
  public static void inserir(produto produto)
            throws SQLException, Exception {
        //Monta a string de inserção de um cliente no BD,
        //utilizando os dados do clientes passados como parâmetro
        String sql = "INSERT INTO produto (NomeProduto,Descricao,preco,Categoria,Quantidade) VALUES (?,?,?,?,?)";
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionBD.obterConexao();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            //Configura os parâmetros do "PreparedStatement"
            preparedStatement.setString(1, produto.getNomeProduto());
            preparedStatement.setString(2, produto.getDescricaoProduto());
            preparedStatement.setInt(3, produto.getPrecoProduto());
            preparedStatement.setString(4, produto.getCategoriaProduto());
            preparedStatement.setInt(5, produto.getQuantidadeProduto());
            //Executa o comando no banco de dados
            preparedStatement.execute();
        } catch (Exception e) {

            e.getLocalizedMessage();
            System.out.println(e);
        } finally {
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
    }
}*/
