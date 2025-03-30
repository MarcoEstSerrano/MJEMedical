
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page import="app.model.pckg.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username = request.getParameter("txtUserName");
            String pasword = request.getParameter("txtPassword");
            String email = request.getParameter("txtEmail");

            User usuarios = new User(username, pasword, email, 1);

            DbHelper dbh = new DbHelper();

            if (dbh.saveUser(usuarios)) {
                RequestDispatcher rd = request.getRequestDispatcher("index.html");
                rd.forward(request, response);
                
            }else{
            RequestDispatcher rd = request.getRequestDispatcher("index.html");
                rd.forward(request, response);
            }


        %>
    </body>
</html>
