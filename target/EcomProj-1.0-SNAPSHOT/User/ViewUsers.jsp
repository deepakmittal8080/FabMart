<%-- 
    Document   : ViewUsers
    Created on : 4 Jan, 2019, 2:23:58 PM
    Author     : innoc
--%>

<%@page import="com.mycompany.ecomproj.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mycompany.ecomproj.dao.UserDAO"%>
<%@page import="com.mycompany.ecomproj.impl.UserDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View User</title>
    </head>
    <body>
    
        <c:import url="/header.jsp"></c:import>
        <%
            User u = (User)request.getSession().getAttribute("userObject");
    
        if( !u.getRol().equals("ROLE_ADMIN") )
        response.sendError ( HttpServletResponse.SC_UNAUTHORIZED, "You don't have enough privileges" );
    
        UserDAO cdao = new UserDAOImpl();
        request.setAttribute("user", cdao.getUsers());
    %> 
        
        <div class="container"> 
        <h1>All Users</h1>
            <table class="table table-striped table-bordered">
            <thead>
                <tr>
            <strong><td>ID</td></strong>
                    <strong><td>Username</td></strong>
                    <strong><td>Password</td></strong>
                    <strong><td>Email</td></strong>
                    <strong><td>Phone No</td></strong>
                    <strong><td>Role</td></strong>
                    <strong><td>Update</td></strong>
                    <strong><td>Delete</td></strong>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${user}" var="User">
                    <tr>
                        <td>${User.getId()}</td>
                        <td>${User.getUsername()}</td>
                        <td>${User.getPassword()}</td>
                        <td>${User.getEmail()}</td>
                        <td>${User.getPhoneno()}</td>
                        <td>${User.getRol()}</td>
                        
                     
                        <td><a href="http://localhost:${pageContext.request.localPort}${pageContext.request.contextPath}/User/UpdateUser.jsp?id=${User.getId()}" class="btn btn-warning">Update</a></td>
                           <td><a href="http://localhost:${pageContext.request.localPort}${pageContext.request.contextPath}/DeleteUserFromDB?id=${User.getId()}" class="btn btn-danger">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
    </body>
</html>
