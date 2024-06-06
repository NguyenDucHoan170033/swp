<%-- 
    Document   : Cart
    Created on : Oct 12, 2023, 10:01:00 AM
    Author     : ADMIN
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/csss.css">   
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="shopping-cart">
                <div class="px-4 px-lg-0">

                    <div class="pb-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                    <!-- Shopping cart table -->
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="p-2 px-3 text-uppercase">Items</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase"> Price</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Quantity</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Total amount</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Remove</div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${cart.listCart}" var="o">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="p-2">
                                                            <img src="${o.product.image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${o.product.name}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle"><strong>${o.product.price}</strong></td>
                                                    <td class="align-middle"  >

                                                        <form action="updateitem" method="post">
                                                            <input type="hidden" name="productId" value="${o.product.id}">
                                                            <input type="hidden" name="action" value="increment">
                                                            <button style="width: 30px; height: 30px; font-size: 20px; background: transparent; border: none; cursor: pointer;" type="submit">+</button>
                                                        </form>
                                                        <strong style="font-size: 18px; margin: 0 10px;">${o.quantity}</strong>
                                                        
                                                        <form action="updateitem" method="post">
                                                            <input type="hidden" name="productId" value="${o.product.id}">
                                                            <input type="hidden" name="action" value="decrement">
                                                            <button style="width: 30px; height: 30px; font-size: 20px; background: transparent; border: none; cursor: pointer;" type="submit">-</button>
                                                        </form>



                                                        <%--<a href="#"><button class="btnSub">-</button></a> 
                                                        <strong>${o.quantity}</strong>
                                                        <a href="#"><button class="btnAdd">+</button></a> --%>
                                                    </td>
                                                    <td class="align-middle">
                                                        <strong>${o.getTotal()}</strong>
                                                    </td>
                                                    <td class="align-middle"><a href="deleteitem?did=${o.product.id}" class="text-dark">
                                                            <button type="button" class="btn btn-danger">Delete</button>
                                                        </a>
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>


                        <div> 


                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Total amount</div>
                                    <div class="p-4">
                                        <ul class="list-unstyled mb-4">
                                            <c:set var="totalAmount" value="0" />
                                            <c:forEach items="${cart.listCart}" var="item">
                                                <c:set var="itemTotal" value="${item.getTotal()}" />
                                                <c:set var="totalAmount" value="${totalAmount + itemTotal}" />
                                            </c:forEach>
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total cost</strong><strong>${totalAmount} $</strong></li>
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Shipping</strong><strong>Free ship</strong></li>
                                            <li class="d-flex justify-content-between py-3 border-bottom">
                                                <strong class="text-muted">Total payment</strong>
                                                <h5 class="font-weight-bold">${totalAmount}</h5>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-lg-7">
                                    <div style="width: 50%; margin: auto;">
                                        <form action="checkoutcontrol" method="post">
                                            <!-- Các trường thông tin người dùng -->
                                            <label for="fullName">Full Name:</label>
                                            <input type="text" id="fullName" name="fullName" required><br><br>

                                            <label for="fullName">TelePhone:</label>
                                            <input type="number" id="phonenumber" name="phonenumber" required><br><br>
                                            
                                            <label for="userEmail"> Your Email:</label>
                                            <input type="email" id="userEmail" name="userEmail" required><br><br>

                                            <label for="address">Address:</label>
                                            <textarea id="address" name="address" rows="4" cols="50" required></textarea><br><br>

                                            <!-- Thêm trường ẩn để gửi totalAmount -->
                                            <input type="hidden" name="totalAmount" value="${totalAmount}">

                                            <!-- Nút Check out -->
                                            <div class="text-center">
                                                <input type="submit" name="action" value="Payment" class="btn btn-primary btn-lg"> <!-- Thêm class để tùy chỉnh kiểu nút -->
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>

<!--        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <div class="floating-icon">
        </div>-->
    </body>

</html>
</html>
