<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page import="app.model.pckg.Event"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int userId = Integer.parseInt(String.valueOf(session.getAttribute("userId")));
    String motivo = request.getParameter("txtMotivo");
    String descripcion = request.getParameter("txtDescription");
    String especialidad = request.getParameter("tipo");

    DbHelper dbh = new DbHelper();
    ResultSet rs = dbh.getEspaciosDisponibles(especialidad);


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitar cita</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-image: url('img/celeste.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                color: white;
                font-family: 'Arial', sans-serif;
            }

            .navbar {
                background-color: rgba(0, 0, 0, 0.7); /* Barra de navegación oscura */
            }

            .navbar-nav .nav-link {
                font-size: 1.1rem;
                font-weight: bold;
            }

            .navbar-nav .nav-link:hover {
                color: lightblue;
            }
            
            .navbar-nav .nav-link[data-bs-target="#myModal"] {
                color: #ff4d4d !important;
            }

            .navbar-nav .nav-link[data-bs-target="#myModal"]:hover {
                color: darkred !important;
            }

            .hero-section {
                background: rgba(0, 0, 0, 0.6);
                padding: 50px 0; /* Aumenta un poco la altura */
                text-align: center;
            }

            .hero-section h1 {
                font-size: 3.5rem; /* Ajuste tamaño título */
                color: #FFFFFF;
                font-weight: bold;
            }

            .hero-section p {
                font-size: 1.5rem;
                color: #FFFFFF;
            }

            .card {
                background-color: rgba(255, 255, 255, 0.8); /* Fondo más suave */
                border-radius: 15px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* Sombra más suave */
                padding: 25px;
            }

            .form-control {
                background-color: #FFFFFF;
                border-radius: 10px;
                border: 1px solid #28a745; /* Verde médico */
                color: #333;
            }

            .form-label {
                color: #333 !important; /* Texto claro */
            }

            .btn-primary {
                background-color: #28a745; /* Verde hospitalario */
                border-color: #28a745;
                font-weight: bold;
                border-radius: 10px;
            }

            .btn-primary:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }

            .card-body {
                color: #333; /* Color de texto más oscuro */
            }

            .card-title {
                font-size: 1.25rem;
                font-weight: bold;
                color: #007BFF; /* Azul como color médico */
            }

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
        <div class="hero-section">
            <h1>Solicite su cita</h1>
            <p>Complete los datos</p>
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

        <div class="container mt-5 mb-5">
            <div class="d-flex justify-content-center align-items-center">
                <div class="card shadow-lg p-4 rounded" style="max-width: 500px; width: 100%;">
                    <h4 class="text-center text-primary mb-3"><b>Citas diponibles</b></h4>

                    <form action="aceptarCitaLogic.jsp">
                        <h4>Especialidad elegida:<%=especialidad%></h4>
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-ticket-alt"></i> <b>Especialidad</b></label>
                            <select name="espacio" id="espacio" required class="form-select">
                                <%
                                    while (rs.next()) {

                                        ResultSet medico = dbh.getMedic(rs.getInt("doctorId"));

                                        String nombreMedico = "";
                                        while (medico.next()) {
                                            nombreMedico = medico.getString("nombre");
                                        }
                                %>               
                                <option value="<%=rs.getInt("id")%>">
                                    Doctor: <%=nombreMedico%> Fecha|Hora: <%=rs.getString("fecha")%></option>

                                <%}
                                %>
                            </select>
                        </div>
                        <input type="hidden" name="userId" value="<%=userId%>">
                        <input type="hidden" name="motivo" value="<%=motivo%>">
                        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Solicitar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>