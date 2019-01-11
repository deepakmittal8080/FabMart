<%@page import="com.mycompany.ecomproj.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mycompany.ecomproj.impl.ProductDAOImpl"%>
<%@page import="com.mycompany.ecomproj.dao.ProductDAO"%>
<%@page import="com.sun.scenario.effect.impl.prism.PrCropPeer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product</title>
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
        
            ProductDAO pdao = new ProductDAOImpl();
            request.setAttribute("pats", pdao.getProduct());
        %>
<a href= "http://localhost:${pageContext.request.localPort}${pageContext.request.contextPath}/Product/AddProduct.jsp" class="btn btn-primary" style="float:right; margin-right: 50px;">Add Product</a><br><br>
        
        <div class="container">
            <h1>View Product</h1>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <td>Id</td>
                        <td>Name</td>
                        <td>Description</td>
                        <td>Price</td>
                        <td>imagePath</td>
                        <td>Qty</td>
                        <td>Category</td>
                        <td>Delete</td>
                        <td>Update</td>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${pats}" var="product">
                        <tr>
                            <td>${product.getId()}</td>
                            <td>${product.getName()}</td>
                            <td>${product.getDescription()}</td>
                            <td>${product.getPrice()}</td>
                            <td><img style="object-fit: cover;" src="${product.getImagePath()}" width="200px" height="100px"></td>
                            <td>${product.getQty()}</td>
                            <td>${product.getCategory()}</td>
                            <td><a href="http://localhost:${pageContext.request.localPort}${pageContext.request.contextPath}/DeleteProductFromDB?id=${product.getId()}" class="btn btn-danger">Delete</a></td>
                            <td><a href="http://localhost:${pageContext.request.localPort}${pageContext.request.contextPath}/Product/UpdateProduct.jsp?id=${product.getId()}" class="btn btn-warning">Update</a></td>
                            
                        </tr>
                    </c:forEach>
                </tbody>
            </table>




        </div>
    </body>
</html>
