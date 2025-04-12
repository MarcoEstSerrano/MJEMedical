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

        </style>
    </head>
    <body>
        <%
        int espacioId = Integer.parseInt (request.getParameter("id"));
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
                
                <%
                    
                while(rs.next()){
                
                %>
                
                
                <p class="card-text"><i class="fas fa-info-circle" style="color: #5c6bc0;"></i> <b>Especialidad: <%=rs.getString("especialidad") %></b></p>
                <p class="card-text"><i class="fas fa-calendar-day" style="color: #ff7043;"></i> <b>Fecha:<%=rs.getString("fecha") %></b></p>
                
                <%
                    
                    }
                %>
                
            </div>
            
            
            <div class="card-footer d-flex justify-content-between align-items-center p-3" style="background-color: #f8f9fa;
                 border-top: 1px solid #ddd;
                 gap: 10px;">

                <a data-bs-toggle="modal" data-bs-target="#modificarReserva" class="btn btn-warning btn-lg" style="border-radius: 20px;
                   padding: 12px 20px;
                   font-size: 1rem;
                   flex: 1;">
                    <b>Modificar</b>
                </a>

                <a data-bs-toggle="modal" data-bs-target="#cancelarReserva" 
                   class="btn btn-danger btn-lg" 
                   style="border-radius: 20px; padding: 12px 20px; font-size: 1rem; flex: 1;" 
                   <b>Cancelar reserva</b>
                </a>

                <a href="MisReservas.jsp" 
                   class="btn btn-success btn-lg" 
                   style="border-radius: 20px; padding: 12px 20px; font-size: 1rem; flex: 1;" 
                   <b>Atras</b>
                </a>
            </div>
        </div>
    </body>
</html>
