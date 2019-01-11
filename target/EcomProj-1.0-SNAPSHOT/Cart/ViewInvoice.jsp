
<%@page import="com.mycompany.ecomproj.model.User"%>
<%@page import="com.mycompany.ecomproj.impl.UserAddressDAOImpl"%>
<%@page import="com.mycompany.ecomproj.dao.UserAddressDAO"%>
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
        <title>View Invoice</title>

    </head>

    <body>

        <c:import url="/header.jsp"></c:import>

        <%
            User u = (User)request.getSession().getAttribute("userObject");
            CartDAO cdao = new CartDAOImpl();
            int id = u.getId();
            request.setAttribute("cats", cdao.getCartItemsForUser(id));
        
            UserAddressDAO uadddao = new UserAddressDAOImpl();
            
            request.setAttribute("useraddress",  uadddao.getUserAddressByUserId(id) );

        %>


        
        <div class="container">
            <h1>Invoice</h1>
            
            
            <table class="table">
                <thead style="background-color: green;color:white;">
                    <tr>
                        <td>Image</td>
                        <td>Product Description</td>
                        <td>Qty</td>
                        <td>Price</td>
                        <td>SubTotal</td>
                        
                    </tr>
                </thead>
                <tbody>
                    
                    <c:set var="grandTotal" value="0"></c:set>
                    
                    <c:forEach items="${cats}" var="c">
                           
                            
                        <tr>
                            <c:set var="Income" scope="session" value="${c.getProduct()}"/>
                            <td><img style="object-fit: cover;" width="150px" height="75px" src="<c:out value="${Income.getImagePath()}"/>"></td>
                            <td><h5><c:out value="${Income.getName()}"/></h5>
                                <h6><c:out value="${Income.getCategory()}"/></h6>   
                                <c:out value="${Income.getDescription()}"/><br>

                            </td>
                            <td>${c.getQty()}</td>
                            <td><c:out value="${Income.getPrice()}"/></td>
                            <td><i style="font-size: 20px;"class="fas fa-rupee-sign"><span>&nbsp;</span>${c.getQty() * Income.getPrice()}</i></td>
                            
                            
                            
                            
                            
                            <c:set var="grandTotal" value="${grandTotal + c.getQty() * Income.getPrice()}"></c:set>
                            
                        </tr>               
                    </c:forEach>
                </tbody>
            </table>
                    
                  
            <h4>Shipping Address:</h4>
            ${useraddress.getShipTo()}
            
            <br>
            <h4>Billing Address</h4>
            ${useraddress.getBillTo()}
            
            <br>
            <h4>Grand Total: <i class="fas fa-rupee-sign">&nbsp</i><c:out value="${grandTotal}"></c:out>
                    
                 

        <a href="${pageContext.request.contextPath}/Cart/ConfirmOrder.jsp" class="btn btn-danger" style="float: right;margin-right: 10%">Confirm Order</a>
        <br>
        <br>
        <br>
        </div>
        <div class="jumbotron" style="color:white;background-color: black; margin-top: 60px; margin-bottom: 0;">
            <p>Welcome to Ecom</p>
        </div>
    </body>
</html>