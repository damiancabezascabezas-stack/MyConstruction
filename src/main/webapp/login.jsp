<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>My Construction - Login</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #edf1f5;
            font-family: Arial, sans-serif;
        }

        .contenedor {
            width: 380px;
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 5px 25px #00000018;
        }

        h2 {
            color: #20364c;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 18px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-top: 7px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 13px;
            margin-top: 25px;
            background: #e6a13b;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        .volver {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #20364c;
        }

        .error {
            color: #b42318;
            text-align: center;
        }
    </style>
</head>

<body>

    <div class="contenedor">

        <h2>MY CONSTRUCTION</h2>
        <p style="text-align:center;">
            Acceso al sistema
        </p>

        <% if ("1".equals(request.getParameter("error"))) { %>
            <p class="error">
                Correo o contraseña incorrectos.
            </p>
        <% } %>

        <form action="${pageContext.request.contextPath}/login"
              method="post">

            <label for="correo">
                Correo electrónico
            </label>

            <input type="email"
                   id="correo"
                   name="correo"
                   required>

            <label for="password">
                Contraseña
            </label>

            <input type="password"
                   id="password"
                   name="password"
                   required>

            <button type="submit">
                Iniciar sesión
            </button>

        </form>

        <a class="volver"
           href="${pageContext.request.contextPath}/">
            Volver al inicio
        </a>

    </div>

</body>
</html>