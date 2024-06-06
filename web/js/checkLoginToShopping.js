// custom.js

function checkLoginClickPrice(productId) {
    if (isLoggedIn) {
        // Nếu đã đăng nhập, thực hiện hành động thêm vào giỏ hàng
        window.location.href = "addandcart?productId=" + productId;
    } else {
        // Nếu chưa đăng nhập, hiển thị thông báo yêu cầu đăng nhập
        alert("Please login to shopping!");
        // Hoặc hiển thị một modal yêu cầu đăng nhập
        // Ví dụ: $('#loginModal').modal('show');
    }
}

function checkLoginAndAddToCart(productId) {
    if (isLoggedIn) {
        // Nếu đã đăng nhập, thực hiện hành động thêm vào giỏ hàng
        window.location.href = "addcart?productId=" + productId;
    } else {
        // Nếu chưa đăng nhập, hiển thị thông báo yêu cầu đăng nhập
        alert("Please login to shopping!");
        // Hoặc hiển thị một modal yêu cầu đăng nhập
        // Ví dụ: $('#loginModal').modal('show');
    }
}


