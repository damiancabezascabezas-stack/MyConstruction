package cl.myconstruction.dao;

import cl.myconstruction.config.ConexionBD;
import cl.myconstruction.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

public class UsuarioDAO {

    public Usuario autenticar(
            String correo, String password)
            throws SQLException {

        String sql = """
            SELECT id, nombre, correo, password_hash
            FROM usuarios
            WHERE correo = ? AND activo = TRUE
            """;

        try (Connection conexion =
                 ConexionBD.obtenerConexion();

             PreparedStatement ps =
                 conexion.prepareStatement(sql)) {

            ps.setString(1, correo);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    String hash =
                        rs.getString("password_hash");

                    if (BCrypt.checkpw(password, hash)) {

                        return new Usuario(
                            rs.getInt("id"),
                            rs.getString("nombre"),
                            rs.getString("correo")
                        );
                    }
                }
            }
        }

        return null;
    }
}