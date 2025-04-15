
<%@page import="app.model.pckg.Notificacion"%>
<%@page import="java.time.LocalDate"%>
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
                background-image: url('img/celeste.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 600px;
                margin-top: 60px;
            }

            .card {
                background-color: #ffffff; /* blanco sólido */
                border-radius: 20px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
                padding: 30px;
                text-align: center;
                color: #01579b; /* azul oscuro hospitalario */
            }

            .card-title {
                font-size: 1.8rem;
                font-weight: bold;
                margin-bottom: 15px;
                color: #0288d1; /* azul celeste */
            }

            .card-text {
                font-size: 1.1rem;
                margin-bottom: 25px;
                color: #004d40;
            }

            .btn {
                border-radius: 30px;
                padding: 12px 25px;
                font-size: 1.1rem;
                font-weight: bold;
                transition: background-color 0.3s ease;
                width: 100%;
                margin-top: 10px;
            }

            .btn-success {
                background-color: #03A9F4; /* celeste */
                color: #fff;
                border: none;
            }

            .btn-success:hover {
                background-color: #0288d1; /* azul más fuerte al pasar mouse */
            }

            .btn-danger {
                background-color: #f44336;
                color: #fff;
                border: none;
            }

            .btn-danger:hover {
                background-color: #d32f2f;
            }

            .fas {
                margin-right: 10px;
            }

            .text-success {
                color: #388e3c !important;
            }

            .text-danger {
                color: #c62828 !important;
            }

        </style>
    </head>
    <body>
        <%
            int espacioId = Integer.parseInt(request.getParameter("espacioId"));

            DbHelper dbh = new DbHelper();

            if (dbh.cancelarCita(espacioId)) {

                ResultSet rs = dbh.getEspacio(espacioId);
                while (rs.next()) {
                    String titulo = "Espacio eliminado";
                    String descripcion = rs.getString("especialidad") + ": " + rs.getString("fecha");
                    LocalDate fechaActual = LocalDate.now();
                    String fechaGenerada = String.valueOf(fechaActual);

                    Notificacion notiMedic = new Notificacion(rs.getInt("doctorId"), rs.getInt("doctorId"), titulo, descripcion,
                            fechaGenerada, 1, 0, "medico");
                    dbh.saveNotification(notiMedic);
                }
        %>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4">
                <div class="card-body">
                    <h4 class="card-title text-success"><i class="fas fa-check-circle"></i> ¡Cita cancelada!</h4>
                    <p class="card-text">Tu cita se ha cancelado con éxito.</p>
                    <a href="homeMedic.jsp" class="btn btn-success w-100"><i class="fas fa-thumbs-up"></i>Aceptar</a>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4">
                <div class="card-body">
                    <h4 class="card-title text-danger"><i class="fas fa-exclamation-circle"></i> ¡Error!</h4>
                    <p class="card-text">Ocurrió un error al cancelar la cita. Inténtalo de nuevo...</p>
                    <a href="homeMedic.jsp" class="btn btn-danger w-100"><i class="fas fa-times"></i>Intentar de nuevo</a>
                </div>
            </div>
        </div>
        <%
            }
        %>

    </body>
</html>
