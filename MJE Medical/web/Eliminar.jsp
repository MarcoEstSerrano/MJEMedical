
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%   
    int userId = (int) session.getAttribute("userId");
    int eventId = Integer.parseInt(request.getParameter("id"));

    DbHelper dbh = new DbHelper();

    if (dbh.deleteEvent(eventId, userId)) {
        RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
        rd.forward(request, response);
    } else {
        request.setAttribute("errorMensage", "Error eliminando el paseo");
        RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
        rd.forward(request, response);
    }
%>