<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>





<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Menu Page</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>

</head>
<!--begin of menu-->
<nav  class="navbar navbar-expand-md navbar-dark" style="background-color: #000000;">
    <div class="container">
        <a class="navbar-brand" href="homecontroll"  style="font-family: 'lobster', sans-serif; font-size: 24px; color: #fff; text-decoration: none; font-style: italic;">
            HAMILTON WATCH
        </a>


        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">

                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><strong> HI ${sessionScope.acc.userName}</strong></a>
                    </li>
                </c:if>
                <c:if test= "${sessionScope.acc.role eq 'ad'}" >
                    <li class="nav-item">
                        <a class="nav-link" href="managercontrol"><strong>MANAGER STORE</strong></a>
                    </li>
                </c:if>
              


                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link"  href="Login.jsp"><strong>LOGIN</strong></a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="logoutcontrol"><strong>LOGOUT</strong></a>
                    </li>
                </c:if>
            </ul>


            <form action="search" method="post" class="form-inline search-form my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input value="${txtS}" name="txt" type="text" class="form-control search-input" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number search-button">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>

            <c:set var="quantity" value="0" />
            <c:if test="${sessionScope.cart != null}">
                <c:forEach items="${sessionScope.cart.listCart}" var="item">
                    <c:set var="quantity" value="${quantity + item.quantity}" />
                </c:forEach>
            </c:if>

            <a class="btn btn-success btn-sm ml-3 cart-button" href="Cart.jsp">
                <i class="fa fa-shopping-cart"></i> Shopping Cart
                <span class="badge badge-light">${quantity}</span>
            </a>


            
        
    </div>
</nav>


<div class="video-wrapper" style="background-color: rgba(0, 0, 0, 0.5);">
    <video autoplay loop muted width="100%" height="30%">
        <source src="NEW Hamilton Dune watches inspired by the prop they designed for the film.mp4" type="video/mp4">
    </video>
</div>
<div class="pagebuilder-collage-content">
    <div class="content-wrapper"  style="background-color: transparent; color: #ffffff;">
        <p class="banner-text" style="font-size: 50px;"><strong>HAMILTON X DUNE</strong></p>
        <p style="font-size: 18px;">Dive into the realm of Dune Part Two <br> with Hamilton's unique creations</p>
            <c:url var="homeURL" value="homecontroll" />
            <c:choose>
                <c:when test="${empty sessionScope.acc}">
                <button onclick="window.location.href = '${homeURL}'" class="pagebuilder-banner-button pagebuilder-button-primary pagebuilder-button-transparent" data-element="button" data-pb-style="GKETQ8W" style="font-size: 24px; background-color: transparent; color: #ffffff; border: 2px solid #ffffff; padding: 10px 20px;">DISCOVER</button>
            </c:when>
        </c:choose>

    </div>
</div>























<!--end of menu-->
