<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/include/header.jsp" %>

<main class="container mt-4">
    <h2 class="mb-3">Xác nhận mua hàng</h2>

    <table class="table table-bordered">
        <tr><th>Tên sản phẩm:</th><td>${product.name}</td></tr>
        <tr><th>Giá:</th><td>${product.price}</td></tr>
        <tr><th>Số lượng mua:</th><td>${quantity}</td></tr>
        <tr><th>Thành tiền:</th><td>${product.price * quantity} VND</td></tr>
    </table>

    <div class="d-flex gap-2">
        <form method="post" action="${pageContext.request.contextPath}/confirmBuy">
            <input type="hidden" name="productId" value="${product.id}" />
            <input type="hidden" name="quantity" value="${quantity}" />
            <button class="btn btn-success" type="submit">Confirm</button>
        </form>

        <form method="post" action="${pageContext.request.contextPath}/carts">
            <input type="hidden" name="id" value="${product.id}" />
            <input type="hidden" name="orderNumbers" value="${quantity}" />
            <input type="hidden" name="action" value="addToCart" />
            <button class="btn btn-warning" type="submit">Add to Cart</button>
        </form>

        <a href="${pageContext.request.contextPath}/display?view=list" class="btn btn-secondary">Cancel</a>
    </div>
</main>

<%@include file="/WEB-INF/include/footer.jsp" %>
