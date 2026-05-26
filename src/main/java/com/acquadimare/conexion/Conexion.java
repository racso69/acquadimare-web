package com.acquadimare.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    // Si tu puerto es el estándar es 5432, si lo cambiaste usa 5433
    private static final String URL = "jdbc:postgresql://localhost:5432/acquadimare_db";
    private static final String USER = "postgres";
    private static final String PASSWORD = "696986"; // <-- Coloca tu clave aquí
    
    private static Connection conexion = null;

    public static Connection getConexion() {
        try {
            if (conexion == null || conexion.isClosed()) {
                // Registramos el driver de PostgreSQL
                Class.forName("org.postgresql.Driver");
                conexion = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("¡CONEXIÓN EXITOSA A ACQUA DI MARE DB!");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("ERROR DE CONEXIÓN: " + e.getMessage());
        }
        return conexion;
    }
}