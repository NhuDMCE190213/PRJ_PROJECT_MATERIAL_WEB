<%-- 
    Document   : report-result
    Created on : Jul 12, 2025, 6:36:49 PM
    Author     : Tieu Gia Huy - CE191594
--%>

<%@ page import="java.util.*, model.*" %>
<%@include file="/WEB-INF/include/header.jsp" %>
<%
    List<OrderReport> orders = (List<OrderReport>) request.getAttribute("orderReports");
    List<ProductReport> products = (List<ProductReport>) request.getAttribute("productReports");
%>
<html>
    <body>
        <% if (orders != null) { %>
        <h2>K?t qu? th?ng k� ??n h�ng</h2>
        <table border="1">
            <tr><th>Th�ng/Qu�</th><th>S? ??n</th><th>Doanh thu</th></tr>
                    <% for (OrderReport o : orders) {%>
            <tr><td><%= o.period%></td><td><%= o.orders%></td><td><%= o.revenue%></td></tr>
            <% } %>
        </table>
        <% } else if (products != null) { %>
        <h2>Top s?n ph?m b�n ch?y</h2>
        <table border="1">
            <tr><th>ID S?n ph?m</th><th>S? l??ng</th><th>Doanh thu</th></tr>
                    <% for (ProductReport p : products) {%>
            <tr><td><%= p.productId%></td><td><%= p.quantity%></td><td><%= p.revenue%></td></tr>
            <% } %>
        </table>
        <% } else { %>
        <p>Kh�ng c� d? li?u</p>
        <% }%>
    </body>
</html>
<%@include file="/WEB-INF/include/footer.jsp" %>
