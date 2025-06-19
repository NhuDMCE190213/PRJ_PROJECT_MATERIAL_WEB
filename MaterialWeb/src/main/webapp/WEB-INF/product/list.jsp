<%-- 
    Document   : list
    Created on : Jun 19, 2025, 8:38:02 PM
    Author     : Le Duy Khanh - CE190235
--%>

<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta charset="UTF-8">
        <title>Danh sách sản phẩm</title>
    </head>
    <body>
        <h2>Danh sách sản phẩm</h2>
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Tên SP</th>
                <th>Mô tả</th>
                <th>Danh mục</th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th>Đơn vị</th>
                <th>Thương hiệu</th>
            </tr>
            <%
                List<Product> list = (List<Product>) request.getAttribute("list");
                if (list != null && !list.isEmpty()) {
                    for (Product p : list) {
            %>
            <tr>
                <td><%= p.getId()%></td>
                <td><%= p.getName()%></td>
                <td><%= p.getDescription()%></td>
                <td><%= p.getCategoryId()%></td>
                <td><%= p.getPrice()%></td>
                <td><%= p.getStockQuantity()%></td>
                <td><%= p.getUnit()%></td>
                <td><%= p.getBrandName()%></td>
            </tr>
            <%
                } // đóng for
            } else {
            %>
            <tr>
                <td colspan="8" style="color:red;">Không có dữ liệu để hiển thị.</td>
            </tr>
            <%
                } // đóng if
%>
        </table>
    </body>
</html>
