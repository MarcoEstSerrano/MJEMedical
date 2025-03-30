
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email = request.getParameter("txtEmail");
            String pswd = request.getParameter("txtPwd");

            
            if (email == null || !email.endsWith("@gmail.com")) {
                request.setAttribute("errorMensage", "El correo electrónico debe ser de dominio @gmail.com");
                RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
                rd.forward(request, response);
                return; 
            }

            DbHelper dbh = new DbHelper();

            request.getSession(false);

            if (session != null) {
                session.invalidate();
            }

            ResultSet rs = dbh.validateLogin(email, pswd);

            if (rs.next()) {
                session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("userName", rs.getString("user_name"));
                dbh.close();

                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);
                return;
            } else {
                request.setAttribute("errorMensage", "El usuario ingresado no está registrado");
                RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
                rd.forward(request, response);
            }
        %>
    </body>
</html>
