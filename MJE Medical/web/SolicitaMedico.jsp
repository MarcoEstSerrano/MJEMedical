<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page import="app.model.pckg.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DbHelper dbh = new DbHelper();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publicar Evento</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-image: url('img/Jaguar.jpg');
                background-size: cover;
                background-position: center;
                color: white;
                font-family: 'Arial', sans-serif;
            }

            .navbar {
                background-color: rgba(0, 0, 0, 0.7);
            }

            .navbar-nav .nav-link {
                font-size: 1.1rem;
                font-weight: bold;
            }

            .navbar-nav .nav-link:hover {
                color: #FFD700; /* Color dorado al pasar el mouse */
            }

            /* Nuevo estilo para el enlace "Cerrar sesión" */
            .navbar-nav .nav-link[data-bs-target="#myModal"] {
                color: red !important;
                font-weight: bold;
            }

            .navbar-nav .nav-link[data-bs-target="#myModal"]:hover {
                color: darkred !important;
            }

            .hero-section {
                background: rgba(0, 0, 0, 0.6);
                padding: 45px 0; /* Reducido */
                text-align: center;
            }

            .hero-section h1 {
                font-size: 3rem; /* Tamaño ajustado */
                color: #FFFFFF; /* Blanco puro */
                font-weight: bold;
            }

            .hero-section p {
                font-size: 1.2rem;
                color: #FFFFFF; /* Blanco puro */
            }

            .card {
                background-color: rgba(0, 0, 0, 0.8);
                border-radius: 15px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.7);
                padding: 20px;
            }

            .form-control {
                background-color: #FFFFFF; /* Fondo blanco */
                border-radius: 10px;
                border: 1px solid #FF6347;
                color: black;
            }

            .form-label {
                color: white !important; /* Blanco puro */
            }

            .btn-primary {
                background-color: #FF6347;
                border-color: #FF6347;
                font-weight: bold;
                border-radius: 10px;
            }

            .btn-primary:hover {
                background-color: #FFD700;
                border-color: #FFD700;
            }
        </style>
    </head>
    <body>
        <div class="hero-section">
            <h1>Publicar paseo</h1>
            <p>Complete los datos</p>
        </div>

        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="Notificaciones.jsp">Notificaciones</a></li>
                    <li class="nav-item"><a class="nav-link active" href="Solicita.jsp">Solicitar cita</a></li>
                    <li class="nav-item"><a class="nav-link" href="error.jsp">Historial de consulta</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#myModal">Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>

        <div class="container mt-5 mb-5">
            <div class="d-flex justify-content-center align-items-center">
                <div class="card shadow-lg p-4 rounded" style="max-width: 500px; width: 100%;">
                    <h4 class="text-center text-primary mb-3"><b>Publicar paseo</b></h4>
                    <form action="CreateEventLogic.jsp">
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-pen"></i> <b>Motivo de su cita</b></label>
                            <input type="text" class="form-control" name="txtName" placeholder="Ingresa el nombre" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-info-circle"></i> <b>Descripción</b></label>
                            <textarea class="form-control" name="txtDescription" rows="4" maxlength="200" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-calendar-alt"></i> <b>Fecha</b></label>
                            <input type="date" class="form-control" name="txtDate" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-map-marker-alt"></i> <b>Ubicación</b></label>
                            <input type="text" class="form-control" name="txtUbication" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-ticket-alt"></i> <b>Entradas</b></label>
                            <input type="number" class="form-control" name="txtTickets" min="1" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Publicar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
