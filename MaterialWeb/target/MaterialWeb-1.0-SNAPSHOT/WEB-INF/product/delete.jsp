<%-- 
    Document   : delete
    Created on : Jun 21, 2025, 12:24:53 PM
    Author     : Le Duy Khanh - CE190235
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/style.css"/>

<%
    Product p = (Product) request.getAttribute("product");
%>

<main>
    <div class="container">
        <h1 class="mt-5 text-danger">Xóa Sản Phẩm</h1>

        <form method="post" action="<c:url value='/product'/>">
            <input type="hidden" name="action" value="delete" />
            <input type="hidden" name="id" value="<%= p.getId()%>" />

            <p>Bạn có chắc chắn muốn xóa sản phẩm này không?</p>

            <table class="table">
                <tr>
                    <th>ID</th>
                    <td><%= p.getId()%></td>
                </tr>
                <tr>
                    <th>Tên sản phẩm</th>
                    <td><%= p.getName()%></td>
                </tr>
                <tr>
                    <th>Mô tả</th>
                    <td><%= p.getDescription()%></td>
                </tr>
                <tr>
                    <th>Giá</th>
                    <td><%= p.getPrice()%></td>
                </tr>
                <tr>
                    <th>Số lượng</th>
                    <td><%= p.getStockQuantity()%></td>
                </tr>
                <tr>
                    <th>Đơn vị</th>
                    <td><%= p.getUnit()%></td>
                </tr>
                <tr>
                    <th>Thương hiệu</th>
                    <td><%= p.getBrandName()%></td>
                </tr>
            </table>

            <button class="btn btn-danger" type="submit">Delete</button>
            <a class="btn btn-secondary" href="<c:url value='/product?view=list'/>">Cancel</a>
        </form>
    </div>
</main>

<%@include file="/WEB-INF/include/footer.jsp" %>
