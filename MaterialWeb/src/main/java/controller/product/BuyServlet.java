package controller.product;

import constant.Constants;
import dao.ProductDao;
import dao.SaleDAO;
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
import model.Sale;

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
        double calculatedTotal = 0;

        for (String idStr : selectedIds) {
            int productId = Integer.parseInt(idStr);
            int quantity = Integer.parseInt(request.getParameter("quantity_" + productId));
            Product product = productDao.getById(productId);

            if (product != null) {
                selectedItems.add(new CartItem(product, quantity));
                calculatedTotal += product.getPrice() * quantity;
            }
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
