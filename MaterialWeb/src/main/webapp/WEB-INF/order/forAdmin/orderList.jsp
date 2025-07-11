<%-- 
    Document   : orderList
    Created on : Jul 11, 2025, 4:52:36 PM
    Author     : Tieu Gia Huy - CE191594
--%>

<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/include/header.jsp" %>
<html>
<head><title>Danh sách đơn hàng</title></head>
<body>
<h2>📋 Danh sách đơn hàng</h2>

<table border="1" cellpadding="8">
    <tr>
        <th>Mã đơn</th>
        <th>Khách hàng</th>
        <th>Ngày đặt</th>
        <th>Tổng tiền</th>
        <th>Trạng thái</th>
        <th>Xem chi tiết</th>
    </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Hoặc driver SQL Server nếu dùng SQL Server
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdb", "user", "password");

        String sql = "SELECT o.id, u.full_name, o.order_date, o.total_amount, o.status " +
                     "FROM orders o JOIN users u ON o.user_id = u.id";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);

        while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("full_name") %></td>
        <td><%= rs.getDate("order_date") %></td>
        <td><%= rs.getInt("total_amount") %></td>
        <td><%= rs.getString("status") %></td>
        <td><a href="orderDetail.jsp?id=<%= rs.getInt("id") %>">Chi tiết</a></td>
    </tr>
<%
        }

        conn.close();
    } catch(Exception e) {
        out.println("Lỗi: " + e.getMessage());
    }
%>
</table>
</body>
</html>
<%@include file="/WEB-INF/include/footer.jsp" %>

