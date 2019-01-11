<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
    </head>
    <body>
        <c:import url="/header.jsp"></c:import>
        
        <div class="container">
        
        <h4>Reset Password</h4>
        <p>Enter your Email to reset Password</p>
        
        <h5>Email</h5>
        <form method="post" action="${pageContext.request.contextPath}/ForgotPassword">
        <input class="form-control"type="text" name="email"><br>
        <input class="btn btn-danger" type="submit" value="Send">
        </form>
        </div>
    </body>
</html>
