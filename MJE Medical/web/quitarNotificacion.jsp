<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notificaciones</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" defer></script>

        <style>
            body {
                background-image: url('img/jaguarcito.webp');
                background-size: cover;
                background-position: center;
                background-attachment: fixed; /* Mantener la imagen fija al hacer scroll */
                color: white;
                font-family: 'Arial', sans-serif;
            }

            .card {
                background: rgba(0, 0, 0, 0.7);
                color: white;
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            }

            .card-header {
                background: rgba(0, 128, 0, 0.8);
                color: white;
                text-align: center;
                padding: 20px;
            }

            .card-body {
                background: rgba(0, 0, 0, 0.6);
                padding: 20px;
                text-align: center;
            }

            .card-footer {
                background: rgba(255, 255, 255, 0.2);
                border-top: 1px solid rgba(255, 255, 255, 0.3);
                padding: 10px 0;
                text-align: center;
            }

            .btn {
                border-radius: 25px;
                padding: 15px 30px;
                font-size: 1.1rem;
                font-weight: bold;
                transition: background-color 0.3s ease;
            }

            .btn-primary {
                background: rgba(0, 123, 255, 0.8);
                border: none;
            }

            .btn-success {
                background: rgba(40, 167, 69, 0.8);
                border: none;
            }

            .btn-danger {
                background: rgba(220, 53, 69, 0.8);
                border: none;
            }

            .btn-primary:hover {
                background-color: #218838;
            }

            .card-title {
                font-size: 1.5rem;
                font-weight: bold;
            }

            .card-text {
                font-size: 1.1rem;
                margin-bottom: 20px;
            }

            .container {
                max-width: 600px;
                margin-top: 50px;
            }

            .fas {
                margin-right: 10px;
            }

            /* Estilo para que el mensaje y botones se vean bien con la imagen de fondo */
            .text-success {
                color: #28a745 !important;
            }

            .text-danger {
                color: #dc3545 !important;
            }
        </style>
    </head>
    <body>



        <%
            String email = (String) session.getAttribute("email");
            if (email == null) {
                request.setAttribute("errorMensage", "La sesión está inactiva, debes iniciar sesión.");
                RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
                rd.forward(request, response);
            }

            int notiId = Integer.parseInt(request.getParameter("id"));
            DbHelper dbh = new DbHelper();

            if (dbh.actualizarEstadoNotificacion(notiId)) {

                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);
            }

        %>    
    </body>
</html>
