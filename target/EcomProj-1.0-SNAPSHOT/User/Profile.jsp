<%@page import="com.mycompany.ecomproj.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="/header.jsp" ></c:import>
        <%    
                User u = (User)request.getSession().getAttribute("userObject");
                request.setAttribute("user", u);
        %>
        
        
        <div class="container">
            <h4 class="text-danger">Profile</h4>
        <br>
        <h5 class="text-primary">Username</h5>
        <input type="text" class="form-control" name="username" value="${user.getUsername()}">
        
        <h5 class="text-primary">Password</h5>
        <input type="text" class="form-control" name="password" value="${user.getPassword()}">
        
        <h5 class="text-primary" >Email</h5>
        <input type="text" class="form-control" name="email" value="${user.getEmail()}">
        
        <h5 class="text-primary">Mobile No</h5>
        <input type="text" class="form-control" name="phoneno" value="${user.getPhoneno()}">
        
        
        </div>
    </body>
</html>
