<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecomproj.impl.CartDAOImpl"%>
<%@page import="com.mycompany.ecomproj.dao.CartDAO"%>
<%@page import="com.mycompany.ecomproj.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">



<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
    <a class="navbar-brand" href="http://localhost:${pageContext.request.localPort}${pageContext.request.contextPath}/index.jsp">FabMart</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/EcomProj/index.jsp">Home<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/EcomProj/AboutUs.jsp">About Us</a>
            </li>
        </ul>




        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
        </form>

        <% session.setAttribute("userObject", request.getSession().getAttribute("userObject"));
        %>


        <c:choose>

            <c:when test="${not empty userObject}">
                <%
                    User u = (User) session.getAttribute("userObject");
                    int uid = u.getId();
                    CartDAO cdao = new CartDAOImpl();
                    List l = cdao.getCartItemsForUser(uid);
                    request.setAttribute("size", l.size());
            %>
                <div class="navbar ml-auto dropdown" style="font-size: 18px; padding: 0;">
                    <a href="/EcomProj/Cart/ViewCart.jsp" style="color:black;"><i class="fas fa-shopping-cart">&nbsp</i>View Cart&nbsp<span class="badge badge-secondary">${size}</span></a>
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black;">
                        Welcome ${userObject.getUsername()}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/EcomProj/User/Profile.jsp"><i>Profile</i></a>
                        <a class="dropdown-item" href="#"><i>Orders</i></a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="http://localhost:8080/EcomProj/Logout">Logout</a>
                    </div>
                </div>


            </c:when>

            <c:otherwise>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/EcomProj/User/Login.jsp">Log In</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/EcomProj/User/Registration.jsp">Registration</a>
                    </li>
                </ul>
            </c:otherwise>

        </c:choose>






    </div>
</nav><br>