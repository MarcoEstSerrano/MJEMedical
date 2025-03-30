
<%@page import="app.model.pckg.Event"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<%
    String email = (String) session.getAttribute("email");

    if (email == null) {
        request.setAttribute("errorMensage", "La sesion esta inactiva, debes iniciar sesion.");
        RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
        rd.forward(request, response);
    }

    DbHelper dbh = new DbHelper();
    int paseoId = Integer.parseInt(request.getParameter("e_id"));
    String name = request.getParameter("e_name");
    String description = request.getParameter("e_description");
    String date = request.getParameter("e_date");
    String ubic = request.getParameter("e_ubication");
    int tickets = Integer.parseInt(request.getParameter("e_tickets"));

    if (dbh.updatePaseo(paseoId, new Event(paseoId, name, description, date, "", ubic, tickets))) {
        RequestDispatcher rd = request.getRequestDispatcher("PaseoDetails.jsp?id=" + paseoId);
        rd.forward(request, response);
    } else {
        request.setAttribute("errorMensage", "Error guardando los cambios");
        RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
        rd.forward(request, response);
    }
%>
