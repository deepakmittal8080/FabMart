<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mycompany.ecomproj.impl.ProductDAOImpl"%>
<%@page import="com.mycompany.ecomproj.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ProductDAO pdao = new ProductDAOImpl();

    if (request.getParameter("category") == null) {
        request.setAttribute("productMap", pdao.getProductsByCategory());
    } else {
        request.setAttribute("productMap", pdao.getProductsByCategory(request.getParameter("category")));
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>

        <c:import url="header.jsp"/>

    </head>
    <body>

        <!-- Carousel ------------>    
        <div class="container">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" style="height: 400px;" src="images/a.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" style="height: 400px;" src="images/b.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" style="height: 400px;" src="images/c.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <br>
            <hr>
        </div>
        <br>
        <br>

        <!---        left and right bar ---->

        <div class="container-fluid">
            <div class="row">

                <!-- Left Bar --->

                <div class="col-md-3">
                    <ul class="list-group">
                        <li class="list-group-item" style="background-color: green; color: white;"><h4>Categories<h4></li>

                                    <c:forEach items="${productMap}" var="entry">

                                        <li class="list-group-item"><button bid="${entry.key}" class="btn btn-link">${entry.key}</button><a style="float: right;" href="#" class="badge badge-secondary"><span>${entry.value.size()}</span></a></li>
                                                </c:forEach>
                                    </ul>
                                    </div>

                                    <!-- Right Bar  --->

                <div class="col-md-8">


                   <c:forEach items="${productMap}" var="entry">

                                            <div  id="${entry.key}" class="catproddisp" >
                                                <h6 class="text text-danger">${entry.key}</h6>

                                                <c:forEach items="${entry.value}" var="prod">


                                                    <div  style="width: 200px;">
                                                        <div class="card" style="margin: 10 ;" width: 300px;">
                                                             <div class="card-body"  style="padding: 0; text-align: center;">
                                                                <img class="card-img-top" src="${prod.getImagePath()}" alt="Card image cap" style="object-fit: cover; height: 200px;">
                                                                <h5 class="card-title" style="margin-top: 5px;">${prod.getName()}</h5>
                                                                <a  href="Product/ViewSingleProduct.jsp?id=${prod.getId()}" class="btn btn-primary" style="color: white; width: 150px; margin-bottom: 10px;">View</a>
                                                            </div>  
                                                        </div>

                                                    </c:forEach>
                                                    </div>

                                                </div>          
                                            

                                            <script>

                                                $(document).ready(function () {

                                                    $("button[bid='${entry.key}']").click(function () {

                                                        $(".catproddisp").each(function () {
                                                            $(this).hide();
                                                        });

                                                        $("#${entry.key}").show();
                                                    });


                                                });

                                            </script>

                                        </c:forEach>


                                        <script>

                                            $(document).ready(function () {

                                                $(".catproddisp").each(function () {
                                                    $(this).hide();
                                                });

                                                $(".catproddisp").eq(0).show();
                                            });

                                        </script>
            </div>
                </div>

                                    </div>
                                    

                                    

                                    <!-- Footer   --->

                                    <div class="jumbotron" style="color:white;background-color: black; margin-top: 60px; margin-bottom: 0;">
                                        <p>Welcome to Ecom</p>
                                    </div>

                                    </body>
                                    </html>
