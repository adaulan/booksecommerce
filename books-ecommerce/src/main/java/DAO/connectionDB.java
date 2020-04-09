/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Adaulan
 */
public class connectionDB {
    
         public static Connection getConnection()
            throws ClassNotFoundException, SQLException {
        Connection conn = null;

        // Passo 1: Registrar driver JDBC
        Class.forName("com.mysql.jdbc.Driver");
        // Passo 2: Obter a conexao
        conn = DriverManager.getConnection(
                "jdbc:mysql://127.0.0.1:3306/ECOMMERCE_PROJECT",
                "root",
                "");
        return conn;
         }
    
}
