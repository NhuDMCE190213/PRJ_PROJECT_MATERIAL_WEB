package controller.forUser;

import dao.ProductDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.Product;

@WebServlet(name = "BuyServlet", urlPatterns = {"/buy"})
public class BuyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String[] selectedIds = request.getParameterValues("selectedProductIds");

        if (selectedIds == null || selectedIds.length == 0) {
            response.sendRedirect(request.getContextPath() + "/carts");
            return;
        }

        ProductDao productDao = new ProductDao();
        List<CartItem> selectedItems = new ArrayList<>();
        double calculatedTotal = 0; // Use double for price to avoid potential issues with currency precision

        for (String idStr : selectedIds) {
            int productId = Integer.parseInt(idStr);
            int quantity = Integer.parseInt(request.getParameter("quantity_" + productId));
            Product product = productDao.getById(productId);

            if (product != null) { // Ensure product exists
                selectedItems.add(new CartItem(product, quantity));
                calculatedTotal += product.getPrice() * quantity;
            }
        }

        request.setAttribute("selectedItems", selectedItems);
        request.setAttribute("calculatedTotal", calculatedTotal); // Pass the calculated total to the JSP
        request.getRequestDispatcher("/WEB-INF/product/forUser/buy.jsp").forward(request, response);
    }
}