package controller;

import dao.ProductDao;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao dao = new ProductDao();

        // Xử lý phân trang
        int page = 1;
        int pageSize = 9;

        try {
            String pageParam = request.getParameter("page");
            if (pageParam != null) {
                page = Integer.parseInt(pageParam);
                if (page < 1) page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        List<Product> products = dao.getProductsByPage(page, pageSize);
        int totalProducts = dao.countProducts();
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        // Truyền dữ liệu sang JSP
        request.setAttribute("list", products);
        request.setAttribute("page", page);
        request.setAttribute("totalPages", totalPages);

        // Forward đến trang JSP hiển thị sản phẩm
        request.getRequestDispatcher("/WEB-INF/product/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Không cần xử lý POST trong phân trang
        response.sendRedirect("product");
    }
}
