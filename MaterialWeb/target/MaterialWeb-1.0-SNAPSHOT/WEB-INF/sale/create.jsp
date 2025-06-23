<%-- 
    Document   : create
    Created on : 20 Jun 2025, 10:03:41 PM
    Author     : Dai Minh Nhu - CE190213
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<main>

    <div class="container">
        <h1 class="mt-5">Add new Sale</h1>
        <form method="post" action="<c:url value="sale"/>">
            <table class="table">
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="name">Tên Sale</label>
                    </td>
                    <td>
                        <input  type="text" name="name"  id="name" class="form-control" required>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="discount">Giảm giá</label>
                    </td>
                    <td>
                        <input type="number" name="discount" id="discount" class="form-control" required>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="typeOfDiscount">Loại giảm giá</label>
                    </td>
                    <td>
                        <select name="typeOfDiscount" class="form-select" required>
                            <option value="0">Percent</option>
                            <option value="1">Direct</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="amount">Số lượng</label>
                    </td>
                    <td>
                        <input type="number" name="amount" id="amount" class="form-control" required>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="coHanSuDung">Có hạn sử dụng</label>
                    </td>
                    <td>
                        <input type="checkbox" name="coHanSuDung" checked class="form-check"/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="dateStart">Ngày bắt đầu</label>
                    </td>
                    <td>
                        <input type="datetime-local" name="dateStart" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="dateEnd">Ngày kết thúc</label>
                    </td>
                    <td>
                        <input type="datetime-local" name="dateEnd"/>
                    </td>
                </tr>

                <tr>
                    <td>
                    </td>
                    <td>
                        <button class="btn btn-outline-dark" type="submit" name="action" value="create">Save</button>
                        <!--<input type="submit" value="Cancel" name="Cancel">-->
                        <a class="btn btn-outline-dark" href="<c:url value="sale"/>">Cancel</a>
                    </td>
                </tr>
            </table>
        </form>

    </div>

</main>
<%@include file="/WEB-INF/include/footer.jsp" %>
