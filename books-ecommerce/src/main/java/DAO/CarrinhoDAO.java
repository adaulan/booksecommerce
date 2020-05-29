/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Carrinho;
import MODELS.Livro;
import MODELS.Pedido;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Adaulan
 */
public class CarrinhoDAO {

    public static boolean inserir(Carrinho carrinho)
            throws SQLException, Exception {
        /*Monta a string de inserção de um carrinho no BD,
        utilizando os dados do carrinho passados como parâmetro*/
        String sql = "INSERT INTO CARRINHO (ID,IDPRODUTO,QUANTIDADE,STATUS) VALUES (?,?,?,?)";
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
            preparedStatement.setInt(1, carrinho.getID());
            preparedStatement.setInt(2, carrinho.getIDProduto());
            preparedStatement.setInt(3, carrinho.getQuantidade());
            preparedStatement.setString(4, carrinho.getStatus());
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

    public static boolean inserirPedido(int IDCLIENTE, Date DATAPEDIDO, float VALOR, String FORMADEPAGAMENTO, int IDENDERECO, String STATUS)
            throws SQLException, Exception {
        /*Monta a string de inserção de um pedido no BD,
        utilizando os dados do pedido passados como parâmetro*/
        String sql = "INSERT INTO PEDIDOS(IDCLIENTE,DATAPEDIDO,VALOR,FORMADEPAGAMENTO,IDENDERECO,STATUS) VALUES (?,?,?,?,?,?)";
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
            preparedStatement.setInt(1, IDCLIENTE);
            preparedStatement.setDate(2, DATAPEDIDO);
            preparedStatement.setFloat(3, VALOR);
            preparedStatement.setString(4, FORMADEPAGAMENTO);
            preparedStatement.setInt(5, IDENDERECO);
            preparedStatement.setString(6, STATUS);
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

    public static boolean atualizarStatusPedido(String STATUS, int IDPEDIDO)
            throws SQLException, Exception {
        /*Monta a string de inserção de um cliente no BD,
        utilizando os dados do clientes passados como parâmetro*/
        String sql = "UPDATE PEDIDOS SET STATUS = ? WHERE ID=?";
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
            preparedStatement.setString(1, STATUS);
            preparedStatement.setInt(2, IDPEDIDO);
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
     public static Pedido getPedidoByID(int IDPedido)
            throws SQLException, Exception {
        //Monta a string de pedido no banco, considerando
        //apenas a coluna de status de pedido ("Não finalizado")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PEDIDOS WHERE ID = ?";
        //Lista de clientes de resultado
        Pedido pedido = null;
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
            preparedStatement.setInt(1, IDPedido);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (pedido == null) {
                    pedido = new Pedido();
                }
                //Cria uma instância de Carrinho e popula com os valores do BD

                int IDCliente = result.getInt("IDCLIENTE");
                Date dataPedido = result.getDate("DATAPEDIDO");
                float valor = result.getFloat("VALOR");
                String formaDePagamento = result.getString("FORMADEPAGAMENTO");
                int IDEndereco = result.getInt("IDENDERECO");
                String Status = result.getString("STATUS");

                Pedido P = new Pedido(IDPedido, IDCliente, dataPedido, valor, formaDePagamento,IDEndereco,Status);
                //Adiciona a instância na lista
                pedido = P;
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
        return pedido;
    }
    
    
    public static Pedido getPedidoByIDCliente(int IDCliente)
            throws SQLException, Exception {
        //Monta a string de pedido no banco, considerando
        //apenas a coluna de status de pedido ("Não finalizado")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PEDIDOS WHERE IDCLIENTE = ? AND STATUS = 'Não concluído'";
        //Lista de clientes de resultado
        Pedido pedido = null;
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
            preparedStatement.setInt(1, IDCliente);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (pedido == null) {
                    pedido = new Pedido();
                }
                //Cria uma instância de Carrinho e popula com os valores do BD

                int IDPedido = result.getInt("ID");
                Date dataPedido = result.getDate("DATAPEDIDO");
                float valor = result.getFloat("VALOR");
                String formaDePagamento = result.getString("FORMADEPAGAMENTO");
                int IDEndereco = result.getInt("IDENDERECO");
                String Status = result.getString("STATUS");

                Pedido P = new Pedido(IDPedido, IDCliente, dataPedido, valor, formaDePagamento,IDEndereco,Status);
                //Adiciona a instância na lista
                pedido = P;
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
        return pedido;
    }

    public static List<Pedido> listarPedidos()
            throws SQLException, Exception {
        //Monta a string de pedido no banco, considerando
        //apenas a coluna de status de pedido ("Não finalizado")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PEDIDOS ORDER BY DATAPEDIDO";
        //Lista de Pedidos de resultado
        List<Pedido> listaPedido = null;
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
                if (listaPedido == null) {
                    listaPedido = new ArrayList<Pedido>();
                }
                //Cria uma instância de Carrinho e popula com os valores do BD
                int IDPedido = result.getInt("ID");
                int IDCliente = result.getInt("IDCLIENTE");
                Date dataPedido = result.getDate("DATAPEDIDO");
                float valor = result.getFloat("VALOR");
                String formaDePagamento = result.getString("FORMADEPAGAMENTO");
                int IDEndereco = result.getInt("IDENDERECO");
                String Status = result.getString("STATUS");

                Pedido P = new Pedido(IDPedido, IDCliente, dataPedido, valor, formaDePagamento,IDEndereco,Status);
                //Adiciona a instância na lista
                listaPedido.add(P);
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
        return listaPedido;
    }
    
    
    public static List<Livro> listarProdutos(int IDUsuario)
            throws SQLException, Exception {
        //Monta a string de listagem de produtos no banco, considerando
        //apenas a coluna de ativação de carrinho ("A")
        String sql = "SELECT PRODUTOS.ID,PRODUTOS.STATUS,PRODUTOS.TITULO,PRODUTOS.AUTOR,PRODUTOS.EDITORA,"
                + "PRODUTOS.DESCRICAO,PRODUTOS.IMAGEM,PRODUTOS.IMAGEM1,PRODUTOS.IMAGEM2,PRODUTOS.VALORVENDA,PRODUTOS.VALORCUSTO,PRODUTOS.CATEGORIA,"
                + "CARRINHO.QUANTIDADE,PRODUTOS.DATACADASTRO,PRODUTOS.NUMEROPAGINA,PRODUTOS.ACABAMENTO,PRODUTOS.IDIOMA,"
                + "PRODUTOS.ALTURA,PRODUTOS.ALTURA,PRODUTOS.LARGURA,PRODUTOS.PESO,PRODUTOS.ISBN,PRODUTOS.TAG"
                + " FROM CARRINHO JOIN USUARIO JOIN PRODUTOS WHERE USUARIO.ID = CARRINHO.ID AND "
                + "PRODUTOS.ID = CARRINHO.IDPRODUTO AND CARRINHO.STATUS = 'A' AND USUARIO.ID = ?;";
        //Lista de produtos de resultado
        List<Livro> listaProduto = null;
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
            preparedStatement.setInt(1, IDUsuario);
            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Livro>();
                }
                //Cria uma instância de Cliente e popula com os valores do BD

                int ID = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Titulo = result.getString("TITULO");
                String Autor = result.getString("AUTOR");
                String Editora = result.getString("EDITORA");
                String Descricao = result.getString("DESCRICAO");
                String Imagem = result.getString("IMAGEM");
                String Imagem1 = result.getString("IMAGEM1");
                String Imagem2 = result.getString("IMAGEM2");
                float ValorVenda = result.getFloat("VALORVENDA");
                float ValorCusto = result.getFloat("VALORCUSTO");
                String Categoria = result.getString("CATEGORIA");
                int Quantidade = Integer.parseInt(result.getString("QUANTIDADE"));
                String Data = result.getString("DATACADASTRO");
                int Paginas = result.getInt("NUMEROPAGINA");
                String Acabamento = result.getString("ACABAMENTO");
                String Idioma = result.getString("IDIOMA");
                String Altura = result.getString("ALTURA");
                String Largura = result.getString("LARGURA");
                float Peso = result.getFloat("PESO");
                String ISBN = result.getString("ISBN");
                String Tag = result.getString("TAG");
                Livro L = new Livro(ID, Status, Titulo, Autor, Editora, Descricao, Imagem, Imagem1, Imagem2, ValorVenda, ValorCusto, Categoria, Quantidade,
                        Data, Paginas, Acabamento, Idioma, Altura, Largura, Peso, ISBN, Tag);
                //Adiciona a instância na lista
                listaProduto.add(L);
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
        return listaProduto;
    }
    
    public static List<Livro> listarProdutosPedido(int IDPedido)
            throws SQLException, Exception {
        //Monta a string de listagem de produtos no banco, considerando
        //apenas a coluna de ativação de carrinho ("A")
        String sql = "SELECT PRODUTOS.ID,PRODUTOS.STATUS,PRODUTOS.TITULO,PRODUTOS.AUTOR,PRODUTOS.EDITORA,"
                + "PRODUTOS.DESCRICAO,PRODUTOS.IMAGEM,PRODUTOS.IMAGEM1,PRODUTOS.IMAGEM2,PRODUTOS.VALORVENDA,PRODUTOS.VALORCUSTO,PRODUTOS.CATEGORIA,"
                + "CARRINHO.QUANTIDADE,PRODUTOS.DATACADASTRO,PRODUTOS.NUMEROPAGINA,PRODUTOS.ACABAMENTO,PRODUTOS.IDIOMA,"
                + "PRODUTOS.ALTURA,PRODUTOS.ALTURA,PRODUTOS.LARGURA,PRODUTOS.PESO,PRODUTOS.ISBN,PRODUTOS.TAG"
                + " FROM CARRINHO JOIN PRODUTOS WHERE CARRINHO.IDPEDIDO = ? AND PRODUTOS.ID = CARRINHO.IDPRODUTO";
        //Lista de produtos de resultado
        List<Livro> listaProduto = null;
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
            preparedStatement.setInt(1, IDPedido);
            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Livro>();
                }
                //Cria uma instância de Cliente e popula com os valores do BD

                int ID = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Titulo = result.getString("TITULO");
                String Autor = result.getString("AUTOR");
                String Editora = result.getString("EDITORA");
                String Descricao = result.getString("DESCRICAO");
                String Imagem = result.getString("IMAGEM");
                String Imagem1 = result.getString("IMAGEM1");
                String Imagem2 = result.getString("IMAGEM2");
                float ValorVenda = result.getFloat("VALORVENDA");
                float ValorCusto = result.getFloat("VALORCUSTO");
                String Categoria = result.getString("CATEGORIA");
                int Quantidade = Integer.parseInt(result.getString("QUANTIDADE"));
                String Data = result.getString("DATACADASTRO");
                int Paginas = result.getInt("NUMEROPAGINA");
                String Acabamento = result.getString("ACABAMENTO");
                String Idioma = result.getString("IDIOMA");
                String Altura = result.getString("ALTURA");
                String Largura = result.getString("LARGURA");
                float Peso = result.getFloat("PESO");
                String ISBN = result.getString("ISBN");
                String Tag = result.getString("TAG");
                Livro L = new Livro(ID, Status, Titulo, Autor, Editora, Descricao, Imagem, Imagem1, Imagem2, ValorVenda, ValorCusto, Categoria, Quantidade,
                        Data, Paginas, Acabamento, Idioma, Altura, Largura, Peso, ISBN, Tag);
                //Adiciona a instância na lista
                listaProduto.add(L);
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
        return listaProduto;
    }
    

    public static boolean atualizarQuantidade(Carrinho carrinho)
            throws SQLException, Exception {
        /*Monta a string de atualizacao de um carrinho no BD,
        utilizando os dados do carrinho passados como parâmetro*/
        String sql = "UPDATE CARRINHO SET ID =?, IDPRODUTO =?, QUANTIDADE =?,STATUS =? WHERE ID =? AND IDPRODUTO =? AND STATUS ='A'";
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
            preparedStatement.setInt(1, carrinho.getID());
            preparedStatement.setInt(2, carrinho.getIDProduto());
            preparedStatement.setInt(3, carrinho.getQuantidade());
            preparedStatement.setString(4, carrinho.getStatus());
            preparedStatement.setInt(5, carrinho.getID());
            preparedStatement.setInt(6, carrinho.getIDProduto());
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

    public static boolean atualizarStatus(Carrinho carrinho)
            throws SQLException, Exception {
        /*Monta a string de atualizacao de um carrinho no BD,
        utilizando os dados do carrinho passados como parâmetro*/
        String sql = "UPDATE CARRINHO SET ID =?, IDPRODUTO =?, QUANTIDADE =?,STATUS =? WHERE ID =? AND IDPRODUTO =? AND STATUS ='A'";
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
            preparedStatement.setInt(1, carrinho.getID());
            preparedStatement.setInt(2, carrinho.getIDProduto());
            preparedStatement.setInt(3, carrinho.getQuantidade());
            preparedStatement.setString(4, carrinho.getStatus());
            preparedStatement.setInt(5, carrinho.getID());
            preparedStatement.setInt(6, carrinho.getIDProduto());
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
    
    public static boolean atualizarIDPedido(Carrinho carrinho)
            throws SQLException, Exception {
        /*Monta a string de atualizacao de um carrinho no BD,
        utilizando os dados do carrinho passados como parâmetro*/
        String sql = "UPDATE CARRINHO SET IDPEDIDO = ?,STATUS =? WHERE ID =? AND IDPRODUTO =? AND STATUS ='A'";
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
            preparedStatement.setInt(1, carrinho.getIDPedido());
            preparedStatement.setString(2, carrinho.getStatus());
            preparedStatement.setInt(3, carrinho.getID());
            preparedStatement.setInt(4, carrinho.getIDProduto());
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
    
    public static List<Pedido> listarPedidos(int IDUsuario)
            throws SQLException, Exception {
        //Monta a string de listagem de Pedido no banco, considerando
        //apenas a coluna de ativação de Pedido do usuário Logado
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PEDIDOS WHERE IDCLIENTE = ? LIMIT 20";
        //Lista de Pedido de resultado
        List<Pedido> listaPedido = null;
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
            
            preparedStatement.setInt(1, IDUsuario);
            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaPedido == null) {
                    listaPedido = new ArrayList<Pedido>();
                }
                //Cria uma instância de Usuario e popula com os valores do BD

                int ID = result.getInt("ID");
                Date Data = result.getDate("DATAPEDIDO");
                float Valor = result.getFloat("VALOR");
                String FormaDePagamento = result.getString("FORMADEPAGAMENTO");
                int IDENDERECO = result.getInt("IDENDERECO");
                String Status = result.getString("STATUS");
                
                Pedido P = new Pedido(ID, IDUsuario, Data, Valor, FormaDePagamento,IDENDERECO,Status);
                //Adiciona a instância na lista
                listaPedido.add(P);
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
        return listaPedido;
    }

    public static Carrinho getByID(int IDUsuario, int IDProduto)
            throws SQLException, Exception {
        //Monta a string de carrinho no banco, considerando
        //apenas a coluna de ativação de carrinho ("A")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.CARRINHO WHERE ID =? AND IDPRODUTO =? AND STATUS ='A'";
        //Lista de clientes de resultado
        Carrinho carrinho = null;
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
            preparedStatement.setInt(1, IDUsuario);
            preparedStatement.setInt(2, IDProduto);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (carrinho == null) {
                    carrinho = new Carrinho();
                }
                //Cria uma instância de Carrinho e popula com os valores do BD

                int IDCarrinho = result.getInt("IDCARRINHO");
                int Quantidade = result.getInt("QUANTIDADE");
                String Status = result.getString("STATUS");
                int IDPedido = result.getInt("IDPEDIDO");

                Carrinho C = new Carrinho(IDUsuario, IDProduto, Status, IDPedido, Quantidade);
                //Adiciona a instância na lista
                carrinho = C;
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
        return carrinho;
    }
}
