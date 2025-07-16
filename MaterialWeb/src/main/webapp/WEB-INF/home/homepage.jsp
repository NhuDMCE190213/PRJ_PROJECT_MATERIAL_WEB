<%-- 
    Document   : homepage
    Created on : Jun 18, 2025, 8:53:53 AM
    Author     : Huynh Thai Duy Phuong - CE190603 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
  <link href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/assets/css/stylesheet.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<!DOCTYPE html>
<html>
    
    <body>
        <main>
	<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>Shop Name <span class="d-block">SE1902 - G2</span></h1>
								<p class="mb-4">Vao ba hai di mua 2 chai nuoc mam xong roi. ve an com ngu toi chieu. Vao ba hai di mua 2 chai nuoc mam xong roi. ve an com ngu toi chieu.</p>
								<p><a href="<%=request.getContextPath()%>/display" class="btn btn-secondary me-2">Shop Now</a><a href="#" class="btn btn-white-outline">Explore</a></p>
							  <!-- Search Bar -->
    <form class="d-flex mt-3" action="<%=request.getContextPath()%>/display" method="get">
  <input class="form-control me-2" type="search" name="keyword" placeholder="Search for products..." required>
  <button class="btn btn-dark" type="submit">Search</button>
</form>

                                                        </div>
						</div>
                                            
						<div class="col-lg-7">
							<div class="hero-img-wrap">
								<img src="https://whataroom.com/cdn/shop/files/alex-sofa_1.webp?v=1748286510&width=800" class="img-fluid">
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
<!-- BEST SELLING SECTION -->
<section class="py-5 bg-light">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="mb-0">Best Selling Products</h2>
      <select class="form-select w-auto" aria-label="Sort products">
        <option selected>All categories</option>
        <option value="1">Type A</option>
        <option value="2">Type B</option>
        <option value="3">Type C</option>
        <option value="4">Type D</option>
      </select>
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
      <!-- Product Card 1 -->
      <div class="col">
        <div class="card h-100">
          <img src="<%=request.getContextPath()%>/assets/img/PSX_20240110_131203.png" class="card-img-top" alt="Product 1">
          <div class="card-body">
            <h5 class="card-title">Product Name 1</h5>
            <p class="card-text text-muted">$19.99</p>
            <a href="#" class="btn btn-sm btn-primary">View Details</a>
          </div>
        </div>
      </div>

      <!-- Product Card 2 -->
      <div class="col">
        <div class="card h-100">
          <img src="<%=request.getContextPath()%>/assets/img/PSX_20240110_131203.png" class="card-img-top" alt="Product 2">
          <div class="card-body">
            <h5 class="card-title">Product Name 2</h5>
            <p class="card-text text-muted">$24.99</p>
            <a href="#" class="btn btn-sm btn-primary">View Details</a>
          </div>
        </div>
      </div>

      <!-- Product Card 3 -->
      <div class="col">
        <div class="card h-100">
          <img src="<%=request.getContextPath()%>/assets/img/PSX_20240110_131203.png" class="card-img-top" alt="Product 3">
          <div class="card-body">
            <h5 class="card-title">Product Name 3</h5>
            <p class="card-text text-muted">$14.99</p>
            <a href="#" class="btn btn-sm btn-primary">View Details</a>
          </div>
        </div>
      </div>

      <!-- Product Card 4 -->
      <div class="col">
        <div class="card h-100">
          <img src="<%=request.getContextPath()%>/assets/img/PSX_20240110_131203.png" class="card-img-top" alt="Product 4">
          <div class="card-body">
            <h5 class="card-title">Product Name 4</h5>
            <p class="card-text text-muted">$29.99</p>
            <a href="#" class="btn btn-sm btn-primary">View Details</a>
          </div>
        </div>
      </div>

    

    </div>
            <!-- Check More Button aligned right -->
   <div class="d-flex justify-content-center align-items-center pt-5">
    <div class="center-box border rounded text-center">

        <a class="btn btn-outline-secondary btn-lg" href="<%=request.getContextPath()%>/display">View All>>></a>
    </div>
  </div>


  </div>
          
</section>
      
<!--------- End top selling---->
<!--sale banne--->
<div class="container-fluid bg-warning text-dark py-4">
  <div class="  container ">
    <div class="row align-items-center">
      <div class="col-md-12 text-center">
        <h2 class="fw-bold ">
       
              Limited Time Offer!
           <img class="default-size" src="<%=request.getContextPath()%>/assets/img/new-star.gif">
        </h2>
        
        <p class="mb-0">
        Get up to 50% off on selected items. Don’t miss out!
        </p>
      </div>
<!--      <div class="col-md-4 text-md-end mt-3 mt-md-0">
        <a href="<%=request.getContextPath()%>/sale" class="btn btn-dark btn-lg">>>></a>
      </div>-->
    </div>
  </div>
</div>
<!---end sale banner-->
<!--------Categories--------->
<div class="container-fluid  text-dark py-0">
  <div class="container text-center">
    <h1 class="fw-bold mt-5 mb-0 bg-light text-dark p-2 border-success d-inline-block">What are you looking for?</h1>
  
  </div>
</div>
<%@ page import="java.util.*, model.Category, dao.CategoriesDao" %>

<%
    CategoriesDao dao = new CategoriesDao();
    List<Category> categories = dao.getAllCategories();
%>

<section class="py-5">
  <div class="container">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
      <% for (Category c : categories) { %>
      <div class="col">
        <a href="${pageContext.request.contextPath}/display?cid=<%= c.getId() %>" class="text-decoration-none">
          <div class="card h-100 text-center border-2 border-dark">
            <div class="card-body">
              <div class="mb-3">
                <i class="bi bi-ui-radios-grid fs-1 text-dark"></i>
              </div>
              <h5 class="card-title text-dark"><%= c.getName() %></h5>
            </div>
          </div>
        </a>
      </div>
      <% } %>
    </div>
  </div>
</section>







        </main> 
                <!-- footer -->
                <%@include file="/WEB-INF/include/footer.jsp" %>
	
    </body>
</html>
