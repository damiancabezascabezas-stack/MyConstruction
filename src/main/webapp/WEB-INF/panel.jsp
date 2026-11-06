<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel - My Construction</title>
    <style>
        body {
            margin: 0;
            background: #f4f6f8;
            font-family: Arial, sans-serif;
        }

        header {
            background: #20364c;
            color: white;
            padding: 25px;
            text-align: center;
        }

        main {
            max-width: 850px;
            margin: 50px auto;
            padding: 35px;
            background: white;
            border-radius: 10px;
        }

        button {
            padding: 12px 20px;
            background: #e6a13b;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <header>
        <h1>MY CONSTRUCTION</h1>
        <p>Panel de administración</p>
    </header>

    <main>
        <h2>Bienvenido al sistema</h2>

        <p>
            Has iniciado sesión correctamente.
        </p>

        <p>
            Desde este panel podrás gestionar
            los clientes y proyectos de construcción.
        </p>

        <form action="${pageContext.request.contextPath}/logout"
              method="post">
            <button type="submit">
                Cerrar sesión
            </button>
        </form>
    </main>

</body>
</html>