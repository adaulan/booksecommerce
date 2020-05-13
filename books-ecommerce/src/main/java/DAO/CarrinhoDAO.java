/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Carrinho;
import MODELS.Livro;
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
public class CarrinhoDAO {
    
    
    public static boolean inserir(Carrinho carrinho)
            throws SQLException, Exception {
        /*Monta a string de inserção de um carrinho no BD,
        utilizando os dados do carrinho passados como parâmetro*/
        String sql = "INSERT INTO CARRINHO (ID,IDPRODUTO,STATUS) VALUES (?,?,?)";
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
            preparedStatement.setString(3, carrinho.getStatus());
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
    
    public static List<Livro> listarProdutos()
            throws SQLException, Exception {
        //Monta a string de listagem de produtos no banco, considerando
        //apenas a coluna de ativação de carrinho ("A")
        String sql = "SELECT PRODUTOS.ID,PRODUTOS.STATUS,PRODUTOS.TITULO,PRODUTOS.AUTOR,PRODUTOS.EDITORA,"
                + "PRODUTOS.DESCRICAO,PRODUTOS.IMAGEM,PRODUTOS.IMAGEM1,PRODUTOS.IMAGEM2,PRODUTOS.VALORVENDA,PRODUTOS.VALORCUSTO,PRODUTOS.CATEGORIA,"
                + "PRODUTOS.QUANTIDADE,PRODUTOS.DATACADASTRO,PRODUTOS.NUMEROPAGINA,PRODUTOS.ACABAMENTO,PRODUTOS.IDIOMA,"
                + "PRODUTOS.ALTURA,PRODUTOS.ALTURA,PRODUTOS.LARGURA,PRODUTOS.PESO,PRODUTOS.ISBN,PRODUTOS.TAG"
                + " FROM CARRINHO JOIN USUARIO JOIN PRODUTOS WHERE USUARIO.ID = CARRINHO.ID AND "
                + "PRODUTOS.ID = CARRINHO.IDPRODUTO AND CARRINHO.STATUS = 'A';";
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
}
