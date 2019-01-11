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
        <%
            User u = (User)request.getSession().getAttribute("userObject");
        if( u == null ){
            response.sendRedirect("/EcomProj/User/Login.jsp");
        }
         
        System.out.println(u.getRol());
        
        if( !u.getRol().equals("ROLE_ADMIN") )
        {
        response.sendError ( HttpServletResponse.SC_UNAUTHORIZED, "You don't have enough privileges" );
        }
    
        %>
         <c:import url="/header.jsp"></c:import>
        
         <div class="container">
        <h1>Add Category</h1>
        <a href= "http://localhost:${pageContext.request.localPort}${pageContext.request.contextPath}/Category/ViewCategory.jsp" class="btn btn-primary" style="float:right; margin-right: 50px;">View Category</a><br><br>
        <form method="post" action="${pageContext.request.contextPath}/AddCategoryToDB">
            <input type="text" placeholder="Enter Category Name" name="name" class="form-control"><br>
            <textarea class="form-control" name="description" placeholder="Enter Category Description"></textarea><br>
            <button class="btn btn-danger" type="submit">Add Category</button>
        </form>
         </div>
            
            
              <% session.setAttribute("userObject", request.getSession().getAttribute("userObject")); 
                  
                %>
                
                ${userObject}
        <c:choose>

            <c:when test="${not empty userObject}">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item nav-link">Welcome ${userObject.getUsername()}</li>
                    <li class="nav-item">
                        <a class="nav-link" href="">">Log Out</a>
                    </li>
                </ul>
            </c:when>
            
            <c:otherwise>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/EcomProj/User/Login.jsp">Log In</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Registration</a>
                    </li>
                </ul>
            </c:otherwise>
        </c:choose>
    </body>
</html>