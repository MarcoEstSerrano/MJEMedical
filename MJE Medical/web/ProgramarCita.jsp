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
                color: #FFD700; /* Color dorado al pasar el mouse */
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
            <h1>Programar cita</h1>
            <p>Complete los datos</p>
        </div>

        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="homeMedic.jsp">Home</a></li> 
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
                    <h2 class="text-center text-primary mb-3"><b>formulario de cita</b></h2>
                    <h4 class="text-center text-primary mb-3"></h4>
                    <form action="ProCitaLogic.jsp">
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-pen"></i> <b>Fecha</b></label>
                            <input type="datetime-local" class="form-control" name="txtFecha" placeholder="Ingresa la fecha de la cita" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-ticket-alt"></i> <b>Especialidad</b></label>
                            <select name="txtEspecialidad" id="txtEspecialidad" required class="form-select">
                                <option value="Medicina General">Medicina General</option>
                                <option value="Cardiología">Cardiología</option>
                                <option value="Dermatología">Dermatología</option>
                                <option value="Gastroenterología">Gastroenterología</option>>
                                <option value="Ginecología">Ginecología</option>
                                <option value="Medicina Interna">Medicina Interna</option>
                                <option value="Nutriología">Nutriología</option>
                                <option value="Oftalmología">Oftalmología</option>
                                <option value="Ortopedia">Ortopedia</option>
                                <option value="Pediatría">Pediatría</option>
                                <option value="Psiquiatría">Psiquiatría</option>
                            </select>

                        </div>
                        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Programar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
