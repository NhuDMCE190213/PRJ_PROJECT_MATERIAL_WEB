package controller.product;

import dao.CartDao;
import dao.ProductDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CartItem;
import model.Product;
import model.User;

@WebServlet(name = "BuyServlet", urlPatterns = {"/buy"})
public class BuyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String[] selectedIds = request.getParameterValues("selectedProductIds");

        if (selectedIds == null || selectedIds.length == 0) {
            request.setAttribute("error", "Vui lòng chọn ít nhất một sản phẩm để thanh toán.");
            request.getRequestDispatcher("/carts").forward(request, response);
            return;
        }

        ProductDao productDao = new ProductDao();
        CartDao cartDao = new CartDao();
        List<CartItem> selectedItems = new ArrayList<>();
        long calculatedTotal = 0; // Use long for price to avoid potential issues with currency precision

        HttpSession session = request.getSession();

        try {
            int userId = ((User) session.getAttribute("user")).getUserid();
            Cart cart = (Cart) session.getAttribute("cart");

            for (String idStr : selectedIds) {
                int productId = Integer.parseInt(idStr);
                int quantity = Integer.parseInt(request.getParameter("quantity_" + productId));
                Product product = productDao.getById(productId);

                if (product != null) {
                    selectedItems.add(new CartItem(product, quantity));
                    calculatedTotal += (long) product.getPrice() * quantity;

                    // Xóa khỏi database
                    cartDao.removeFromCart(userId, productId);

                    // Xóa khỏi session
                    if (cart != null) {
                        cart.removeItem(productId); // cần có phương thức này trong Cart
                    }
                }
            }

            // Cập nhật session cart
            session.setAttribute("cart", cart);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi trong quá trình thanh toán.");
            request.getRequestDispatcher("/carts").forward(request, response);
            return;
        }

        request.setAttribute("selectedItems", selectedItems);
        request.setAttribute("calculatedTotal", calculatedTotal); // Pass the calculated total to the JSP
        request.getRequestDispatcher("/WEB-INF/product/forUser/buy.jsp").forward(request, response);
    }
}
