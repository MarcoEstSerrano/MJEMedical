
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession(false);

    if (session != null) {
        session.invalidate();
    }

    RequestDispatcher rd = request.getRequestDispatcher("Home.html");
    rd.forward(request, response);
%>
