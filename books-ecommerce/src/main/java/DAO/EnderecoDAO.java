/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Endereco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Adaulan
 */
public class EnderecoDAO {

    public static boolean inserir(Endereco endereco)
            throws SQLException, Exception {
        /*Monta a string de inserção de um endereco no BD,
        utilizando os dados do endereco passados como parâmetro*/
        String sql = "INSERT INTO ENDERECOS (ID,IDUSUARIO, STATUS,CEP, CIDADE,ESTADO,ENDERECO,COMPLEMENTO)"
                + "VALUES (?,?,?,?,?,?,?,?)";
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
            preparedStatement.setInt(1, endereco.getID());
            preparedStatement.setInt(2, endereco.getIDUSUARIO());
            preparedStatement.setString(3, endereco.getStatus());
            preparedStatement.setString(4, endereco.getCEP());
            preparedStatement.setString(5, endereco.getCidade());
            preparedStatement.setString(6, endereco.getEstado());
            preparedStatement.setString(7, endereco.getEndereco());
            preparedStatement.setString(8, endereco.getComplemento());

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

    public static List<Endereco> listByID(int ID)
            throws SQLException, Exception {
        //Monta a string de listagem de enderecos no banco, considerando
        //apenas a coluna de ativação de endereco ("A")
        String sql = "SELECT * FROM ENDERECOS JOIN USUARIO ON USUARIO.ID = ENDERECOS.IDUSUARIO WHERE ENDERECOS.STATUS='A'\n"
                + "AND USUARIO.ID = ?";
        //Lista de endereco de resultado
        List<Endereco> listaEndereco = null;
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = connectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            //Configura os parâmetros do "PreparedStatement"
            preparedStatement.setInt(1, ID);
            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaEndereco == null) {
                    listaEndereco = new ArrayList<Endereco>();
                }
                //Cria uma instância de Usuario e popula com os valores do BD

                int IDEndereco = result.getInt("ID");
                int IDUSUARIO = result.getInt("IDUSUARIO");
                String Status = result.getString("STATUS");
                String CEP = result.getString("CEP");
                String CIDADE = result.getString("CIDADE");
                String ESTADO = result.getString("ESTADO");
                String ENDERECO = result.getString("ENDERECO");
                String COMPLEMENTO = result.getString("COMPLEMENTO");

                Endereco E = new Endereco(IDEndereco, IDUSUARIO, Status, CEP, CIDADE, ESTADO, ENDERECO, COMPLEMENTO);
                //Adiciona a instância na lista
                listaEndereco.add(E);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        //Retorna a lista de enderecos do usuario no banco de dados
        return listaEndereco;
    }

    public static Endereco getByID(int ID)
            throws SQLException, Exception {
        //Monta a string de listagem de usuario no banco, considerando
        //apenas a coluna de ativação de usuario ("A")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.ENDERECOS WHERE ID =? ";
        //Lista de usuario de resultado
        Endereco endereco = null;
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = connectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            //Configura os parâmetros do "PreparedStatement"
            preparedStatement.setInt(1, ID);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (endereco == null) {
                    endereco = new Endereco();
                }
                //Cria uma instância de Usuario e popula com os valores do BD

                int IDEndereco = result.getInt("ID");
                int IDUSUARIO = result.getInt("IDUSUARIO");
                String Status = result.getString("STATUS");
                String CEP = result.getString("CEP");
                String CIDADE = result.getString("CIDADE");
                String ESTADO = result.getString("ESTADO");
                String ENDERECO = result.getString("ENDERECO");
                String COMPLEMENTO = result.getString("COMPLEMENTO");

                Endereco E = new Endereco(IDEndereco, IDUSUARIO, Status, CEP, CIDADE, ESTADO, ENDERECO, COMPLEMENTO);

                endereco = E;
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        //Retorna a endereco do banco de dados
        return endereco;
    }

    public static boolean atualizar(Endereco endereco)
            throws SQLException, Exception {
        /*Monta a string de atualização de um endereco no BD,
        utilizando os dados do endereco passados como parâmetro*/
        String sql = "UPDATE ENDERECOS SET CEP=?, STATUS=?, CIDADE=?, ESTADO=?, ENDERECO=?, COMPLEMENTO=? WHERE ID=?";
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
            preparedStatement.setString(1, endereco.getCEP());
            preparedStatement.setString(2, endereco.getStatus());
            preparedStatement.setString(3, endereco.getCidade());
            preparedStatement.setString(4, endereco.getEstado());
            preparedStatement.setString(5, endereco.getEndereco());
            preparedStatement.setString(6, endereco.getComplemento());
            preparedStatement.setInt(7, endereco.getID());
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
