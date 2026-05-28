package com.acquadimare.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    public static Connection getConexion() {
        Connection conexion = null;
        try {
            // Buscamos las variables de entorno de Render
            String url = System.getenv("DB_URL");
            String user = System.getenv("DB_USER");
            String password = System.getenv("DB_PASS");
            
            // Si no existen (estás en tu PC), usamos los valores por defecto
            if (url == null) {
                url = "jdbc:postgresql://localhost:5432/acquadimare_db";
                user = "postgres";
                password = "696986";
            }
            
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(url, user, password);
            System.out.println("¡CONEXIÓN EXITOSA!");
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("ERROR DE CONEXIÓN: " + e.getMessage());
        }
        return conexion;
    }
}
