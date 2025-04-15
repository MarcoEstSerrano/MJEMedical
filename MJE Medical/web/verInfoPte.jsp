<%@page import="app.model.pckg.Notificacion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page import="app.model.pckg.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Info paciente</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="WEB-INF/css.css" rel="stylesheet" type="text/css"/>
        <link href="styles.css" rel="stylesheet" type="text/css"/>

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

            .header {
                background-color: rgba(0, 91, 150, 0.85);
                padding: 30px 0;
                text-align: center;
                color: #e3f2fd;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            }

            .header h3 {
                font-size: 2.5rem;
                font-weight: bold;
                margin: 0;
                color: #b3e5fc;
            }

            .header p {
                font-size: 1.2rem;
                margin: 0;
                color: #e0f7fa;
            }

            .navbar {
                background-color: rgba(0, 0, 0, 0.6);
                padding: 10px 20px;
            }

            .navbar-nav .nav-link {
                color: white;
                font-weight: bold;
                transition: color 0.3s ease;
            }

            .navbar-nav .nav-link:hover {
                color: #81d4fa;
            }

            .navbar-nav .nav-link[data-bs-target="#myModal"] {
                color: #ff5252 !important;
            }

            .navbar-nav .nav-link[data-bs-target="#myModal"]:hover {
                color: #e53935 !important;
            }

            .container, .card-body {
                margin-top: 30px;
                color: #01579b;
            }

            .card {
                background-color: #ffffff; /* fondo blanco sólido */
                border-radius: 20px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
                color: #01579b;
                padding: 30px;
                text-align: center;
                width: 100%;
                max-width: 600px;
                margin: auto;
            }

            .card-title {
                color: #0288d1;
                font-weight: bold;
                font-size: 1.5rem;
            }

            .card-text {
                color: #004d40;
                font-size: 1.1rem;
                margin-bottom: 12px;
                text-align: left;
            }

            .btn {
                border-radius: 30px;
                padding: 12px 20px;
                font-size: 1rem;
                font-weight: bold;
                width: 100%;
            }

            .btn-success {
                background-color: #03A9F4;
                color: white;
                border: none;
            }

            .btn-success:hover {
                background-color: #0288d1;
            }

            .btn-danger {
                background-color: #ef5350;
                border: none;
                width: auto;
                display: inline-block;
                padding: 10px 20px;
                color: white;
            }

            .btn-danger:hover {
                background-color: #d32f2f;
            }

            .modal-header {
                background-color: #0288d1;
                color: white;
                border-bottom: none;
            }

            .modal-body {
                color: #333;
                font-weight: 500;
            }

            .modal-footer .btn-danger {
                background-color: #ef5350;
                border: none;
            }

            .modal-footer .btn-danger:hover {
                background-color: #d32f2f;
            }

            .modal-footer .btn-primary {
                background-color: #90caf9;
                border: none;
                color: black;
            }

            .modal-footer .btn-primary:hover {
                background-color: #64b5f6;
            }


        </style>

    </head>
    <body>

        <%
            int espacioId = Integer.parseInt(request.getParameter("espacioId"));

            DbHelper dbh = new DbHelper();
            ResultSet rs = dbh.getespacio(espacioId);

            int ocupado = 1;
            int citaId = 0;
            while (rs.next()) {
                ocupado = rs.getInt("estado");
                citaId = rs.getInt("citaId");
            }

            if (ocupado == 1) { //Es que esta sin ocupar
        %>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4">
                <div class="card-body">
                    <h4 class="card-title text-success"><i class="fas fa-check-circle"></i> ¡Espacio libre!</h4>
                    <p class="card-text">El espacio aun no ha sido ocupado por un paciente. Intenta mas tarde.</p>
                    <a href="homeMedic.jsp" class="btn btn-success w-100"><i class="fas fa-thumbs-up"></i>Aceptar</a>
                </div>
            </div>
        </div>
        <% } else {
            ResultSet cita = dbh.getCita(citaId);
            int userId = 0;
            while (cita.next()) {
                userId = cita.getInt("userId");
            }

            ResultSet usuario = dbh.getUser(userId);
        %>


        <div class="header">
            <h3>MJE Medical</h3>
            <p>Sistema medico</p>
        </div>


        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link " href="homeMedic.jsp">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="" data-bs-toggle="modal" data-bs-target="#myModal">Cerrar sesion</a>
                    </li>
                </ul>
            </div>
        </nav>


        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cerrar sesion</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">
                        ¿Estás seguro de que deseas cerrar sesión?
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cancelar</button>
                        <a href="Home.html" class="btn btn-danger">Aceptar</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-body p-4">

            <%while (usuario.next()) {
            %>

            <p class="card-text"><i  style="color: #5c6bc0;"></i> <b>Usuario: <%=usuario.getString("user_name")%></b></p>
            <p class="card-text"><i  style="color: #ff7043;"></i> <b>Email: <%=usuario.getString("email")%></b></p>
            <a href="HistorialConsultaMedic.jsp?userId=<%=usuario.getInt("id")%>" class="btn btn-danger">Info paciente</a>
            <%
                }
            %>


        </div>
        <%}%>
    </body>
</html>
