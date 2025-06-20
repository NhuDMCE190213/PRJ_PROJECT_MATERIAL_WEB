<%-- 
    Document   : list2
    Created on : 19 Jun 2025, 8:37:05 PM
    Author     : Dai Minh Nhu - CE190213
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>

<h2>Danh sách Sale</h2>
<a href="#">Add New</a>
<table class="table">
    <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Tên Sale</th>
            <th>Giảm giá</th>
            <th>Số lượng</th>
            <th>Thời gian bắt đầu</th>
            <th>Thời gian kết thúc</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${salesList == null || empty salesList}">
                <tr>
                    <td colspan="8" style="color:red;">Không có dữ liệu để hiển thị.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="sale" items="${salesList}" varStatus="loop">
                    <tr>
                        <td>${sale.id}</td>
                        <th>${sale.name}</th>
                        <th>${(sale.typeOfDiscount == 1)?"-":""}${sale.discount}${(sale.typeOfDiscount == 0)?"%":""}</th>
                        <th>${(sale.amount < 999999)?("" + sale.amount):"Non-limit"}</th>
                        <th>${sale.dateStart}</th>
                        <th>${sale.dateEnd}</th>
                        <th>
                            <a href="#">
                                Edit
                            </a>
                            <a href="#">
                                Delete
                            </a>
                        </th>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </tbody>

</table>

<%@include file="/WEB-INF/include/footer.jsp" %>
