/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Usuario;
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
public class UsuarioDAO {

    public static boolean inserir(Usuario usuario)
            throws SQLException, Exception {
        /*Monta a string de inserção de um usuario no BD,
        utilizando os dados do usuario passados como parâmetro*/
        String sql = "INSERT INTO USUARIOS (ID, STATUS,NOME,USUARIO,SENHA,EMAIL,TIPO,DATANASC,CELULAR,CPF) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?)";
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
            preparedStatement.setInt(1, usuario.getID());
            preparedStatement.setString(2, usuario.getStatus());
            preparedStatement.setString(3, usuario.getNome());
            preparedStatement.setString(4, usuario.getSenha());
            preparedStatement.setString(5, usuario.getEmail());
            preparedStatement.setString(6, usuario.getTipo());
            preparedStatement.setString(7, usuario.getDataNascimento());
            preparedStatement.setString(8, usuario.getCelular());
            preparedStatement.setString(9, usuario.getCPF());
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

    public static List<Usuario> buscar(String busca)
            throws SQLException, Exception {
        //Monta a string de listagem de usuarios no banco
        String sql = "SELECT * FROM USUARIO WHERE (STATUS != 'I' AND ID  LIKE  ?) or (STATUS != 'I' AND STATUS LIKE ?)"
                + " or (STATUS != 'I' AND NOME LIKE ?)or (STATUS != 'I' AND USUARIO  LIKE  ?) or (STATUS != 'I' AND EMAIL LIKE ?)"
                + " or (STATUS != 'I' AND TIPO LIKE ?) or (STATUS != 'I' AND DATANASC LIKE ?) or (STATUS != 'I' AND CELULAR LIKE ?)"
                + " or (STATUS != 'I' AND CPF LIKE ?)";
        busca = '%' + busca + '%';
        //Lista de usuarios de resultado
        List<Usuario> listaUsuario = null;
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
            preparedStatement.setString(1, busca);
            preparedStatement.setString(2, busca);
            preparedStatement.setString(3, busca);
            preparedStatement.setString(4, busca);
            preparedStatement.setString(5, busca);
            preparedStatement.setString(6, busca);
            preparedStatement.setString(7, busca);
            preparedStatement.setString(8, busca);
            preparedStatement.setString(9, busca);
            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaUsuario == null) {
                    listaUsuario = new ArrayList<Usuario>();
                }
                //Cria uma instância de Livros e popula com os valores do BD

                int ID = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Nome = result.getString("NOME");
                String User = result.getString("USUARIO");
                String Senha = result.getString("SENHA");
                String Email = result.getString("EMAIL");
                String Tipo = result.getString("TIPO");
                String DataNascimento = result.getString("DATANASC");
                String Celular = result.getString("CELULAR");
                String CPF = result.getString("CPF");
                //Crio o Objeto Usuario com os valores
                Usuario U = new Usuario(ID, Status, Nome, User, Senha, Email, Tipo, DataNascimento, Celular, CPF);
                //Adiciona a instância na lista
                listaUsuario.add(U);
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
        //Retorna a lista de livros do banco de dados
        return listaUsuario;
    }

    public static Usuario getByID(int ID)
            throws SQLException, Exception {
        //Monta a string de listagem de usuario no banco, considerando
        //apenas a coluna de ativação de usuario ("A")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.USUARIO WHERE ID =? ";
        //Lista de usuario de resultado
        Usuario usuario = null;
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
                if (usuario == null) {
                    usuario = new Usuario();
                }
                //Cria uma instância de Usuario e popula com os valores do BD

                int IDUsuario = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Nome = result.getString("NOME");
                String User = result.getString("USUARIO");
                String Senha = result.getString("SENHA");
                String Email = result.getString("EMAIL");
                String Tipo = result.getString("TIPO");
                String DataNascimento = result.getString("DATANASC");
                String Celular = result.getString("CELULAR");
                String CPF = result.getString("CPF");
                
                Usuario U = new Usuario(IDUsuario, Status, Nome, User, Senha, Email, Tipo, DataNascimento, Celular, CPF);
                //Adiciona a instância na lista
                usuario = U;
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
        //Retorna a lista de usuario do banco de dados
        return usuario;
    }
    
    public static List<Usuario> listar()
            throws SQLException, Exception {
        //Monta a string de listagem de Usuario no banco, considerando
        //apenas a coluna de ativação de Usuario ("A")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.USUARIO WHERE STATUS != 'I'";
        //Lista de clientes de resultado
        List<Usuario> listaUsuario = null;
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

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaUsuario == null) {
                    listaUsuario= new ArrayList<Usuario>();
                }
                //Cria uma instância de Usuario e popula com os valores do BD

                int ID = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Nome = result.getString("NOME");
                String Usuario = result.getString("USUARIO");
                String Senha = result.getString("SENHA");
                String Email = result.getString("EMAIL");
                String Tipo = result.getString("TIPO");
                String DataNascimento = result.getString("DATANASC");
                String Celular = result.getString("CELULAR");
                String CPF = result.getString("CPF");
                Usuario U = new Usuario(ID, Status, Nome, Usuario, Senha, Email, Tipo, DataNascimento, Celular, CPF);
                //Adiciona a instância na lista
                listaUsuario.add(U);
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
        //Retorna a lista de clientes do banco de dados
        return listaUsuario;
    }
    
    public static boolean atualizar(Usuario usuario)
            throws SQLException, Exception {
        /*Monta a string de atualização de um usuario no BD,
        utilizando os dados do usuario passados como parâmetro*/
        String sql = "UPDATE USUARIO SET STATUS=?, NOME=?, USUARIO=?, SENHA=?, EMAIL=?, TIPO=?, DATANASC=?, CELULAR=?, CPF=?"
                + " WHERE ID=?";
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
            preparedStatement.setString(1, usuario.getStatus());
            preparedStatement.setString(2, usuario.getNome());
            preparedStatement.setString(3, usuario.getUsuario());
            preparedStatement.setString(4, usuario.getSenha());
            preparedStatement.setString(5, usuario.getEmail());
            preparedStatement.setString(6, usuario.getTipo());
            preparedStatement.setString(7, usuario.getDataNascimento());
            preparedStatement.setString(8, usuario.getCelular());
            preparedStatement.setString(9, usuario.getCPF());
            preparedStatement.setInt(10, usuario.getID());
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

    public static boolean atualizarCliente(Usuario usuario)
            throws SQLException, Exception {
        /*Monta a string de atualização de um usuario no BD,
        utilizando os dados do usuario passados como parâmetro*/
        String sql = "UPDATE USUARIO SET NOME=? , USUARIO=?, SENHA=?, EMAIL=?, DATANASC=?, CELULAR=?, CPF=?"
                + " WHERE ID=?";
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
            preparedStatement.setString(5, usuario.getDataNascimento());
            preparedStatement.setString(6, usuario.getCelular());
            preparedStatement.setString(7, usuario.getCPF());
            preparedStatement.setInt(8, usuario.getID());
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
