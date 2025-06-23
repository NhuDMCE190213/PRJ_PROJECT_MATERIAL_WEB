<%-- 
    Document   : view
    Created on : Jun 22, 2025, 12:50:38 PM
    Author     : Le Duy Khanh - CE190235
--%>

<%@page import="model.CartItem"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp"%>
<%
    Cart cart = (Cart) session.getAttribute("cart");
%>

<h2>Giỏ hàng của bạn</h2>

<% if (cart == null || cart.getItems().isEmpty()) { %>
<p>Không có sản phẩm nào trong giỏ hàng.</p>
<% } else { %>
<table border="1" cellpadding="5">
    <tr>
        <th>Sản phẩm</th>
        <th>Số lượng</th>
        <th>Đơn giá</th>
        <th>Thành tiền</th>
        <th>Xóa</th>
    </tr>
    <% for (CartItem item : cart.getItems()) {%>
    <tr>
        <td><%= item.getProduct().getName()%></td>
        <td><%= item.getQuantity()%></td>
        <td><%= item.getProduct().getPrice()%></td>
        <td><%= item.getTotalPrice()%></td>
        <td>
            <a href="cart?action=remove&id=<%= item.getProduct().getId()%>">Xóa</a>
        </td>

    </tr>
    <% }%>
    <tr>
        <td colspan="3"><b>Tổng cộng:</b></td>
        <td colspan="2"><b><%= cart.getTotal()%></b></td>
    </tr>
    <a href="test.jsp" class="button">← Quay lại danh sách sản phẩm</a>

</table>
<% }%>

<%@include file="/WEB-INF/include/footer.jsp"%>