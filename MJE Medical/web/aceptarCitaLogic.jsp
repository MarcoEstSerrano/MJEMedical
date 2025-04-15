
<%@page import="java.time.LocalDate"%>
<%@page import="app.model.pckg.Notificacion"%>
<%@page import="app.model.pckg.Event"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publish event</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" defer></script>

        <style>
            
            body {
                background-image: url('img/historial.jpg');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #d6f1ff; /* Celeste claro */
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .container {
                max-width: 600px;
                width: 100%;
                margin: auto;
                padding: 20px;
            }

            .card {
                background: rgba(0, 0, 0, 0.65);
                border: 1px solid rgba(255, 255, 255, 0.1);
                border-radius: 18px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.6);
                color: #d6f1ff;
                overflow: hidden;
                transition: transform 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
            }

            .card-body {
                padding: 30px;
                text-align: center;
            }

            .card-title {
                font-size: 2rem;
                font-weight: 700;
                margin-bottom: 15px;
                color: #99eaff;
                text-shadow: 1px 1px 2px #000;
            }

            .card-text {
                font-size: 1.1rem;
                margin-bottom: 25px;
                color: #cdefff;
            }

            .btn {
                border-radius: 50px;
                padding: 15px 35px;
                font-size: 1.1rem;
                font-weight: bold;
                width: 100%;
                transition: all 0.3s ease-in-out;
            }

            .btn-success {
                background-color: #007bff;
                border: none;
                color: white;
            }

            .btn-success:hover {
                background-color: #0056b3;
                transform: scale(1.05);
            }

            .btn-danger {
                background-color: #dc3545;
                border: none;
                color: white;
            }

            .btn-danger:hover {
                background-color: #b02a37;
                transform: scale(1.05);
            }

            .fas {
                margin-right: 10px;
            }

            /* Colores de íconos */
            .text-success {
                color: #66ffcc !important;
            }

            .text-danger {
                color: #ff9999 !important;
            }
        </style>

    </head>

    <body>
        <%
            int espacioId = Integer.parseInt(request.getParameter("espacio"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            String motivo = request.getParameter("motivo");

            DbHelper dbh = new DbHelper();
            ResultSet rs = dbh.getEspacio(espacioId);

            if (dbh.aceptarCita(userId, rs, motivo)) {
                ResultSet rsActualizado = dbh.getEspacio(espacioId);
                while (rsActualizado.next()) {

                    String titulo = "Cita Aceptada";
                    String descripcion = rsActualizado.getString("especialidad") + ": " + rsActualizado.getString("fecha");
                    LocalDate fechaActual = LocalDate.now();
                    String fechaGenerada = String.valueOf(fechaActual);

                    //---Noti user-----------------------------------------------------------
                    Notificacion notiUser = new Notificacion(userId, userId, titulo, descripcion,
                            fechaGenerada, 1, espacioId, "usuario");
                    dbh.saveNotification(notiUser);
                    //---Noti medic----------------------------------------------------------
                    ResultSet rsCita = dbh.getCita(rsActualizado.getInt("citaId"));
                    while (rsCita.next()) {
                        Notificacion notiMedic = new Notificacion(userId, rsCita.getInt("doctorid"), titulo, descripcion,
                                fechaGenerada, 1, espacioId, "medico");
                        dbh.saveNotification(notiMedic);
                    }
                }

        %>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4">
                <div class="card-body">
                    <h4 class="card-title text-success"><i class="fas fa-check-circle"></i> ¡Cita aceptada!</h4>
                    <p class="card-text">Cita asignada con éxito.</p>
                    <a href="home.jsp" class="btn btn-success w-100"><i class="fas fa-thumbs-up"></i> Aceptar</a>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4">
                <div class="card-body">
                    <h4 class="card-title text-danger"><i class="fas fa-exclamation-circle"></i> ¡Error!</h4>
                    <p class="card-text">Ocurrió un error al aceptar la cita. Inténtalo de nuevo...</p>
                    <a href="home.jsp" class="btn btn-danger w-100"><i class="fas fa-times"></i> Intentar de nuevo</a>
                </div>
            </div>
        </div>
        <%}%>
    </body>
</html>



