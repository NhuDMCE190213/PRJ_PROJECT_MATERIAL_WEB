<%-- 
    Document   : EditProfile
    Created on : Jun 23, 2025, 1:31:17 PM
    Author     : Tieu Gia Huy - CE191594
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@include file="/WEB-INF/include/header.jsp" %>

<c:if test="${empty user}">
    <div class="alert alert-danger">No find user.</div>
</c:if>

<c:if test="${not empty user}">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow border-0">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Edit Profile</h4>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">${error}</div>
                        </c:if>

                        <form action="profile?view=editProfile" method="post">
                            <div class="mb-3">
                                <label for="fullName" class="form-label">Name</label>
                                <input type="text" id="fullName" name="fullName" class="form-control" value="${user.fullName}" required>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" id="email" name="email" class="form-control" value="${user.email}" required>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" id="password" name="password" class="form-control" value="${user.password}" required>
                            </div>

                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Confirm Password</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                            </div>

                            <div class="d-flex justify-content-between">
                                <button type="submit" class="btn btn-success">Submit</button>
                                <a href="profile" class="btn btn-secondary">Back</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>

<%@include file="/WEB-INF/include/footer.jsp" %>



