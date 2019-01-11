<%@page import="com.mycompany.ecomproj.model.User"%>
<%@page import="com.mycompany.ecomproj.model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecomproj.model.Cart"%>
<%@page import="com.mycompany.ecomproj.impl.CartDAOImpl"%>
<%@page import="com.mycompany.ecomproj.dao.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Items</title>

    </head>

    <body>

        <c:import url="/header.jsp"></c:import>

        <%
            CartDAO cdao = new CartDAOImpl();
            User u = (User)request.getSession().getAttribute("userObject");
            int id = u.getId();
            request.setAttribute("cats", cdao.getCartItemsForUser(id));
        %>


        <div class="container">
            <h4>Cart Items</h4>

            <table class="table">
                <thead style="background-color:green ; color: white;">
                    <tr>
                        <td>Image</td>
                        <td>Product Description</td>
                        <td>Qty</td>
                        <td>Price</td>
                        <td>Total</td>
                        <td>Delete</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cats}" var="c">
                           
                            
                        <tr>
                            <c:set var="Income" scope="session" value="${c.getProduct()}"/>
                            <td><img style="object-fit: cover;" width="150px" height="75px" src="<c:out value="${Income.getImagePath()}"/>"></td>
                            <td><p><c:out value="${Income.getName()}"/></p>
                                <h6><c:out value="${Income.getCategory()}"/></h6>   
                                <c:out value="${Income.getDescription()}"/><br>

                            </td>
                <form method="get" action="${pageContext.request.contextPath}/UpdateQty">
                    <input type="hidden" name="productId" value="${c.getProductId()}">
                    <td><input  class="form-control" type="text" value="${c.getQty()}" name="qty" style="width: 40px;" >&nbsp<button><i style="font-size: 30px;" class="fas fa-pen-square"></i></button></td>
                </form>
                            <td ><c:out value="${Income.getPrice()}"/></td>
                            <td><i style="font-size: 20px;"class="fas fa-rupee-sign"><span>&nbsp;</span>${c.getQty() * Income.getPrice()}</i></td>
                            <td style="text-align: center;"><a href="${pageContext.request.contextPath}/DeleteCartFromDB?id=${c.getId()}"><i style="font-size: 30px;" class="fas fa-trash-alt"></i></a></td>
                        </tr>               
                    </c:forEach>
                </tbody>
            </table>

        </div>


        <a href="/EcomProj/Cart/ViewShipandBill.jsp" class="btn btn-danger" style="float: right;margin-right: 10%">Add Shipping Address</a>
        <br>
        <br>
        <br>
        <div class="jumbotron" style="color:white;background-color: black; margin-top: 60px; margin-bottom: 0;">
            <p>Welcome to Ecom</p>
        </div>
    </body>
</html>