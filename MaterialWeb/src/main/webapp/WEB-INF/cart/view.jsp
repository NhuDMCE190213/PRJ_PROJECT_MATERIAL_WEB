<%@page import="model.CartItem"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp"%>

<%
    Cart cart = (Cart) request.getAttribute("cart");
%>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f5f5;
        padding: 20px;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 12px 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #007bff;
        color: white;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .total-row {
        font-weight: bold;
        background-color: #e9ecef;
    }

    .btn-remove {
        color: #dc3545;
        text-decoration: none;
        font-weight: bold;
    }

    .btn-remove:hover {
        text-decoration: underline;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #007bff;
        text-decoration: none;
    }

    .back-link:hover {
        text-decoration: underline;
    }
</style>

<h2>🛒 Giỏ hàng của bạn</h2>

<% if (cart == null || cart.getItems().isEmpty()) { %>
<p style="text-align:center; color: #888;">Không có sản phẩm nào trong giỏ hàng.</p>
<% } else { %>

<form method="post" action="${pageContext.request.contextPath}/buy">
    <table>
        <tr>
            <th><input type="checkbox" id="selectAll" onclick="toggleAll(this)"></th>
            <th>Sản phẩm</th>
            <th>Số lượng</th>
            <th>Đơn giá (VNĐ)</th>
            <th>Thành tiền (VNĐ)</th>
            <th>Xóa</th>
        </tr>
        <% for (CartItem item : cart.getItems()) { %>
        <tr>
            <td>
                <input type="checkbox" name="selectedProductIds" value="<%= item.getProduct().getId() %>">
                <input type="hidden" name="quantity_<%= item.getProduct().getId() %>" value="<%= item.getQuantity() %>">
            </td>
            <td><%= item.getProduct().getName() %></td>
            <td><%= item.getQuantity() %></td>
            <td><%= String.format("%,d", item.getProduct().getPrice()) %></td>
            <td><%= String.format("%,d", item.getTotalPrice()) %></td>
            <td>
                <form action="carts" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="decreaseQuantity">
                    <input type="hidden" name="id" value="<%= item.getProduct().getId()%>">
                    <input type="number" name="decreaseAmount" min="1" max="<%= item.getQuantity()%>" value="1" style="width:50px;">
                    <input type="submit" value="Xóa bớt">
                </form>
                <br>
                <a class="btn-remove" href="carts?action=remove&id=<%= item.getProduct().getId()%>">Xóa tất cả</a>
            </td>
        </tr>
        <% } %>

        <tr class="total-row">
            <td colspan="4">Tổng cộng:</td>
            <td colspan="2"><%= String.format("%,d", cart.getTotal()) %> VNĐ</td>
        </tr>
    </table>
</form>
    <div style="text-align: center; margin-top: 20px;">
        <button class="btn btn-success" type="submit">Payment Now!</button>
    </div>


<script>
    function toggleAll(source) {
        const checkboxes = document.querySelectorAll('input[name="selectedProductIds"]');
        checkboxes.forEach(cb => cb.checked = source.checked);
    }
</script>

<% } %>

<a class="back-link" href="${pageContext.request.contextPath}/display?view=list">← Quay lại danh sách sản phẩm</a>

<%@include file="/WEB-INF/include/footer.jsp"%>
