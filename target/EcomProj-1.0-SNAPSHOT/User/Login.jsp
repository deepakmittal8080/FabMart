<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="Style.css">
    </head>
    <body>
        
        <c:import url="/header.jsp"></c:import>
           <div class="container">
                <h1>Login</h1>
                <br>
            <form method="post" action="${pageContext.request.contextPath}/login">
                <input type="text" placeholder="Enter Username" name="username" class="form-control"><br>
                <input type="password" class="form-control" name="password" placeholder="Enter Password"><br>  
                
                
                <a href="/EcomProj/User/ForgotPassword.jsp">forgot Password ?</a><br><br>
                <button class="btn btn-danger" type="submit">Submit</button>
            </form>
                
           <c:if test="${not empty error}">
               <br>
               <h1 class="alert alert-danger">${error}</h1>
           </c:if>
           
           <c:if test="${not empty reset}">
               <br>
               <h4 class="alert alert-danger">${reset}</h4>
           </c:if>    
                
        </div>
      
    </body>
</html>
