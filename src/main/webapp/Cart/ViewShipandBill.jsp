<%@page import="com.mycompany.ecomproj.model.User"%>
<%@page import="com.mycompany.ecomproj.model.UserAddress"%>
<%@page import="com.mycompany.ecomproj.impl.UserAddressDAOImpl"%>
<%@page import="com.mycompany.ecomproj.dao.UserAddressDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <c:import url="/header.jsp"></c:import>
        </head>
        <body style="text-align: center">

        <%
      
            User u = (User)request.getSession().getAttribute("userObject");
            UserAddressDAO udao = new UserAddressDAOImpl();
            int uid = u.getId();

            if (udao.getUserAddressByUserId(uid) == null) {
                UserAddress ua = new UserAddress();

                ua.setUserId(uid);

                udao.insert(ua);

            }

            if (request.getParameter("updateAddress") != null && request.getParameter("updateAddress").equals("true")) {
                UserAddress ua = udao.getUserAddressByUserId(uid);
                ua.setBillTo(request.getParameter("billto"));
                ua.setShipTo(request.getParameter("shipto"));

                udao.update(ua);

                request.setAttribute("updated", "Updated Successfully");
            }

            request.setAttribute("object", udao.getUserAddressByUserId(uid));
        %>
        <div class="container">

            <c:choose>
                <c:when test="${not empty object.getShipTo()}">

                    <h4>Current Shipping Address:</h4>

                    <hr>

                    <h3>${object.getShipTo()}</h3>

                </c:when>

                <c:otherwise>
                    <h1>Shipping Address Not Set</h1>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${not empty object.getBillTo()}">

                    <h4>Current Billing Address:</h4>

                    <hr>

                    <h4>${object.getBillTo()}</h4>

                </c:when>

                <c:otherwise>
                    <h1>Billing Address Not Set</h1>
                </c:otherwise>
            </c:choose>

            <form action="?updateAddress=true" method="post">

                <input type="hidden" class="form-control" name="userid" value="${param.uid}" >
                <input type="text" class="form-control" name="shipto"  value="${object.getShipTo()}" ><br>
                <input type="text" class="form-control" name="billto"  value="${object.getBillTo()}"><br>
                <button class="btn btn-success" type="submit">Update</button><br>

            </form>

            <c:if test="${not empty updated}">

                <br>
                <h1 class="alert alert-warning">${updated}</h1>

            </c:if>

        </div>
                <br>
                <a class="btn btn-danger" href="ViewInvoice.jsp">View Order Summary</a>
    </body>
</html>
