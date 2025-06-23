<%-- 
    Document   : update
    Created on : Jun 21, 2025, 11:31:44 AM
    Author     : Le Duy Khanh - CE190235
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/include/header.jsp" %>

<%
    Product p = (Product) request.getAttribute("product");
%>

<main>
    <div class="container">
        <h1 class="mt-5">UPDATE PRODUCT</h1>
        <form method="post" action="<c:url value='/product'/>">
            <table class="table">

                <tr>
                    <th><label for="id">ID</label></th>
                    <td><input type="text" name="id" id="id" value="<%= p.getId()%>" readonly class="form-control"/></td>
                </tr>

                <tr>
                    <th><label for="name">Tên sản phẩm</label></th>
                    <td><input type="text" name="name" id="name" value="<%= p.getName()%>" required class="form-control"/></td>
                </tr>

                <tr>
                    <th><label for="description">Mô tả</label></th>
                    <td><textarea name="description" id="description" rows="3" class="form-control" required><%= p.getDescription()%></textarea></td>
                </tr>

                <tr>
                    <th><label for="categoryId">ID Danh mục</label></th>
                    <td><input type="number" name="categoryId" id="categoryId" value="<%= p.getCategoryId()%>" required class="form-control"/></td>
                </tr>

                <tr>
                    <th><label for="price">Giá</label></th>
                    <td><input type="number" name="price" id="price" value="<%= p.getPrice()%>" required class="form-control"/></td>
                </tr>

                <tr>
                    <th><label for="stockQuantity">Số lượng</label></th>
                    <td><input type="number" name="stockQuantity" id="stockQuantity" value="<%= p.getStockQuantity()%>" required class="form-control"/></td>
                </tr>

                <tr>
                    <th><label for="unit">Đơn vị</label></th>
                    <td><input type="text" name="unit" id="unit" value="<%= p.getUnit()%>" required class="form-control"/></td>
                </tr>

                <tr>
                    <th><label for="brandName">Thương hiệu</label></th>
                    <td><input type="text" name="brandName" id="brandName" value="<%= p.getBrandName()%>" class="form-control"/></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <button class="btn btn-outline-dark" type="submit" name="action" value="update">Save</button>
                        <a class="btn btn-outline-dark" href="<c:url value='/product?view=list'/>">Cancel</a>
                    </td>
                </tr>

            </table>
        </form>
    </div>
</main>

<%@include file="/WEB-INF/include/footer.jsp" %>