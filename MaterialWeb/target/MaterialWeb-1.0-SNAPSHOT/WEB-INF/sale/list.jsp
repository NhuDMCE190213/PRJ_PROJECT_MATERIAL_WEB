<%-- 
    Document   : list2
    Created on : 19 Jun 2025, 8:37:05 PM
    Author     : Dai Minh Nhu - CE190213
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<main>
    <div class="container">

        <h2>Danh sách Sale</h2>

        <p class="text-end">
            <a href="#" class="btn btn-success">Add New</a>
        </p>

        <table class="table table-bordered table-hover text-center">
            <thead>
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
                                <th>${sale.id}</th>
                                <td>${sale.name}</td>
                                <td>${(sale.typeOfDiscount == 1)?"-":""}${sale.discount}${(sale.typeOfDiscount == 0)?"%":""}</td>
                                <td>${(sale.amount < 999999)?("" + sale.amount):"Non-limit"}</td>
                                <td>${sale.dateStart}</td>
                                <td>${sale.dateEnd}</d>
                                <td>
                                    <a href="#" class="btn btn-primary">
                                        Edit
                                    </a>
                                    <a href="#" class="btn btn-danger">
                                        Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>

    </div>
</main>

<%@include file="/WEB-INF/include/footer.jsp" %>
