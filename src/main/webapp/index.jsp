<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>My Construction - Inicio</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            color: #253342;
        }

        header {
            background: #20364c;
            color: white;
            padding: 25px;
            text-align: center;
        }

        nav {
            background: #172a3c;
            padding: 15px;
            text-align: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 20px;
        }

        main {
            max-width: 950px;
            margin: 65px auto;
            padding: 45px;
            background: white;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 5px 20px #00000012;
        }

        h1 {
            margin-bottom: 8px;
        }

        .boton {
            display: inline-block;
            background: #e6a13b;
            color: #172a3c;
            padding: 14px 28px;
            margin-top: 20px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        footer {
            text-align: center;
            padding: 25px;
            color: #667;
        }
    </style>
</head>

<body>

    <header>
        <h1>MY CONSTRUCTION</h1>
        <p>Construimos tus proyectos</p>
    </header>

    <nav>
        <a href="${pageContext.request.contextPath}/">
            Inicio
        </a>
        <a href="${pageContext.request.contextPath}/login.jsp">
            Iniciar sesión
        </a>
    </nav>

    <main>
        <h2>Bienvenido a My Construction</h2>

        <p>
            Somos una empresa dedicada al desarrollo
            de proyectos de construcción, viviendas,
            departamentos, oficinas y remodelaciones.
        </p>

        <p>
            Nuestra plataforma permite centralizar
            la información y mejorar la gestión
            de nuestros clientes.
        </p>

        <a class="boton"
           href="${pageContext.request.contextPath}/login.jsp">
            Acceder al sistema
        </a>
    </main>

    <footer>
        My Construction - Sistema de gestión
    </footer>

</body>
</html>