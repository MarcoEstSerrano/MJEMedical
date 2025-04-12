<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="app.model.pckg.Notificacion"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%
    int medicId = Integer.parseInt(String.valueOf(session.getAttribute("medicId")));
    String email = (String) session.getAttribute("email");
    if (email == null) {
        request.setAttribute("errorMensage", "La sesión está inactiva, debes iniciar sesión.");
        RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
        rd.forward(request, response);
    }

    String fecha = request.getParameter("txtFecha");
    String especialidad = request.getParameter("txtEspecialidad");
    DbHelper db = new DbHelper();
    
    int espacioId = db.programarcita(medicId, fecha, especialidad, 0);

    if (espacioId > 0) {

        LocalDateTime fechaHoraActual = LocalDateTime.now();
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String fechaHoraFormateada = fechaHoraActual.format(formato);

        Notificacion notimedic = new Notificacion(medicId, medicId, "create", "cita", fechaHoraFormateada, 1, espacioId);
        
        db.saveNotification(notimedic);

%>
<div class="container d-flex justify-content-center">
    <div class="card shadow-lg p-4">
        <div class="card-body">
            <h4 class="card-title text-success"><i class="fas fa-check-circle"></i> ¡Realizado!</h4>
            <p class="card-text">Cita programada con exito.</p>
            <a href="homeMedic.jsp" class="btn btn-success w-100"><i class="fas fa-thumbs-up"></i>Aceptar</a>
        </div>
    </div>
</div>
<%} else {%>
<div class="container d-flex justify-content-center">
    <div class="card shadow-lg p-4">
        <div class="card-body">
            <h4 class="card-title text-danger"><i class="fas fa-exclamation-circle"></i> ¡Error!</h4>
            <p class="card-text">Ocurrió un error al programar la cita. Inténtalo de nuevo...</p>
            <a href="homeMedic.jsp" class="btn btn-danger w-100"><i class="fas fa-times"></i>Intentar de nuevo</a>
        </div>
    </div>
</div>
<%
    }
%>




%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Programar cita</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
