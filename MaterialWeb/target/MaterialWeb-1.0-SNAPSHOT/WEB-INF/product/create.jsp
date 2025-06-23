<%-- 
    Document   : create
    Created on : Jun 20, 2025, 9:10:54 PM
    Author     : Le Duy Khanh - CE190235
--%>

<%@page import="dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>

<main>
    <div class="container">
        <h1 class="mt-5">Add New Product</h1>
        <form method="post" action="${pageContext.request.contextPath}/product"">
            <table class="table">

                <tr>
                    <td><label for="name">Tên sản phẩm</label></td>
                    <td><input type="text" name="name" id="name" required></td>
                </tr>

                <tr>
                    <td><label for="description">Mô tả</label></td>
                    <td><textarea name="description" id="description" rows="3"></textarea></td>
                </tr>

                <tr>
                    <td><label for="categoryId">ID Danh mục</label></td>
                    <td><input type="number" name="categoryId" id="categoryId" required></td>
                </tr>

                <tr>
                    <td><label for="price">Giá</label></td>
                    <td><input type="number" name="price" id="price" required></td>
                </tr>

                <tr>
                    <td><label for="stockQuantity">Số lượng</label></td>
                    <td><input type="number" name="stockQuantity" id="stockQuantity" required></td>
                </tr>

                <tr>
                    <td><label for="unit">Đơn vị</label></td>
                    <td><input type="text" name="unit" id="unit" required></td>
                </tr>

                <tr>
                    <td><label for="brandName">Thương hiệu</label></td>
                    <td><input type="text" name="brandName" id="brandName"></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <button class="btn btn-outline-dark" type="submit" name="action" value="create">Save</button>
                        <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/product">Cancel</a>
                    </td>
                </tr>

            </table>
        </form>
    </div>
</main>

<%@include file="/WEB-INF/include/footer.jsp" %>
