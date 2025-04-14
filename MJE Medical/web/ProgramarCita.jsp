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
                font-family: 'Segoe UI', 'Arial', sans-serif;
            }

            .navbar {
                background-color: rgba(0, 0, 0, 0.7);
                box-shadow: 0 2px 10px rgba(0,0,0,0.5);
            }

            .navbar-nav .nav-link {
                font-size: 1.1rem;
                font-weight: bold;
                transition: color 0.3s ease;
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
                padding: 65px 0;
                text-align: center;
                border-bottom: 2px solid rgba(255,255,255,0.1);
            }

            .hero-section h1 {
                font-size: 2.8rem;
                font-weight: bold;
                color: #ffffff;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            }

            .hero-section p {
                font-size: 1.2rem;
                color: #f0f0f0;
                margin-bottom: 0;
            }

            .card {
                background-color: rgba(255, 255, 255, 0.9);
                border-radius: 20px;
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
                padding: 30px;
                backdrop-filter: blur(5px);
            }

            .form-control,
            .form-select {
                background-color: #f9f9f9;
                border-radius: 10px;
                border: 1px solid #28a745;
                color: #333;
                font-size: 1rem;
            }

            .form-control:focus,
            .form-select:focus {
                box-shadow: 0 0 0 0.2rem rgba(0, 181, 226, 0.25);
                border-color: #00b5e2;
            }

            .form-label {
                color: #333;
                font-weight: bold;
                margin-bottom: 6px;
            }

            .btn-primary {
                font-size: 1.2rem;
                font-weight: bold;
                padding: 10px;
                background-color: #00b5e2;
                color: white;
                border: none;
                border-radius: 8px;
                transition: background-color 0.3s ease;
            }

            .btn-primary:hover {
                background-color: #009fc2;
            }

            .modal-header {
                background-color: #dc3545;
                color: white;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }

            .modal-body {
                color: #333;
                font-weight: 500;
            }

            .modal-footer .btn-danger {
                background-color: #dc3545;
                color: white;
                border-radius: 6px;
            }

            .modal-footer .btn-danger:hover {
                background-color: #c82333;
            }

            .modal-content {
                border-radius: 12px;
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
