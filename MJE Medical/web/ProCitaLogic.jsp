<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="app.model.pckg.Notificacion"%>
<%@page import="app.dataBase.pckg.DbHelper"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Programar cita</title>
        <style>
            body {
                background-image: url('img/celeste.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                font-family: 'Segoe UI', 'Arial', sans-serif;
                margin: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
            }

            .card {
                max-width: 500px;
                width: 100%;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
                background: #ffffff;
                transition: all 0.3s ease-in-out;
                margin: 1rem;
            }

            .card-body {
                padding: 2rem;
                text-align: center;
            }

            .card-title i {
                font-size: 2.5rem;
                margin-bottom: 0.5rem;
                display: block;
            }

            .card-title.text-success {
                color: black;
            }

            .card-title.text-danger {
                color: blue;
            }

            .card-text {
                font-size: 1.1rem;
                color: #444;
                margin-bottom: 1.5rem;
            }

            .btn {
                border-radius: 12px;
                font-size: 1rem;
                padding: 0.75rem;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
                color: white;
                text-decoration: none;
            }

            .btn-success {
                background-color: blue;
                border: none;
            }

            .btn-success:hover {
                background-color: lightblue;
            }

            .btn-danger {
                background-color: #dc3545;
                border: none;
            }

            .btn-danger:hover {
                background-color: #c82333;
            }
        </style>


    </head>
    <body>
        <%
            int medicId = Integer.parseInt(String.valueOf(session.getAttribute("medicId")));
            String email = (String) session.getAttribute("email");
            if (email == null) {
                request.setAttribute("errorMensage", "La sesión está inactiva, debes iniciar sesión.");
                RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
                rd.forward(request, response);
            }

            String fecha = request.getParameter("txtFecha");
            String especialidad = request.getParameter("txtEspecialidad");
            DbHelper db = new DbHelper();

            int espacioId = db.programarcita(medicId, fecha, especialidad, 0);

            if (espacioId > 0) {

                LocalDateTime fechaHoraActual = LocalDateTime.now();
                DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
                String fechaHoraFormateada = fechaHoraActual.format(formato);

                Notificacion notimedic = new Notificacion(medicId, medicId, "create", "cita", fechaHoraFormateada, 1, espacioId);

                db.saveNotification(notimedic);

        %>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4">
                <div class="card-body">
                    <h4 class="card-title text-success"><i class="fas fa-check-circle"></i> ¡Realizado!</h4>
                    <p class="card-text">Cita programada con exito.</p>
                    <a href="homeMedic.jsp" class="btn btn-success w-100"><i class="fas fa-thumbs-up"></i>Aceptar</a>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4">
                <div class="card-body">
                    <h4 class="card-title text-danger"><i class="fas fa-exclamation-circle"></i> ¡Error!</h4>
                    <p class="card-text">Ocurrió un error al programar la cita. Inténtalo de nuevo...</p>
                    <a href="homeMedic.jsp" class="btn btn-danger w-100"><i class="fas fa-times"></i>Intentar de nuevo</a>
                </div>
            </div>
        </div>
        <%
            }
        %>

    </body>
</html>
