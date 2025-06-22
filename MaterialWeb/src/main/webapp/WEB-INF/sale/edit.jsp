<%-- 
    Document   : remove
    Created on : 21 Jun 2025, 4:58:35 PM
    Author     : Dai Minh Nhu - CE190213
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<c:set var="currentSale" value="${salesList[param.index * 1]}"/>

<main>

    <div class="container">
        <h1 class="mt-5">Edit a Sale</h1>
        <form method="post" action="<c:url value="sale">
                  <c:param name="id" value="${currentSale.id}"/>  
              </c:url>">
            <table class="table">
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>

                <tr>
                    <th>
                        <label for="id">ID</label>
                    </th>
                    <td>
                        ${currentSale.id}
                    </td>
                </tr>

                <tr>
                    <th>
                        <label for="name">Tên Sale</label>
                    </th>
                    <td>
                        <input  type="text" name="name" id="name" value="${currentSale.name}">
                    </td>
                </tr>

                <tr>
                    <th>
                        <label for="discount">Giảm giá</label>
                    </th>
                    <td>
                        <input type="number" name="discount" id="discount" value="${currentSale.currentDiscount}">
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="typeOfDiscount">Loại giảm giá</label>
                    </td>
                    <td>
                        <select name="typeOfDiscount">
                            <option value="0" ${(currentSale.typeOfDiscount == 0)? "selected": ""}>Percent</option>
                            <option value="1" ${(currentSale.typeOfDiscount == 1)? "selected": ""}>Direct</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <th>
                        <label for="amount">Số lượng</label>
                    </th>
                    <td>
                        <input  type="number" name="amount" id="amount" value="${currentSale.amount}">
                    </td>
                </tr>

                <c:if test="${currentSale.coHanSuDung}">
                    <tr>
                        <th>
                            <label for="dateStart">Ngày bắt đầu</label>
                        </th>
                        <td>
                            ${currentSale.dateStart}
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <label for="dateEnd">Ngày kết thúc</label>
                        </th>
                        <td>
                            ${currentSale.dateEnd}
                        </td>
                    </tr>
                </c:if>


                <tr>
                    <td>
                    </td>
                    <td>
                        <button class="btn btn-outline-dark" type="submit" name="action" value="remove">Save</button>
                        <a class="btn btn-outline-dark" href="<c:url value="sale"/>">Cancel</a>
                    </td>
                </tr>
            </table>
        </form>

    </div>

</main>
<%@include file="/WEB-INF/include/footer.jsp" %>
