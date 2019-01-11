<%-- 
    Document   : ViewCategory
    Created on : 10 Dec, 2018, 3:07:58 PM
    Author     : innoc
--%>

<%@page import="com.mycompany.ecomproj.model.User"%>
<%@page import="com.mycompany.ecomproj.impl.CategoryDAOImpl"%>
<%@page import="com.mycompany.ecomproj.dao.CategoryDAO"%>
<%@page import="com.mycompany.ecomproj.model.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <c:import url="/header.jsp"></c:import>
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
    
        CategoryDAO cdao = new CategoryDAOImpl();
        request.setAttribute("cats", cdao.getCategory());
    %>
        
        <a href= "http://localhost:${pageContext.request.localPort}${pageContext.request.contextPath}/Category/AddCategory.jsp" class="btn btn-primary" style="float:right; margin-right: 50px;">Add Category</a><br><br>
        <div class="container"> 
        <h1>All Categories</h1>
            <table class="table table-striped table-bordered">
            <thead>
                <tr>
            <strong><td>ID</td></strong>
                    <strong><td>Name</td></strong>
                    <strong><td>Description</td></strong>
                    <strong><td>Delete</td></strong>
                    <strong><td>Update</td></strong>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${cats}" var="Category">
                    <tr>
                        <td>${Category.getId()}</td>
                        <td>${Category.getName()}</td>
                        <td>${Category.getDescription()}</td>
                        <td><a href="http://localhost:${pageContext.request.localPort}${pageContext.request.contextPath}/DeleteCategoryFromDB?id=${Category.getId()}" class="btn btn-danger">Delete</a></td>
                        <td><a href="http://localhost:${pageContext.request.localPort}${pageContext.request.contextPath}/Category/UpdateCategory.jsp?id=${Category.getId()}" class="btn btn-warning">Update</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
    </body>
</html>
