<%@ page import="java.util.*, model.OrderItem" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/include/header.jsp" %>
<%
    List<OrderItem> orderList = (List<OrderItem>) request.getAttribute("orderList");
    if (orderList == null || orderList.isEmpty()) {
%>
        <p>Chưa có đơn hàng nào.</p>
<%
    } else {
%>
        <table border="1">
            <tr>
                <th>Tên sản phẩm</th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
            </tr>
<%
        for (OrderItem item : orderList) {
%>
            <tr>
                <td><%= item.getProductName() %></td>
                <td><%= item.getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td><%= item.getPrice() * item.getQuantity() %></td>
            </tr>
<%
        }
    }
%>
<%@include file="/WEB-INF/include/footer.jsp" %>