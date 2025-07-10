<%-- 
    Document   : rating
    Created on : 4 Jul 2025, 7:06:24 AM
    Author     : Dai Minh Nhu - CE190213
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set var="theReviewAddition" value="It is"/>

<%@include file="/WEB-INF/include/header.jsp" %>
<main>
    <div class="container">

        <h2>Reviews List</h2>

        <%--<p class="text-end">
            <a href="<c:url value="sale?view=create">
                   <c:param name="view" value="create"/>
               </c:url>" class="btn btn-success">Add New</a>
        </p>--%>

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

    <div class="album py-5 bg-light">
        <div class="container">
            
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div class="col-12">
                    <div class="card shadow-sm">
                        <div class="card-body d-flex align-items-center mb-3">
                            <img src="https://media.vov.vn/sites/default/files/styles/large/public/2025-03/1401779-4335.jpg" class="rounded me-3 img-fluid" width="10%" alt="User" />
                            <div>
                                <h6 class="mb-0">Item: Đầu đạn ABC</h6>
                                <small class="text-muted">User: k*****7 - ⭐</small>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="card-text">Tên lửa lỏ quá :((((</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
<!--                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>-->
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Remove</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
                             role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                                                                                dy=".3em">Thumbnail</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-muted">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
                             role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                                                                                dy=".3em">Thumbnail</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-muted">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
                             role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                                                                                dy=".3em">Thumbnail</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-muted">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
                             role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                                                                                dy=".3em">Thumbnail</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-muted">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
                             role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                                                                                dy=".3em">Thumbnail</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-muted">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
                             role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                                                                                dy=".3em">Thumbnail</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-muted">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
                             role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                                                                                dy=".3em">Thumbnail</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-muted">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
                             role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                                                                                dy=".3em">Thumbnail</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-muted">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="/WEB-INF/include/footer.jsp" %>
