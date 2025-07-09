<%-- 
    Document   : rating
    Created on : 4 Jul 2025, 7:06:24 AM
    Author     : Dai Minh Nhu - CE190213
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set var="ratingAddition" value="It is"/>

<%@include file="/WEB-INF/include/header.jsp" %>
<main>
    <div class="container">
        
        <h2>Danh sách Sale</h2>

        <p class="text-end">
            <a href="<c:url value="sale?view=create">
                   <c:param name="view" value="create"/>
               </c:url>" class="btn btn-success">Add New</a>
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
                            <tr style="color: ${(sale.availableSale)?"green":"red"}">
                                <th>${sale.id}</th>
                                <td>${sale.name}</td>
                                <td>${sale.currentDiscount}</td>
                                <td>${sale.currentAmount}</td>
                                <td>${sale.dateStart}</td>
                                <td>${sale.dateEnd}</td>
                                <td>
                                    <a href="<c:url value="sale">
                                           <c:param name="view" value="edit"/>
                                           <c:param name="id" value="${sale.id}"/>
                                       </c:url>" class="btn btn-primary">
                                        Edit
                                    </a>
                                    <a href="<c:url value="sale">
                                           <c:param name="view" value="delete"/>
                                           <c:param name="id" value="${sale.id}"/>
                                       </c:url>" class="btn btn-danger">
                                        Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item ${(param.page <= 1)?"disabled":""}">
                    <a class="page-link" href="<c:url value="/sale">
                           <c:param name="view" value="list"/>
                           <c:param name="page" value="${param.page - 1}"/>
                       </c:url>" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach begin="1" end="${requestScope.totalPages}" var="i">
                    <li class="page-item ${(param.page == i)?"active":""}">
                        <a class="page-link" href="<c:url value="/sale">
                               <c:param name="view" value="list"/>
                               <c:param name="page" value="${i}"/>
                           </c:url>">${i}</a></li>
                    </c:forEach>
                <li class="page-item ${(requestScope.totalPages <= param.page)?"disabled":""}">
                    <a class="page-link" href="<c:url value="/sale">
                           <c:param name="view" value="list"/>
                           <c:param name="page" value="${param.page + 1}"/>
                       </c:url>" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
        
                <%--
        <input type="hidden" name="rating" id="rating" value="0"/>

        <c:forEach var="index" begin="1" end="5">
            <i class="bi bi-star star" data-index="${index}" onclick="iRateXStar(${index})"></i>
        </c:forEach> --%>

    </div>
</main>
<%@include file="/WEB-INF/include/footer.jsp" %>
