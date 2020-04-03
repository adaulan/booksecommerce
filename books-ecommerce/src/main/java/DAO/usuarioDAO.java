/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Adaulan
 */
public class usuarioDAO {

    public static boolean inserir(Usuario usuario)
            throws SQLException, Exception {
        System.out.println("Entrou no Inserir");
        //Monta a string de inserção de um usuario no BD,
        //utilizando os dados do usuario passados como parâmetro
        String sql = "INSERT INTO usuario (NOME,USUARIO,SENHA,EMAIL,TIPO,DATANASC) VALUES (?,?,?,?,?,?)";
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = connectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            //Configura os parâmetros do "PreparedStatement"
            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getUsuario());
            preparedStatement.setString(3, usuario.getSenha());
            preparedStatement.setString(4, usuario.getEmail());
            preparedStatement.setString(5, usuario.getTipo());
            preparedStatement.setString(6, usuario.getDataNascimento());

            //Executa o comando no banco de dados
            preparedStatement.execute();
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
            return false;
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
        return true;
    }
}
