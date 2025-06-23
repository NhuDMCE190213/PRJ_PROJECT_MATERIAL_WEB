<%-- 
    Document   : checkout
    Created on : Jun 22, 2025, 12:58:21 PM
    Author     : Le Duy Khanh - CE190235
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <form action="checkout" method="post">
        Tên: <input type="text" name="name" required><br>
        SĐT: <input type="text" name="phone" required><br>
        Địa chỉ: <input type="text" name="address" required><br>
        <input type="submit" value="Đặt hàng">
    </form>

</html>
