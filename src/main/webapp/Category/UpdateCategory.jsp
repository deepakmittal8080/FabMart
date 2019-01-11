<%-- 
    Document   : AddCategory
    Created on : 10 Dec, 2018, 1:39:29 PM
    Author     : innoc
--%>

<%@page import="com.mycompany.ecomproj.model.User"%>
<%@page import="com.mycompany.ecomproj.impl.CategoryDAOImpl"%>
<%@page import="com.mycompany.ecomproj.dao.CategoryDAO"%>
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
        
         <% User u = (User)request.getSession().getAttribute("userObject");
        if( u == null ){
            response.sendRedirect("/EcomProj/User/Login.jsp");
        }
         
        System.out.println(u.getRol());
        
        if( !u.getRol().equals("ROLE_ADMIN") )
        {
        response.sendError ( HttpServletResponse.SC_UNAUTHORIZED, "You don't have enough privileges" );
        }
    
             CategoryDAO cdao = new CategoryDAOImpl();
            String id = request.getParameter("id");
            request.setAttribute("categoryObject", cdao.getCategory(Integer.parseInt(id)));
         %>
         
         
         <div class="container">
        <h1>Update Category</h1>
        <form method="get" action="${pageContext.request.contextPath}/UpdateCategoryToDB">
             <input type="hidden" name="id" value="${categoryObject.getId()}">
            <input type="text" value="${categoryObject.getName()}" placeholder="Enter Category Name" name="name" class="form-control"><br>
            <textarea  class="form-control" name="description" placeholder="Enter Category Description">${categoryObject.getDescription()}</textarea><br>
            <button class="btn btn-danger" type="submit">Update Category</button>
        </form>
         </div>
    </body>
</html>