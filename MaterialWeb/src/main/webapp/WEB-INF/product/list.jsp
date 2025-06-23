<%-- Import necessary classes for Product model and List --%>

<%@page import="model.Product"%>
<%@page import="java.util.List"%>

<%-- Set content type and character encoding for the JSP page --%>
<%@page contentType="text/html;charset=UTF-8" %>
<%-- Debugging output to show current page and total pages --%>
<%= "DEBUG page=" + request.getAttribute("page") + ", totalPages=" + request.getAttribute("totalPages")%>


<!DOCTYPE html>
<html>
    <head>

        <%-- Title of the HTML page --%>
        <title>Sản phẩm</title>
        <%-- Link to Bootstrap CSS for styling --%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <%-- Set background color of the body to light gray --%>
    <body class="bg-light">
        <%@include file="/WEB-INF/include/header.jsp" %>
        <%-- Main container for the page content, with padding --%>
        <div class="container py-5">
            <%-- Page heading --%>
            <h2 class="mb-4 text-center text-primary">Danh sách sản phẩm</h2>
            <div class="text-end mb-3">
                <a href="product?view=create" class="btn btn-success">
                    + Thêm sản phẩm
                </a>
            </div>

            <%-- Row to display product cards --%>
            <div class="row">
                <%
                    // Retrieve the list of products from the request attributes
                    List<Product> list = (List<Product>) request.getAttribute("list");
                    // Check if the list is not null and not empty
                    if (list != null && !list.isEmpty()) {
                        // Loop through each product in the list
                        for (Product p : list) {
                %>
                <%-- Column for a single product card, occupying 4 columns on medium-sized screens and up --%>
                <div class="col-md-4 mb-4">
                    <%-- Card component for displaying product details, with full height and shadow --%>
                    <div class="card h-100 shadow-sm">
                        <%-- Card body for content --%>
                        <div class="card-body">
                            <%-- Product name --%>
                            <h5 class="card-title text-success"><%= p.getName()%></h5>
                            <%-- Product description --%>
                            <p class="card-text"><%= p.getDescription()%></p>
                            <%-- List group for additional product details --%>
                            <ul class="list-group list-group-flush small">
                                <%-- Product category ID --%>
                                <li class="list-group-item">Danh mục: <%= p.getCategoryId()%></li>
                                    <%-- Product price, formatted as Vietnamese Dong --%>
                                <li class="list-group-item">Giá: <strong><%= String.format("%,d VNĐ", p.getPrice())%></strong></li>
                                    <%-- Product stock quantity and unit --%>
                                <li class="list-group-item">Số lượng: <%= p.getStockQuantity()%> <%= p.getUnit()%></li>
                                    <%-- Product brand name --%>
                                <li class="list-group-item">Thương hiệu: <%= p.getBrandName()%></li>
                            </ul>
                            <div "class="mt-3 d-flex justify-content-home gap-2">
                                <a href="product?view=update&id=<%= p.getId()%>" class="btn btn-primary btn-sm">
                                    ✏️ EDIT
                                </a>
                                <a href="product?view=delete&id=<%= p.getId()%>" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xoá sản phẩm này?');">
                                    🗑️ DELETE
                                </a>
                            </div>
                        </div>

                    </div>

                </div>
                <% }
                } else { %>
                <%-- Display a warning if no products are found --%>
                <div class="alert alert-warning text-center">Không có sản phẩm nào.</div>
                <% } %>
            </div>

            <%-- PAGINATION SECTION --%>
            <%
                // Retrieve current page and total pages from request attributes
                Integer currentPage = (Integer) request.getAttribute("page");
                Integer totalPages = (Integer) request.getAttribute("totalPages");
                // Check if total pages exist and are greater than 1 to display pagination
                if (totalPages != null && totalPages > 1) {
            %>
            <%-- Navigation for pagination --%>
            <nav>
                <%-- Unordered list for pagination links, centered --%>
                <ul class="pagination justify-content-center">
                    <%-- Loop to generate pagination links for each page --%>
                    <% for (int i = 1; i <= totalPages; i++) {%>
                    <%-- Pagination item, with 'active' class if it's the current page --%>
                    <li class="page-item <%= (i == currentPage) ? "active" : ""%>">
                        <%-- Link to the product list page with the corresponding page number --%>
                        <a class="page-link" href="product?view=list&page=<%= i%>"><%= i%></a>
                    </li>
                    <% } %>
                </ul>
            </nav>
            <% }%>
        </div>
        <%@include file="/WEB-INF/include/footer.jsp" %>
    </body>
</html>