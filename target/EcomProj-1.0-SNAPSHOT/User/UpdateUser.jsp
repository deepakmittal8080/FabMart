
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mycompany.ecomproj.impl.UserDAOImpl"%>
<%@page import="com.mycompany.ecomproj.dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
    </head>
    <body>
    
    <c:import url="/header.jsp"></c:import>
    
        <% UserDAO udao = new UserDAOImpl();
            String id = request.getParameter("id");
            request.setAttribute("User", udao.getUserById(Integer.parseInt(id)));
         %>
        
            <div class="container">
                <h1>Update User</h1><br>
        <form method="get" action="${pageContext.request.contextPath}/UpdateUserToDB">
            <input type="hidden" value="${param.id}" name="id">  
            <input type="text" placeholder="Enter Username" value="${User.getUsername()}" name="username" class="form-control"><br>
                <input type="password" class="form-control" value="${User.getPassword()}" name="password" placeholder="Enter Password"><br>
                <input type="text" placeholder="Enter Email" value="${User.getEmail()}" name="email" class="form-control"><br>
                <input type="text" placeholder="Enter Phone Number" value="${User.getPhoneno()}" name="phoneno" class="form-control"><br>
            <button class="btn btn-danger" type="submit">Update User</button>
        </form>
         </div>
</body>
</html>
