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
            ProductDAO pdao = new ProductDAOImpl();
            
                int id = Integer.parseInt( request.getParameter("id") );
            
            request.setAttribute("curr", pdao.getProduct(id));
        %>

        
        <div class="container">
            
            
            <h1>${curr.getName()}</h1>


            <style>
                
                form *{
                    margin-top: 20px;
                    margin-bottom: 20px;
                }
                
            </style>
            
            <form method="post" action="${pageContext.request.contextPath}/AddProductToCart">
                
                <div class="row">
                    <div class="col-md-8">
                    <h2>${curr.getCategory()}</h2>
                <input type="hidden" value="${curr.getId()}" name="prodId">
               
                <p>${curr.getDescription()}</p>
                <h4><span><strong>Rs&nbsp</strong></span>${curr.getPrice()}</h4>                
                <button type="submit" class="btn btn-danger">Add To Cart</button>
                
                    </div>
                    <div class="col-md-4">
                        <img src="${curr.getImagePath()}" style="height: 350px; width: 300px;" class="img img-thumbnail">
                    </div>
                </div>
                
            </form>

        </div>
                    <br>
                    <br>
                    <br>
                      <div class="jumbotron" style="color:white;background-color: black; margin-top: 60px; margin-bottom: 0;">
            <p>Welcome to Ecom</p>
        </div>
    </body>
</html>
