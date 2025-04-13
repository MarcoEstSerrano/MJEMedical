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
            /* Establecer la imagen de fondo */
            body {
                background-image: url('img/celeste.png'); /* Cambia la ruta si es necesario */
                background-size: cover;
                background-position: center;
                color: white;
                font-family: 'Arial', sans-serif;
                margin-top: 0; /* Eliminar margen superior del body */
                padding-top: 0; /* Eliminar padding superior */
            }

            /* Encabezado */
            .header {
                background-color: rgba(0, 0, 0, 0.5); /* Fondo negro transparente */
                padding: 36px 0; /* Aumentar padding si es necesario */
                text-align: center;
                position: relative;
                top: 0;
                width: 100%;
                margin: 0;
            }



            .header h3 {
                font-size: 3rem; /* Aumentar el tamaño de la fuente del título */
                font-weight: bold;
                color: skyblue;
            }

            .header p {
                font-size: 2rem; /* Aumentar el tamaño de la fuente del subtítulo */
                font-weight: 300;
            }

            /* Estilos del Navbar */
            .navbar {
                background-color: rgba(0, 0, 0, 0.7);
            }

            .navbar-nav .nav-link {
                font-size: 1.1rem;
                font-weight: bold;
            }

            .navbar-nav .nav-link:hover {
                color: skyblue; /* Color dorado al pasar el mouse */
            }

            /* Nuevo estilo para el enlace "Cerrar sesión" */
            .navbar-nav .nav-link[data-bs-target="#myModal"] {
                color: red !important;
                font-weight: bold;
            }

            .navbar-nav .nav-link[data-bs-target="#myModal"]:hover {
                color: darkred !important;
            }

            /* Estilos de los botones personalizados */
            .btn-custom {
                font-weight: bold;
                font-size: 1.2rem;
                padding: 15px;
                background-color: #007bff;
                color: skyblue;
                border-radius: 5px;
                text-transform: uppercase;
            }

            .btn-custom:hover {
                background-color: #0056b3;
                transition: background-color 0.3s ease;
            }

            /* Diseño de las tarjetas */
            .card {
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s ease;
                margin-bottom: 30px;
            }

            .card:hover {
                transform: translateY(-10px);
            }

            .card-body {
                background-color: rgba(0, 0, 0, 0.7);
                padding: 20px;
                color: white !important; /* Hace que todo el texto dentro de la tarjeta sea blanco */
            }

            .card-title {
                font-size: 1.5rem;
                font-weight: bold;
                color: white !important; /* Título en blanco */
            }

            .card-text {
                font-size: 1.1rem;
                font-weight: 300;
                color: white !important; /* Descripción en blanco */
            }

            .btn-primary {
                font-size: 1.2rem;
                font-weight: bold;
                padding: 12px;
                background-color: #28a745;
                border: none;
            }

            .btn-primary:hover {
                background-color: #218838;
                transition: background-color 0.3s ease;
            }

            /* Mejorar la visibilidad del modal */
            .modal-header {
                background-color: #dc3545;
                color: white;
            }

            .modal-body {
                color: black;
                font-weight: bold;
            }

            .modal-footer .btn-danger {
                background-color: #dc3545;
                color: white;
            }

            .modal-footer .btn-danger:hover {
                background-color: #c82333;
            }

            .modal-content {
                border-radius: 10px;
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
        <% }else{
            ResultSet cita = dbh.getCita(citaId);
            int userId = 0;
            while(cita.next()){
                userId = cita.getInt("userId");
            }
            
            ResultSet usuario = dbh.getUser(userId);
        %>


        <div class="header">
            <h3>MJE Medical</h3>
            <p>Su salud en nuestras manos</p>
        </div>


        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link " href="home.jsp">Home</a>
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
