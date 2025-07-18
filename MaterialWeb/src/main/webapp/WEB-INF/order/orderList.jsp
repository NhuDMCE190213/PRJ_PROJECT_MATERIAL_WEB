<%@ page import="java.util.*, model.OrderItem" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/include/header.jsp" %>

<div class="container mt-4">
    <h2 class="mb-3">Danh sách đơn hàng</h2>
<%
    List<OrderItem> orderList = (List<OrderItem>) request.getAttribute("orderList");
    if (orderList == null || orderList.isEmpty()) {
%>
    <div class="alert alert-info">Chưa có đơn hàng nào.</div>
<%
    } else {
%>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Đơn giá</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Thành tiền</th>
                    <th scope="col">Trạng thái</th> <!-- Thêm cột trạng thái -->
                </tr>
            </thead>
            <tbody>
<%
        for (OrderItem item : orderList) {
%>
                <tr>
                    <td><%= item.getProductName() %></td>
                    <td><%= String.format("%,d VND", item.getPrice()) %></td>
                    <td><%= item.getQuantity() %></td>
                    <td><%= String.format("%,d VND", item.getPrice() * item.getQuantity()) %></td>
                </tr>
<%
        }
%>


            </tbody>
        </table>
    </div>
<%
    }
%>
</div>

<%@include file="/WEB-INF/include/footer.jsp" %>
