
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial citas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-image: url('img/celeste.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                font-family: 'Arial', sans-serif;
                color: #fff;
            }

            .navbar {
                background-color: rgba(0, 0, 0, 0.7);
            }

            .navbar-nav .nav-link {
                font-weight: bold;
            }

            .navbar-nav .nav-link:hover {
                color: skyblue;
            }
            
            .navbar-nav .nav-link[data-bs-target="#myModal"] {
                color: #ff4d4d !important;
            }

            .navbar-nav .nav-link[data-bs-target="#myModal"]:hover {
                color: darkred !important;
            }

            .hero-section {
                background-color: rgba(0, 0, 0, 0.5);
                text-align: center;
                padding: 60px 20px;
                margin-bottom: -2px;
                border-bottom: 2px solid skyblue;
            }

            .hero-section h2 {
                font-size: 2.8rem;
                color: #00d4ff;
                font-weight: bold;
                margin-bottom: 15px;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            }

            .hero-section p {
                font-size: 1.2rem;
                color: #f0f0f0;
                margin-bottom: 0;
            }

            .card-cita {
                background-color: rgba(255, 255, 255, 0.9);
                color: #333;
                border-radius: 15px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
                transition: transform 0.3s ease;
            }

            .card-cita:hover {
                transform: translateY(-5px);
            }

            .modal-header {
                background-color: #dc3545;
                color: white;
            }

            .modal-footer .btn-danger {
                background-color: #dc3545;
            }

            .modal-footer .btn-danger:hover {
                background-color: #c82333;
            }

            h2 {
                color: #fff;
                text-align: center;
                margin-bottom: 30px;
            }

            .mensaje-vacio {
                text-align: center;
                padding: 50px 20px;
                color: #ffffff;
                background-color: rgba(0, 0, 0, 0.5);
                border-radius: 15px;
                margin-top: 40px;
                font-size: 1.5rem;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <%
            int userId = Integer.parseInt(request.getParameter("userId"));

            DbHelper dbh = new DbHelper();
            ResultSet rs = dbh.getCitas(userId);

        %>
        <div class="hero-section">
            <h2>Historial de citas</h2>
            <p>Revisa tus citas pasadas con los detalles correspondientes</p>
        </div>

        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="myModal" data-bs-toggle="modal" data-bs-target="#myModal">Cerrar sesión</a></li>
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

        <div class="container mt-3">

            <ul class="list-group">
                <%                    String nombreDoctor = "";
                    if (rs.next()) {
                        while (rs.next()) {
                            ResultSet medico = dbh.getMedic(rs.getInt("doctorid"));
                            while (medico.next()) {
                                nombreDoctor = medico.getString("nombre");
                            }

                %>

                <li class="list-group-item ">
                    <b>Especialidad:</b> <%=rs.getString("especialidad")%>  |  
                    <b>Doctor:</b> <%=nombreDoctor%>  |  
                    <b>Fecha:</b><%=rs.getString("fechaHora")%>  |  
                    <b>Motivo:</b> <%=rs.getString("motivo")%></li>
                    <%
                        }
                    } else {
                    %>
                <div class="mensaje-vacio">
                    <i class="fas fa-calendar-times fa-2x mb-3"></i><br>
                    No tiene citas registradas
                </div>
                <% }%>
            </ul>
        </div>
    </body>
</html>
