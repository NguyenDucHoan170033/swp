<%-- 
    Document   : index
    Created on : Oct 11, 2023, 6:31:46 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/category.css" rel="stylesheet" type="text/css"/>
        <script src="js/checkLoginToShopping.js"></script>
        <script>
            var isLoggedIn = ${sessionScope.acc != null};
        </script>

    </head>
    <body>

        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col text-center"> 
                        <h3> MOVIE WATCHES </h3>
                        </ol>
                    </div>
                </div>
            </div>




            <div class="col-sm-12">
                <div class="row">
                <c:forEach items="${listP}" var="o">
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="card">
                            <img class="card-img-top" src="${o.image}" alt="Card image cap">
                            <div class="card-body">
                                <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product" style="color: #000000">${o.name}</a></h4>

                                <div class="row">
                                    <div class="col">
                                        <p class="btn btn-danger btn-block" onclick="checkLoginClickPrice(${o.id})">
                                            <a style="color: white" href="#">${o.price} $</a>
                                        </p>
                                    </div>
                                    <div class="col">
                                        <a href="#" class="btn btn-block" style="background-color: green; color: white" onclick="checkLoginAndAddToCart(${o.id})">Add to cart</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>



        <div class="col-sm-12" >
            <ul class="pagination" style="justify-content: center">
                <li class="page-item">
                    <c:choose>
                        <c:when test="${page > 1}">
                            <a class="page-link" href="homecontroll?page=${page - 1}" style="color: black">&laquo;</a>
                        </c:when>
                        <c:otherwise>
                            <span class="page-link disabled">&laquo;</span>
                        </c:otherwise>
                    </c:choose>
                </li>
                <c:forEach begin="1" end="${num}" var="i">
                    <li class="page-item">
                        <c:choose>
                            <c:when test="${page == i}">
                                <span class="page-link">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a class="page-link" href="homecontroll?page=${i}" style="color: black">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </c:forEach>
                <li class="page-item">
                    <c:choose>
                        <c:when test="${page < num}">
                            <a class="page-link" href="homecontroll?page=${page + 1}" style="color: black">&raquo;</a>
                        </c:when>
                        <c:otherwise>
                            <span class="page-link disabled">&raquo;</span>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>


    </div>
</div>
<div class="row justify-content-center">
    <div class="col-md-6 text-center"><h4 style="color: #333333">DISCOVER</h4></div>
</div>

<!--            phân loại-->
<div class="row">
    <div class="col-md-3">
        <div class="card mb-4 shadow-sm">
            <a href="category?cid=1">
                <img src="https://www.hamiltonwatch.com/media/wysiwyg/categories_slider/mens-watches/default.jpg" class="card-img-top" alt="Men">
                <div class="card-body">
                    <p class="card-text">FOR MEN</p>
                </div>
            </a>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card mb-4 shadow-md">
            <a href="category?cid=2">
                <img src="https://www.hamiltonwatch.com/media/wysiwyg/categories_slider/women-watches/default.jpg" class="card-img-top" alt="Women">
                <div class="card-body">
                    <p class="card-text">FOR WOMEN</p>
                </div>
            </a>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card mb-4 shadow-md">
            <a href="category?cid=3">
                <img src="https://www.hamiltonwatch.com/media/wysiwyg/categories_slider/cinema-watches/default.jpg" class="card-img-top" alt="Cinemas">
                <div class="card-body">
                    <p class="card-text">CINEMA</p>
                </div>
            </a>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card mb-4 shadow-md">
            <a href="category?cid=4">
                <img src="https://www.hamiltonwatch.com/media/wysiwyg/categories_slider/pilot-watches/default.jpg" class="card-img-top" alt="Pilot type">
                <div class="card-body">
                    <p class="card-text">PILOT</p>
                </div>
            </a>
        </div>
    </div>
</div>


<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>




