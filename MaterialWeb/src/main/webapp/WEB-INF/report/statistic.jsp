<%-- 
    Document   : statistic
    Created on : Jul 12, 2025, 6:36:22 PM
    Author     : Tieu Gia Huy - CE191594
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/include/header.jsp" %>
<html>
    <head><title>Báo cáo thống kê</title></head>
    <body>
        <h2>Thống kê</h2>
        <form action="<%=request.getContextPath()%>/StatisticServlet" method="get">

            <label>Loại thống kê:</label>
            <select name="type">
                <option value="order">Đơn hàng</option>
                <option value="product">Sản phẩm bán chạy</option>
            </select><br/>

            <label>Thời gian:</label>
            <select name="period">
                <option value="month">Theo tháng</option>
                <option value="quarter">Theo quý</option>
            </select><br/>

            <label>Năm:</label>
            <input type="number" name="year" value="2025"/><br/>

            <label>Tháng (nếu có):</label>
            <input type="number" name="month" min="1" max="12"/><br/>

            <input type="submit" value="Thống kê"/>
        </form>
    </body>
</html>
<%@include file="/WEB-INF/include/footer.jsp" %>
