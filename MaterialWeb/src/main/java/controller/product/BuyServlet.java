package controller.product;

<<<<<<< HEAD
import constant.Constants;
=======
import dao.CartDao;
>>>>>>> 8f426c72acfdc373c5235b1e91a794eadb19a115
import dao.ProductDao;
import dao.SaleDAO;
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
<<<<<<< HEAD
import model.Sale;
=======
import model.User;
>>>>>>> 8f426c72acfdc373c5235b1e91a794eadb19a115

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
<<<<<<< HEAD
        double calculatedTotal = 0;
=======
        long calculatedTotal = 0; // Use long for price to avoid potential issues with currency precision
>>>>>>> 8f426c72acfdc373c5235b1e91a794eadb19a115

        HttpSession session = request.getSession();

<<<<<<< HEAD
            if (product != null) {
                selectedItems.add(new CartItem(product, quantity));
                calculatedTotal += product.getPrice() * quantity;
=======
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
>>>>>>> 8f426c72acfdc373c5235b1e91a794eadb19a115
            }

            // Cập nhật session cart
            session.setAttribute("cart", cart);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi trong quá trình thanh toán.");
            request.getRequestDispatcher("/carts").forward(request, response);
            return;
        }

        // Xử lý khuyến mãi nếu có
        String saleIdParam = request.getParameter("selectedSaleId");
        double totalAfterDiscount = calculatedTotal;
        Sale selectedSale = null;

        if (saleIdParam != null && !saleIdParam.isEmpty()) {
            try {
                int saleId = Integer.parseInt(saleIdParam);
                SaleDAO saleDao = new SaleDAO();
                selectedSale = saleDao.getElementByID(saleId);

                if (selectedSale != null && selectedSale.isAvailableSale()) {
                    String discountStr = selectedSale.getCurrentDiscount(); // "10%" hoặc "20000"
                    int discountType = selectedSale.getTypeOfDiscount();

                    try {
                        if (discountType == Constants.PERCENT) {
                            if (discountStr.endsWith("%")) {
                                discountStr = discountStr.replace("%", "").trim();
                            }
                            
                            double percent = Double.parseDouble(discountStr);
                            totalAfterDiscount = calculatedTotal * (1 - percent / 100.0);
                        } else if (discountType == Constants.DIRECT) {
                          discountStr = discountStr.replaceAll("[^\\d]", ""); // chỉ giữ số

    double amount = Double.parseDouble(discountStr);
                           System.out.println("Raw discount: " + selectedSale.getCurrentDiscount());
System.out.println("Parsed discount: " + discountStr);
System.out.println("Amount to deduct: " + amount);
                            totalAfterDiscount = calculatedTotal - amount;
                            if (totalAfterDiscount < 0) totalAfterDiscount = 0;
                        }
                    } catch (NumberFormatException e) {
                        totalAfterDiscount = calculatedTotal;
                    }
                }
            } catch (NumberFormatException e) {
                // bỏ qua khuyến mãi không hợp lệ
            }
        }

        // Gửi dữ liệu sang JSP
        request.setAttribute("selectedItems", selectedItems);
        request.setAttribute("selectedSale", selectedSale);
        request.setAttribute("calculatedTotal", totalAfterDiscount);
        request.getRequestDispatcher("/WEB-INF/product/forUser/buy.jsp").forward(request, response);
    }
}
