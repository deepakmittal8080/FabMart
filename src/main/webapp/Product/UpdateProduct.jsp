<%-- 
    Document   : UpdateProduct
    Created on : 10 Dec, 2018, 7:44:00 PM
    Author     : innoc
--%>

<%@page import="com.mycompany.ecomproj.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mycompany.ecomproj.impl.ProductDAOImpl"%>
<%@page import="com.mycompany.ecomproj.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
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
         
         <%   
            ProductDAO pdao = new ProductDAOImpl();
            String id = request.getParameter("id");
            request.setAttribute("productObject", pdao.getProduct(Integer.parseInt(id)));
             %>
        
         <div class="container">
        <h1>Update Product</h1>
        <form method="post" action="${pageContext.request.contextPath}/UpdateProductToDB" enctype="multipart/form-data">
             <input type="hidden" name="id" value="${productObject.getId()}">
            <input type="text" value="${productObject.getName()}" name="name" class="form-control"><br>
            <textarea  class="form-control" name="description">${productObject.getDescription()}</textarea><br>
            <input type="text" class="form-control" name="price" value="${productObject.getPrice()}"><br> 
            <input type="file" class="form-control" name="imagePath"><br> 
            <input type="text" class="form-control" name="imagePath" value="${productObject.getImagePath()}"><br> 
             <input type="text" name="qty" class="form-control" value="${productObject.getQty()}"><br>
              <input type="text"  name="category" class="form-control" value="${productObject.getCategory()}"><br>
            <button class="btn btn-danger" type="submit">Update Product</button>
        </form>
         </div>
    </body>
</html>
