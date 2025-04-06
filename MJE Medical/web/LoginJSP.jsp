
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

            DbHelper dbh = new DbHelper();

            request.getSession(false);

            if (session != null) {
                session.invalidate();
            }

            String resultado = dbh.validateLogin(email, pswd);

            switch (resultado) {
                case "Usuario":
                    ResultSet rs = dbh.getUser(email, pswd);

                    while (rs.next()) {
                        session = request.getSession();
                        session.setAttribute("email", email);
                        session.setAttribute("userId", rs.getInt("id"));
                        session.setAttribute("userName", rs.getString("user_name"));


                        RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                        rd.forward(request, response);
                    }

                    break;
                case "Medico":
                    ResultSet rs2 = dbh.getMedic(email, pswd);

                    while (rs2.next()) {
                        session = request.getSession();
                        session.setAttribute("email", email);
                        session.setAttribute("medicId", rs2.getInt("id"));
                        session.setAttribute("medicName", rs2.getString("nombre"));
                        session.setAttribute("especialidad", rs2.getString("especialidad"));

                        RequestDispatcher rd = request.getRequestDispatcher("homeMedic.jsp");
                        rd.forward(request, response);
                    }

                    break;
                default:
                    request.setAttribute("errorMensage", "El usuario ingresado no está registrado");
                    RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
                    rd.forward(request, response);
            }


        %>
    </body>
</html>
