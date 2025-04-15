<%-- 
    Document   : VerInfoCita
    Created on : 11 abr 2025, 3:50:28 p. m.
    Author     : marco
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Info de cita</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {
                background-image: url('img/celeste.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #01579b;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .card {
                background: rgba(255, 255, 255, 0.9);
                color: #01579b;
                border-radius: 16px;
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
                overflow: hidden;
                transition: transform 0.3s ease;
            }

            .card:hover {
                transform: scale(1.01);
            }

            .card-header {
                background: rgba(1, 87, 155, 0.9); /* Azul profundo semitransparente */
                color: #e3f2fd;
                padding: 20px;
                text-align: center;
                font-size: 1.8rem;
                font-weight: bold;
                border-radius: 16px 16px 0 0;
            }

            .card-body {
                padding: 30px;
                background: rgba(240, 248, 255, 0.7); /* azul muy claro translúcido */
            }

            .card-body .card-text {
                font-size: 1.1rem;
                margin-bottom: 15px;
                color: #0277bd;
            }

            .card-footer {
                background: rgba(225, 245, 254, 0.9);
                border-top: 1px solid #b3e5fc;
                padding: 20px;
                display: flex;
                justify-content: space-between;
                gap: 10px;
                border-radius: 0 0 16px 16px;
            }

            .btn {
                border-radius: 30px;
                font-weight: bold;
                padding: 12px 25px;
                font-size: 1rem;
                width: 100%;
                transition: all 0.3s ease-in-out;
            }

            .btn-warning {
                background-color: #4fc3f7;
                color: #ffffff;
                border: none;
            }

            .btn-warning:hover {
                background-color: #29b6f6;
                transform: scale(1.05);
            }

            .btn-danger {
                background-color: #ef5350;
                color: white;
                border: none;
            }

            .btn-danger:hover {
                background-color: #d32f2f;
                transform: scale(1.05);
            }

            .btn-success {
                background-color: #0288d1;
                color: white;
                border: none;
            }

            .btn-success:hover {
                background-color: #0277bd;
                transform: scale(1.05);
            }

            i.fas {
                margin-right: 8px;
            }
        </style>


    </head>
    <body>
        <%
            int espacioId = Integer.parseInt(request.getParameter("id"));
            DbHelper db = new DbHelper();
            ResultSet rs = db.getespacio(espacioId);

        %>

        <div class="card mb-5 shadow-lg mx-auto mt-5" style="width: 600px;
             border-radius: 10px;
             overflow: hidden;">
            <div class="card-header bg-success text-white">
                <h1 class="card-title text-center" style="font-size: 2rem;
                    font-weight: bold;
                    object-fit: cover;
                    border-radius: 10px 10px 0 0;" />
            </div>

            <div class="card-body p-4">


                <%                    if (espacioId != 0) {
                        while (rs.next()) {
                %>

                <p class="card-text"><i class="fas fa-info-circle" style="color: #5c6bc0;"></i> <b>Especialidad: <%=rs.getString("especialidad")%></b></p>
                <p class="card-text"><i class="fas fa-calendar-day" style="color: #ff7043;"></i> <b>Fecha:<%=rs.getString("fecha")%></b></p>

                <%
                    }
                } else {
                %>
                <p class="card-text"><i class="fas fa-info-circle" style="color: #5c6bc0;"></i> <b>Sin contenido adicional</b></p>
                <%
                    }
                %>

            </div>

            <div class="card-footer d-flex justify-content-between align-items-center p-3" style="background-color: #f8f9fa;
                 border-top: 1px solid #ddd;
                 gap: 10px;">

                <%if (espacioId > 0) {%>
                <a href="verInfoPte.jsp?espacioId=<%=espacioId%>" class="btn btn-warning btn-lg" style="border-radius: 20px;
                   padding: 12px 20px;
                   font-size: 1rem;
                   flex: 1;">
                    <b>Ver info pte</b>
                </a>

                <a href="CancelarReserva.jsp?espacioId=<%=espacioId%>"
                   class="btn btn-danger btn-lg" 
                   style="border-radius: 20px; padding: 12px 20px; font-size: 1rem; flex: 1;" 
                   <b>Cancelar cita</b>
                </a>

                <%}%>
                <a href="homeMedic.jsp" 
                   class="btn btn-success btn-lg" 
                   style="border-radius: 20px; padding: 12px 20px; font-size: 1rem; flex: 1;" 
                   <b>Atras</b>
                </a>
            </div>
        </div>
    </body>
</html>
