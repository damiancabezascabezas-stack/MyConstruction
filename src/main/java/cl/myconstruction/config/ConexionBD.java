package cl.myconstruction.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    private static final String URL =
        "jdbc:mysql://localhost:3306/myconstruction";

    public static Connection obtenerConexion()
            throws SQLException {

        String usuario = System.getenv("DB_USER");
        String password = System.getenv("DB_PASSWORD");

        if (usuario == null || password == null) {
            throw new SQLException(
                "Faltan las variables DB_USER o DB_PASSWORD"
            );
        }

        return DriverManager.getConnection(
            URL, usuario, password
        );
    }
}