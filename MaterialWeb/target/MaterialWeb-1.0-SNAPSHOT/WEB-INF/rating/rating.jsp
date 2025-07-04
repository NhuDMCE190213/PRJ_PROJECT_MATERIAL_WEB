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

        <input type="hidden" name="rating" id="rating" value="0"/>

        <c:forEach var="index" begin="1" end="5">
            <i class="bi bi-star star" data-index="${index}" onclick="iRateXStar(${index})"></i>
        </c:forEach>

    </div>
</main>
<%@include file="/WEB-INF/include/footer.jsp" %>
