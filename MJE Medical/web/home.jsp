<%@page import="app.model.pckg.Notificacion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page import="app.model.pckg.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Inicio Sesion</title>
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
                font-size: 3rem;
                font-weight: bold;
                color: skyblue;
            }

            .header h3 {
                font-size: 3rem;
                font-weight: bold;
                color: skyblue;
                text-shadow: 2px 2px 4px black;
                border: 2px solid rgba(0, 0, 0, 0.6);
                display: inline-block;
                padding: 10px 20px;
                border-radius: 10px;
                background-color: rgba(0, 0, 0, 0.3);
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

            .btn-primary {
                font-size: 1.2rem;
                font-weight: bold;
                padding: 12px;
                background-color: lightblueblue; /* azul celeste */
                color: white;
                border: none;
                border-radius: 5px;
            }

            .btn-primary:hover {
                background-color: #00b5e2; /* azul celeste más oscuro */
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

            .card {
                height: 100%;
                display: flex;
                flex-direction: column;
            }

            .card-body {
                flex-grow: 1;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
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

            /* Estilo para el offcanvas */
            .offcanvas {
                background-color: rgba(0, 0, 0, 0.85);
                color: white;
                backdrop-filter: blur(8px);
            }

            /* Título del offcanvas */
            .offcanvas-header h5 {
                font-size: 1.8rem;
                font-weight: bold;
                color: skyblue;
                text-shadow: 1px 1px 3px black;
            }

            /* Botón cerrar (la X) */
            .offcanvas-header .btn-close {
                filter: invert(1); /* para que se vea blanca */
            }

            /* Lista de notificaciones */
            .offcanvas-body .list-group-item {
                background-color: rgba(255, 255, 255, 0.1);
                color: white;
                border: none;
                margin-bottom: 10px;
                border-radius: 8px;
                padding: 15px;
                font-size: 1rem;
                box-shadow: 0 2px 6px rgba(0,0,0,0.4);
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            /* Botón "Listo" dentro del offcanvas */
            .offcanvas-body .btn-primary {
                background-color: skyblue;
                border: none;
                color: black;
                font-weight: bold;
                padding: 6px 12px;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .offcanvas-body .btn-primary:hover {
                background-color: #00b5e2;
                color: white;
            }

            .card-img-top {
                height: 200px; /* o cualquier altura que te guste */
                object-fit: cover;
                width: 100%;
            }





        </style>
    </head>
    <body>

        <%
            String email = (String) session.getAttribute("email");
            if (email == null) {
                request.setAttribute("errorMensage", "La sesion esta inactiva, debes iniciar sesion.");
                RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
                rd.forward(request, response);
            }

            int userId = (int) session.getAttribute("userId");
            DbHelper dbh = new DbHelper();
            ResultSet notis = dbh.getNotificaciones(userId, "usuario");
        %>

        <!-- Encabezado -->
        <div class="header">
            <h3>MJE Medical</h3>
            <p>Su salud en nuestras manos</p>
        </div>

        <!-- Barra de navegación -->
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

        <!-- Modal para confirmar cierre de sesión -->
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

        <!-- Contenedor de eventos -->
        <div class="container mt-5">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 justify-content-center">

                <div class="col mb-4">
                    <div class="card">
                        <img src="img/notificaciones.jpg" class="card-img-top" />
                        <div class="card-body">
                            <h5 class="card-title">Notificaciones</h5>
                            <p class="card-text">Descripcion: Mantente al día</p>
                            <div class="mt-auto">
                                <a href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" class="btn btn-primary w-100"><b>Seleccionar</b></a>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="col mb-4">
                    <div class="card">
                        <img src="img/solic.jpeg" class="card-img-top" />
                        <div class="card-body">
                            <h5 class="card-title">Solicitar cita</h5>
                            <p class="card-text">Descripcion: Agrega, modifica o cancela tus citas.</p>
                            <div class="mt-auto">
                                <a href="Solicita.jsp" class="btn btn-primary w-100"><b>Seleccionar</b></a>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="col mb-4">
                    <div class="card">
                        <img src="img/historial.jpg" class="card-img-top" />
                        <div class="card-body">
                            <h5 class="card-title">Historial de consulta</h5>
                            <p class="card-text">Descripcion: Revisa tus citas anteriores</p>
                            <div class="mt-auto">
                                <a href="HistorialConsulta.jsp?userId=<%=userId%>" class="btn btn-primary w-100"><b>Seleccionar</b></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
                <h5 id="offcanvasRightLabel">Notificaciones</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="list-group">

                    <%
                        if (notis.next()) {
                            while (notis.next()) {%>        
                    <li class="list-group-item"><%=notis.getString("fecha")%> | <%=notis.getString("titulo")%>-<%=notis.getString("descripcion")%>
                        <a href="quitarNotificacion.jsp?id=<%=notis.getString("id")%>" class="btn btn-primary w-10"><b>Listo</b></a>
                    </li>
                    <%
                        }
                    } else {
                    %>  
                    <h3>Sin notificaciones</h3>
                    <% }%>     
                </ul>
            </div>
        </div>

    </body>
</html>
