
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            int reservId = Integer.parseInt(request.getParameter("reservId"));
            int eventId = Integer.parseInt(request.getParameter("eventId"));

            DbHelper dbh = new DbHelper();

            ResultSet rs = dbh.getReservFullInfo(reservId);
            int newTickets = 0;
            while (rs.next()) {
                newTickets = rs.getInt("e_tickets") + rs.getInt("r_tickets");
            }

            if (dbh.cancelarReserva(reservId) && dbh.actualizarTickets(eventId, newTickets)) {
        %>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4">
                <div class="card-body">
                    <h4 class="card-title text-success"><i class="fas fa-check-circle"></i> ¡Reserva cancelada!</h4>
                    <p class="card-text">Tu reserva se ha cancelado con éxito.</p>
                    <a href="MisReservas.jsp" class="btn btn-success w-100"><i class="fas fa-thumbs-up"></i>Aceptar</a>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4">
                <div class="card-body">
                    <h4 class="card-title text-danger"><i class="fas fa-exclamation-circle"></i> ¡Error!</h4>
                    <p class="card-text">Ocurrió un error al cancelar la reserva. Inténtalo de nuevo...</p>
                    <a href="MisReservas.jsp" class="btn btn-danger w-100"><i class="fas fa-times"></i>Intentar de nuevo</a>
                </div>
            </div>
        </div>
        <%
            }
        %>

    </body>
</html>
