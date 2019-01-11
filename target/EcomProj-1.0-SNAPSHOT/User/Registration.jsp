<%-- 
    Document   : Registration
    Created on : 4 Jan, 2019, 2:22:19 PM
    Author     : innoc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
    <c:import url="/header.jsp"></c:import>
          
          <div class="container">
                <h1>Registration</h1>
                <br>
            <form method="post" action="${pageContext.request.contextPath}/AddUserToDB">
                <input type="text" placeholder="Enter Username" name="username" class="form-control"><br>
                <input type="password" class="form-control" name="password" placeholder="Enter Password"><br>
                <input type="text" placeholder="Enter Email" name="email" class="form-control"><br>
                <input type="text" placeholder="Enter Phone Number" name="phoneno" class="form-control"><br>
                
                <br>
                <button class="btn btn-danger" type="submit">Submit</button>
            </form>
                
          <c:if test="${not empty success}">
              <br>
              <h1 class="alert alert-danger">${success}</h1>
              <p>Click here to Login...  <a  class="btn btn-primary"href="http://localhost:8080/EcomProj/User/Login.jsp">Login</a></p>
              
            </c:if>
        </div>
          
    </body>
</html>
