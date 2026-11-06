package cl.myconstruction.controller;

import cl.myconstruction.dao.UsuarioDAO;
import cl.myconstruction.model.Usuario;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        if (correo == null || password == null
                || correo.isBlank() || password.isBlank()) {

            response.sendRedirect(
                request.getContextPath()
                + "/login.jsp?error=1"
            );
            return;
        }

        UsuarioDAO dao = new UsuarioDAO();

        try {

            Usuario usuario =
                dao.autenticar(correo, password);

            if (usuario != null) {

                HttpSession sesion = request.getSession();

                request.changeSessionId();

                sesion.setAttribute(
                    "usuario", usuario
                );

                sesion.setMaxInactiveInterval(1800);

                response.sendRedirect(
                    request.getContextPath() + "/panel"
                );

            } else {

                response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp?error=1"
                );
            }

        } catch (SQLException e) {

            getServletContext().log(
                "Error al autenticar usuario", e
            );

            response.sendError(
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                "No fue posible procesar el inicio de sesión."
            );
        }
    }
}