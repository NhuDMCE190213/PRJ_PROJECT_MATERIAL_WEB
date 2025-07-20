<%-- 
    Document   : detail
    Created on : Jun 21, 2025, 11:31:44 AM
    Author     : Le Duy Khanh - CE190235
--%>

<%@page import="constant.CommonFunction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="vnd" uri="http://example.com/common" %>

<c:set var="theReviewAddition" value="It is"/>

<%@include file="/WEB-INF/include/header.jsp" %>

<main>
    <div class="container">
        <c:if test="${not empty product.image}">
            <img src="${pageContext.request.contextPath}/assets/images/${product.image}" 
                 alt="${product.name}" class="img-fluid mb-3" style="max-height: 300px;" />
        </c:if>

        <h1 class="mt-3"></h1>
        <form method="post" action="${pageContext.request.contextPath}/carts">
            <input type="hidden" name="id" value="${product.id}" />
            <input type="hidden" name="action" value="addToCart" />

            <table class="table table-striped ">

                <tr>
                    <th><label for="id">ID</label></th>
                    <td>${product.id}</td>
                </tr>

                <tr>
                    <th><label for="name">Tên sản phẩm</label></th>
                    <td>${product.name}</td>
                </tr>

                <tr>
                    <th><label for="description">Mô tả</label></th>
                    <td>${product.description}</td>
                </tr>

                <tr>
                    <th><label for="categoryId">Danh mục</label></th>
                    <td>
                        <c:forEach var="c" items="${categories}">
                            <c:if test="${c.id == product.categoryId}">
                                ${c.name}
                            </c:if>
                        </c:forEach>
                    </td>
                </tr>


                <tr>
                    <th><label for="price">Giá</label></th>
                    <td>${vnd:toVND(product.price)}</td>
                </tr>

                <tr>
                    <th><label for="stockQuantity">Số lượng hiện có</label></th>
                    <td>
                        <c:choose>
                            <c:when test="${product.stockQuantity <= 0}">
                                <strong style="color: red;">Hết hàng</strong>
                            </c:when>
                            <c:otherwise>
                                ${product.stockQuantity}
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>


                <tr>
                    <th><label for="unit">Đơn vị</label></th>
                    <td>${product.unit}</td>
                </tr>

                <tr>
                    <th><label for="brandName">Thương hiệu</label></th>
                    <td>${product.brandName}</td>
                </tr>
                <c:if test="${product.stockQuantity > 0}">
                    <tr>
                        <th><label for="orderNumbers">Số lượng mua</label></th>
                        <td>
                            <input class="form-control  border-info" name="orderNumbers"  id="orderNumbers" type="number" required>

                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                            </c:if>

                        </td>
                    </tr>
                </c:if>
                    <tr>
                        <td></td>
                        <td>

<c:if test="${product.stockQuantity > 0}">
                            <button class="btn btn-warning " type="submit" name="action" value="detail">Add to Cart</button>
                        </c:if>
                       
                        <a class="btn btn-dark " href="${pageContext.request.contextPath}/display?view=list"><<< Back</a>
                    </td>
                </tr>

            </table>
        </form>
</main>

<%@include file="/WEB-INF/theReview/listProductDetail.jsp" %>             

<%@include file="/WEB-INF/include/footer.jsp" %>
