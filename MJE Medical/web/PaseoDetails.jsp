
<%@page import="app.model.pckg.Event"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {
                background: url('img/rioceleste.jpg') no-repeat center center fixed;
                background-size: cover;
                color: white;
            }

            /* Ajustar fondo de la cabecera */
            .p-5.bg-primary {
                background: rgba(0, 123, 255, 0.7) !important; /* Azul semi-transparente */
            }

            /* Estilizar las tarjetas para que combinen con el fondo */
            .card {
                background: rgba(0, 0, 0, 0.7); /* Fondo oscuro semi-transparente */
                color: white; /* Texto blanco para contraste */
                border-radius: 10px;
                overflow: hidden;
            }

            .card-header {
                background: rgba(0, 128, 0, 0.8) !important; /* Verde oscuro semi-transparente */
                color: white;
            }

            .card-body {
                background: rgba(0, 0, 0, 0.6);
                color: white;
            }

            .card-footer {
                background: rgba(255, 255, 255, 0.2);
                border-top: 1px solid rgba(255, 255, 255, 0.3);
            }

            /* Botones estilizados para combinar con el diseño */
            .btn {
                border-radius: 20px;
                padding: 12px 20px;
                font-size: 1rem;
            }

            .btn-primary {
                background: rgba(0, 123, 255, 0.8);
                border: none;
            }

            .btn-success {
                background: rgba(40, 167, 69, 0.8);
                border: none;
            }

            .btn-danger {
                background: rgba(220, 53, 69, 0.8);
                border: none;
            }

            .btn-warning {
                background: rgba(255, 193, 7, 0.8);
                border: none;
            }

            .hero-section {
                background: rgba(0, 0, 0, 0.6); /* Fondo oscuro semi-transparente */
                padding: 38px;
                text-align: center;
            }

            .hero-section h1 {
                font-size: 3.5rem;
                color: #FF6347;
            }

            .hero-section p {
                font-size: 1.2rem;
                color: #FFD700;
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
            String email = (String) session.getAttribute("email");

            if (email == null) {
                request.setAttribute("errorMensage", "La sesion esta inactiva, debes iniciar sesion.");
                RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
                rd.forward(request, response);
            }

            int userId = (int) session.getAttribute("userId");
            String idString = request.getParameter("id");
            idString = idString.trim();
            int eventId = Integer.parseInt(idString);

            DbHelper dbh = new DbHelper();
            ResultSet rs = dbh.getEvent(eventId);

            if (!(rs.next())) {
                request.setAttribute("errorMensage", "El rs esta vacio.");
                RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
                rd.forward(request, response);
            }
        %>


        <div class="hero-section">
            <h1>Detalles</h1>
            <p>de Paseo</p> 
        </div>

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">

                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="Notificaciones.jsp">Notificiones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Solicita.jsp">Solicitar cita</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Historial.jsp">Historial de consulta</a>
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
                        Estas seguro de que deseas cerrar sesion?
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cancelar</button>
                        <a href="Logout.jspl" class="btn btn-danger">Aceptar</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="eliminarPaseo">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Eliminar Paseo<i class="fas fa-trash-alt" style="color: red;
                                                                 margin-left: 8px;"></i></h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">
                        <i class="fas fa-exclamation-triangle" style="color: red;">

                        </i>
                        Estas seguro de que deseas eliminar este paseo? Si lo haces no hay vuelta atras...
                        <i class="fas fa-exclamation-triangle" style="color: red;"></i>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-bs-dismiss="modal">Cancelar</button>
                        <a href="Eliminar.jsp?id=<%=eventId%>" class="btn btn-danger">Eliminar</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="editarPaseo">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="card-title text-center" style="font-size: 2rem;
                            font-weight: bold;
                            letter-spacing: 1px;">Editar Paseo</h1>
                    </div>

                    <div class="modal-body">
                        <form action="Editar.jsp">
                            <div class="card mb-5 shadow-lg mx-auto mt-5" style="max-width: 500px;
                                 border-radius: 10px;
                                 overflow: hidden;">
                                <div class="card-header bg-success text-white">
                                    <img src="<%=rs.getString("e_photo")%>" class="card-img-top" alt="Evento Imagen" style="max-height: 250px;
                                         object-fit:                                              cover;
                                         border-radius: 10px 10px 0 0;" />
                                </div>

                                <div class="card-body p-4">

                                    <h1 class="card-title text-center" style="font-size: 1.5rem;
                                        font-weight: bold;
                                        letter-spacing: 1px;">
                                        <label for="e_name" class="form-label">Nombre del Evento:</label>
                                        <input type="text" id="e_name" name="e_name" class="form-control" value="<%=rs.getString("e_name")%>" required />
                                    </h1>

                                    <div class="mb-3">
                                        <label for="e_description" class="form-label"><i class="fas fa-info-circle" style="color: #5c6bc0;"></i> Descripción:                                               </label>
                                        <textarea id="e_description" name="e_description" class="form-control" rows="4" required><%=rs.getString("e_description")%></textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label for="e_date" class="form-label"><i class="fas fa-calendar-day" style="color: #ff7043;"></i> Fecha:</label>
                                        <input type="date" id="e_date" name="e_date" class="form-control" value="<%=rs.getString("e_date")%>" required />
                                    </div>

                                    <div class="mb-3">
                                        <label for="e_ubication" class="form-label"><i class="fas fa-map-marker-alt" style="color: #26a69a;"></i> Ubicación:                                                </label>
                                        <input type="text" id="e_ubication" name="e_ubication" class="form-control" value="<%=rs.getString("e_ubication")%>"                                                required />
                                    </div>

                                    <div class="mb-3">
                                        <label for="e_tickets" class="form-label"><i class="fas fa-ticket-alt" style="color: #ffca28;"></i> Entradas                                                        disponibles:</label>
                                        <input type="number" id="e_tickets" name="e_tickets" class="form-control" value="<%=rs.getInt("e_tickets")%>" required                                              />
                                    </div>

                                    <input type="hidden" type="number" id="e_id" name="e_id" class="form-control" value="<%= rs.getInt("e_id")%>" readonly />
                                </div>

                                <div class="card-footer d-flex justify-content-between align-items-center p-3" style="background-color: #f8f9fa;
                                     border-top: 1px                                        solid #ddd;">
                                    <button type="submit" class="btn btn-success btn-lg" style="border-radius: 20px;
                                            padding: 12px 20px;
                                            font-size: 1rem;
                                            flex: 1;
                                            margin-right: 10px;">
                                        <i class="fas fa-save"></i> <b>Guardar Cambios</b>
                                    </button>

                                    <a href="PaseoDetails.jsp?id=<%=eventId%>" class="btn btn-primary btn-lg" style="border-radius: 20px;
                                       padding: 12px 20px;
                                       font-size: 1rem;
                                       flex: 1;">
                                        <i class="fas fa-times-circle"></i> <b>Atras</b>
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="reservarPaseo">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="card-title text-center" style="font-size: 2rem; font-weight: bold; letter-spacing: 1px;">Solicitar cita</h1>
                    </div>

                    <div class="modal-body">
                        <form action="Reservar.jsp?eventId=<%=eventId%>">
                            <div class="card mb-5 shadow-lg mx-auto mt-5" style="max-width: 500px; border-radius: 10px; overflow: hidden;">
                                <div class="card-header bg-success text-white">
                                    <img src="<%=rs.getString("e_photo")%>" class="card-img-top" alt="Evento Imagen" 
                                         style="max-height: 250px; object-fit: cover; border-radius: 10px 10px 0 0;" />
                                </div>

                                <div class="card-body p-4">
                                    <div class="mb-3">
                                        <h2 class="card-title text-center fas fa-ticket-alt" 
                                            style="font-size: 1.2rem; color: #ffca28; font-weight: bold; letter-spacing: 1px;">
                                            Entradas disponibles: <%=rs.getInt("e_tickets")%>
                                        </h2>
                                    </div>

                                    <div class="mb-3">
                                        <label for="r_tickets" class="form-label">Cantidad de campos que desea:</label>
                                        <input type="number" id="r_tickets" name="r_tickets" class="form-control" value="1" required 
                                               min="1" max="<%=rs.getInt("e_tickets")%>" />
                                        <input type="hidden" id="eventId" name="eventId" value="<%=eventId%>" readonly/>
                                        <input type="hidden" id="userId" name="userId" value="<%=userId%>" readonly/>
                                        <input type="hidden" id="initialTickets" name="initialTickets" value="<%=rs.getInt("e_tickets")%>" readonly/>
                                    </div>
                                </div>

                                <div class="card-footer d-flex justify-content-between align-items-center p-3" 
                                     style="background-color: #f8f9fa; border-top: 1px solid #ddd;">

                                    <button type="submit" class="btn btn-success btn-lg" 
                                            style="border-radius: 20px; padding: 12px 20px; font-size: 1rem; flex: 1; margin-right: 10px;">
                                        <i class="fas fa-save"></i> <b>Asignar cita</b>
                                    </button>

                                    <a href="PaseoDetails.jsp?id=<%=eventId%>" class="btn btn-primary btn-lg" 
                                       style="border-radius: 20px; padding: 12px 20px; font-size: 1rem; flex: 1;">
                                        <i class="fas fa-times-circle"></i> <b>Cancelar</b>
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="card mb-5 shadow-lg mx-auto mt-5" style="width: 600px;
             border-radius: 10px;
             overflow: hidden;">
            <div class="card-header bg-success text-white">
                <h1 class="card-title text-center" style="font-size: 2rem;
                    font-weight: bold;
                    letter-spacing: 1px;"><%=rs.getString("e_name")%></h1>
                <img src="<%=rs.getString("e_photo")%>" class="card-img-top" alt="Evento Imagen" style="max-height: 250px;
                     object-fit: cover;
                     border-radius: 10px 10px 0 0;" />
            </div>

            <div class="card-body p-4">
                <p class="card-text"><i class="fas fa-info-circle" style="color: #5c6bc0;"></i> <b>Descripción:</b> <%=rs.getString("e_description")%></p>
                <p class="card-text"><i class="fas fa-calendar-day" style="color: #ff7043;"></i> <b>Fecha:</b> <%=rs.getString("e_date")%></p>
                <p class="card-text"><i class="fas fa-map-marker-alt" style="color: #26a69a;"></i> <b>Ubicación:</b> <%=rs.getString("e_ubication")%></p>
                <p class="card-text"><i class="fas fa-ticket-alt" style="color: #ffca28;"></i> <b>Campos disponibles:</b> <%=rs.getInt("e_tickets")%></p>
            </div>

            <div class="card-footer d-flex justify-content-between align-items-center p-3" style="background-color: #f8f9fa;
                 border-top: 1px solid #ddd;
                 gap: 10px;">

                <a data-bs-toggle="modal" data-bs-target="#reservarPaseo" class="btn btn-success btn-lg" style="border-radius: 20px;
                   padding: 12px 20px;
                   font-size: 1rem;
                   flex: 1;">
                    <i class="fas fa-check-circle"></i> <b>Asignar cita</b>
                </a>

                <% if (userId == rs.getInt("e_userId")) { %>

                <a data-bs-toggle="modal" data-bs-target="#editarPaseo" class="btn btn-warning btn-lg" style="border-radius: 20px;
                   padding: 12px 20px;
                   font-size: 1rem;
                   flex: 1;">
                    <i class="fas fa-edit"></i> <b>Editar</b>
                </a>

                <a data-bs-toggle="modal" data-bs-target="#eliminarPaseo" class="btn btn-danger btn-lg" style="border-radius: 20px;
                   padding: 12px 20px;
                   font-size: 1rem;
                   flex: 1;">
                    <i class="fas fa-trash-alt"></i> <b>Eliminar</b>
                </a>
                <% }%>

                <a href="home.jsp" class="btn btn-primary btn-lg" style="border-radius: 20px;
                   padding: 12px 20px;
                   font-size: 1rem;
                   flex: 1;">
                    <i class="fas fa-times-circle"></i> <b>Cerrar</b>
                </a>
            </div>
        </div>
    </body>
</html>
