package controller.forUser;

import controller.*;
import dao.ProductDao;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DisplayServlet", urlPatterns = {"/display"})
public class DisplayServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao dao = new ProductDao();
        String view = request.getParameter("view");
        // Xử lý phân trang
        if (view == null || view.isBlank() || view.equals("list")) {
            int page = 1;
            int pageSize = 9;

            try {
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    page = Integer.parseInt(pageParam);
                    if (page < 1) {
                        page = 1;
                    }
                }
            } catch (NumberFormatException e) {
                page = 1;
            }
            String keyword = request.getParameter("keyword");
            List<Product> products;
            int totalProducts;

            if (keyword != null && !keyword.trim().isEmpty()) {
                products = dao.searchByName(keyword, page, pageSize);
                totalProducts = dao.countByKeyword(keyword);
                request.setAttribute("keyword", keyword); // để hiển thị lại trong ô tìm kiếm
            } else {
                products = dao.getProductsByPage(page, pageSize);
                totalProducts = dao.countProducts();
            }
//            List<Product> products = dao.getProductsByPage(page, pageSize);            
//            int totalProducts = dao.countProducts();

            int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

            // Truyền dữ liệu sang JSP
            request.setAttribute("list", products);
            request.setAttribute("page", page);
            request.setAttribute("totalPages", totalPages);

            // Forward đến trang JSP hiển thị sản phẩm
            request.getRequestDispatcher("/WEB-INF/product/forUser/list.jsp").forward(request, response);
        } else if (view.equals("detail")) {
            String idRaw = request.getParameter("id"); 
                       
            try {
                int id = Integer.parseInt(idRaw);
                Product product = dao.getById(id);
      
                
                if (product != null) {
                    request.setAttribute("product", product);
                
                    request.getRequestDispatcher("/WEB-INF/product/forUser/detail.jsp").forward(request, response);
                } else {
                    response.getWriter().println("Không tìm thấy sản phẩm.");
                }
            } catch (NumberFormatException e) {
                response.getWriter().println("ID không hợp lệ.");
            }
        } else {
            response.getWriter().println("Tham số 'view' không hợp lệ.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if ("detail".equals(action)) {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            int price = Integer.parseInt(request.getParameter("price"));
            int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
            String unit = request.getParameter("unit");
            String brandName = request.getParameter("brandName");

            Product product = new Product(0, name, description, categoryId, price, stockQuantity, unit, brandName);
            ProductDao dao = new ProductDao();
            dao.insert(product); // bạn phải có phương thức insert phù hợp

            response.sendRedirect(request.getContextPath() + "/display?view=list");

       
    

        }}
}
