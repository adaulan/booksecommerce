/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

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
public class LivroDAO {

    /**
     * Insere um novo Livro no Banco de Dados
     *
     * @param livro como objeto com todos os valores já inseridos
     * @return true se foi inserido corretamente ou false caso algum erro ocorra
     * @throws SQLException
     * @throws Exception
     */
    public static boolean inserir(Livro livro)
            throws SQLException, Exception {
        /*Monta a string de inserção de um cliente no BD,
        utilizando os dados do clientes passados como parâmetro*/
        String sql = "INSERT INTO PRODUTOS (STATUS,TITULO,AUTOR,EDITORA,DESCRICAO,IMAGEM,IMAGEM1,IMAGEM2,VALORVENDA,VALORCUSTO,CATEGORIA,"
                + "QUANTIDADE,DATACADASTRO,NUMEROPAGINA,ACABAMENTO,IDIOMA,ALTURA,LARGURA,PESO,ISBN,TAG) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            preparedStatement.setString(1, livro.getStatus());
            preparedStatement.setString(2, livro.getTitulo());
            preparedStatement.setString(3, livro.getAutor());
            preparedStatement.setString(4, livro.getEditora());
            preparedStatement.setString(5, livro.getDescricao());
            preparedStatement.setString(6, livro.getImagem());
            preparedStatement.setString(7, livro.getImagem1());
            preparedStatement.setString(8, livro.getImagem2());
            preparedStatement.setFloat(9, livro.getValorVenda());
            preparedStatement.setFloat(10, livro.getValorCusto());
            preparedStatement.setString(11, livro.getCategoria());
            preparedStatement.setInt(12, livro.getQuantidade());
            preparedStatement.setString(13, livro.getData());
            preparedStatement.setInt(14, livro.getPaginas());
            preparedStatement.setString(15, livro.getAcabamento());
            preparedStatement.setString(16, livro.getIdioma());
            preparedStatement.setString(17, livro.getAltura());
            preparedStatement.setString(18, livro.getLargura());
            preparedStatement.setFloat(19, livro.getPeso());
            preparedStatement.setString(20, livro.getISBN());
            preparedStatement.setString(21, livro.getTag());
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

    public static List<Livro> listar()
            throws SQLException, Exception {
        //Monta a string de listagem de clientes no banco, considerando
        //apenas a coluna de ativação de clientes ("enabled")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PRODUTOS WHERE STATUS != 'I'";
        //Lista de clientes de resultado
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

    public static List<Livro> listarMaisVendidos()
            throws SQLException, Exception {
        //Monta a string de listagem de clientes no banco, considerando
        //apenas a coluna de ativação de clientes ("enabled")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PRODUTOS WHERE STATUS != 'I' AND TAG = 'Mais Vendidos' LIMIT 20";
        //Lista de clientes de resultado
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
    
    public static List<Livro> listarNovos()
            throws SQLException, Exception {
        //Monta a string de listagem de clientes no banco, considerando
        //apenas a coluna de ativação de clientes ("enabled")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PRODUTOS WHERE STATUS != 'I' AND TAG = 'Lançamento' LIMIT 20";
        //Lista de clientes de resultado
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
    
    public static List<Livro> listarMenorPreco()
            throws SQLException, Exception {
        //Monta a string de listagem de clientes no banco, considerando
        //apenas a coluna de ativação de clientes ("enabled")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PRODUTOS WHERE STATUS != 'I' ORDER BY VALORVENDA LIMIT 20";
        //Lista de clientes de resultado
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

    public static List<Livro> buscar(String busca)
            throws SQLException, Exception {
        //Monta a string de listagem de produtos no banco
        String sql = "SELECT * FROM PRODUTOS WHERE (STATUS != 'I' AND TITULO  LIKE  ?) or (STATUS != 'I' AND STATUS LIKE ?)"
                + " or (STATUS != 'I' AND AUTOR LIKE ?)or (STATUS != 'I' AND VALORVENDA  LIKE  ?) or (STATUS != 'I' AND CATEGORIA LIKE ?)"
                + " or (STATUS != 'I' AND DATACADASTRO LIKE ?) or (STATUS != 'I' AND IDIOMA LIKE ?) or (STATUS != 'I' AND ISBN LIKE ?)"
                + " or (STATUS != 'I' AND TAG LIKE ?) or (STATUS != 'I' AND EDITORA LIKE ?)";
        busca = '%' + busca + '%';
        //Lista de livros de resultado
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
            preparedStatement.setString(1, busca);
            preparedStatement.setString(2, busca);
            preparedStatement.setString(3, busca);
            preparedStatement.setString(4, busca);
            preparedStatement.setString(5, busca);
            preparedStatement.setString(6, busca);
            preparedStatement.setString(7, busca);
            preparedStatement.setString(8, busca);
            preparedStatement.setString(9, busca);
            preparedStatement.setString(10, busca);
            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Livro>();
                }
                //Cria uma instância de Livros e popula com os valores do BD

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
                //Crio o Objeto livro com os valores
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
        //Retorna a lista de livros do banco de dados
        return listaProduto;
    }

    public static Livro getByID(int ID)
            throws SQLException, Exception {
        //Monta a string de listagem de livros no banco, considerando
        //apenas a coluna de ativação de livros ("enabled")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PRODUTOS WHERE ID =? ";
        //Lista de clientes de resultado
        Livro livro = null;
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
                if (livro == null) {
                    livro = new Livro();
                }
                //Cria uma instância de Cliente e popula com os valores do BD

                int IDLivro = result.getInt("ID");
                System.out.println("ID LIVRO NO SQL " + IDLivro);
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
                int Quantidade = result.getInt("QUANTIDADE");
                String Data = result.getString("DATACADASTRO");
                int Paginas = result.getInt("NUMEROPAGINA");
                String Acabamento = result.getString("ACABAMENTO");
                String Idioma = result.getString("IDIOMA");
                String Altura = result.getString("ALTURA");
                String Largura = result.getString("LARGURA");
                float Peso = result.getFloat("PESO");
                String ISBN = result.getString("ISBN");
                String Tag = result.getString("TAG");
                Livro L = new Livro(IDLivro, Status, Titulo, Autor, Editora, Descricao, Imagem, Imagem1, Imagem2, ValorVenda, ValorCusto, Categoria, Quantidade,
                        Data, Paginas, Acabamento, Idioma, Altura, Largura, Peso, ISBN, Tag);
                //Adiciona a instância na lista
                livro = L;
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
        return livro;
    }
    
    public static List<Livro> buscarPorAutor(String autor, int ID)
            throws SQLException, Exception {
        //Monta a string de listagem de produtos no banco
        String sql = "SELECT * FROM PRODUTOS WHERE (STATUS != 'I' AND AUTOR LIKE ? AND ID != ?)";
        autor = '%' + autor + '%';
        
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
            preparedStatement.setString(1, autor);
            preparedStatement.setInt(2, ID);
            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Livro>();
                }
                //Cria uma instância de Produtos e popula com os valores do BD

                int IDs = result.getInt("ID");
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
                //Crio o Objeto livro com os valores
                Livro L = new Livro(IDs, Status, Titulo, Autor, Editora, Descricao, Imagem, Imagem1, Imagem2, ValorVenda, ValorCusto, Categoria, Quantidade,
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
    
    public static List<Livro> buscarPorTag(String tag)
            throws SQLException, Exception {
        //Monta a string de listagem de produtos no banco
        String sql = "SELECT * FROM PRODUTOS WHERE (STATUS != 'I' AND TAG LIKE ?)";
        tag = '%' + tag + '%';
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
            preparedStatement.setString(1, tag);
            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Livro>();
                }
                //Cria uma instância de Produtos e popula com os valores do BD

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
                //Crio o Objeto livro com os valores
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
    
    

    public static boolean atualizar(Livro livro)
            throws SQLException, Exception {
        /*Monta a string de inserção de um cliente no BD,
        utilizando os dados do clientes passados como parâmetro*/
        String sql = "UPDATE PRODUTOS SET STATUS=?,TITULO=? , AUTOR=?, EDITORA=?, DESCRICAO=?, IMAGEM=?, IMAGEM1=?, IMAGEM2=?, "
                + "VALORVENDA=?, VALORCUSTO=?, CATEGORIA=?, QUANTIDADE=?, DATACADASTRO=?,"
                + " NUMEROPAGINA=?, ACABAMENTO=?, IDIOMA=?, ALTURA=?, LARGURA=?, PESO=?, ISBN=?, TAG=? WHERE ID=?";
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
            preparedStatement.setString(1, livro.getStatus());
            preparedStatement.setString(2, livro.getTitulo());
            preparedStatement.setString(3, livro.getAutor());
            preparedStatement.setString(4, livro.getEditora());
            preparedStatement.setString(5, livro.getDescricao());
            preparedStatement.setString(6, livro.getImagem());
            preparedStatement.setString(7, livro.getImagem1());
            preparedStatement.setString(8, livro.getImagem2());
            preparedStatement.setFloat(9, livro.getValorVenda());
            preparedStatement.setFloat(10, livro.getValorCusto());
            preparedStatement.setString(11, livro.getCategoria());
            preparedStatement.setInt(12, livro.getQuantidade());
            preparedStatement.setString(13, livro.getData());
            preparedStatement.setInt(14, livro.getPaginas());
            preparedStatement.setString(15, livro.getAcabamento());
            preparedStatement.setString(16, livro.getIdioma());
            preparedStatement.setString(17, livro.getAltura());
            preparedStatement.setString(18, livro.getLargura());
            preparedStatement.setFloat(19, livro.getPeso());
            preparedStatement.setString(20, livro.getISBN());
            preparedStatement.setString(21, livro.getTag());
            preparedStatement.setInt(22, livro.getID());
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

    public static boolean atualizarStatus(Livro livro)
            throws SQLException, Exception {
        /*Monta a string de inserção de um cliente no BD,
        utilizando os dados do clientes passados como parâmetro*/
        String sql = "UPDATE PRODUTOS SET STATUS = ? WHERE ID=?";
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
            preparedStatement.setString(1, livro.getStatus());
            preparedStatement.setInt(2, livro.getID());
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
