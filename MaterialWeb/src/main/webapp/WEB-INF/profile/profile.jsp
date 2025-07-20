        <%-- 
            Document   : profile
            Created on : Jun 23, 2025, 1:31:07 PM
            Author     : Tieu Gia Huy - CE191594
        --%>

        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@include file="/WEB-INF/include/header.jsp" %>

        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow border-0">
                        <div class="card-header bg-success text-white">
                            <h4 class="mb-0">Profile</h4>
                        </div>
                        <div class="card-body">

                            <!-- Nếu không có user -->
                            <c:if test="${empty user}">
                                <div class="alert alert-danger">No find user.</div>
                            </c:if>

                            <!-- Nếu có user -->
                            <c:if test="${not empty user}">
<!--                                <p><strong>User:</strong> ${user.fullName}</p>-->
                                <p><strong>Name:</strong> ${user.fullName}</p>
                                <p><strong>Email:</strong> ${user.email}</p>
                                <p><strong>Phone:</strong> ${user.phonenumbers}</p>

                                <a href="profile?view=editProfile" class="btn btn-outline-primary mt-3">Edit Profile</a>
    <!--                            <a href="OrderList" class="btn btn-outline-primary mt-3">List Order</a>-->
                            </c:if>
                            <c:if test="${not empty sessionScope.message}">
                                <div class="alert alert-success">${sessionScope.message}</div>
                                <c:remove var="message" scope="session" />
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/WEB-INF/include/footer.jsp" %>