
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error - Mensaje</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" defer></script>
    </head>
    <body>
        <div class="container mt-5 d-flex justify-content-center">
            <div class="card shadow-sm p-3" style="max-width: 400px; width: 100%;">
                <div class="card-body">
                    <h4 class="card-title text-danger"><i class="fas fa-exclamation-circle"></i> ¡Error!</h4>

                    <p class="card-text">
                        <%
                            String mensage = String.valueOf(request.getAttribute("errorMensage"));
                        %>
                        <%= mensage%>
                    </p>
                    <a href="Login.html" class="btn btn-primary w-100"><i class="fas fa-check"></i> Aceptar</a>
                </div>
            </div>
        </div>
    </body>
</html>
