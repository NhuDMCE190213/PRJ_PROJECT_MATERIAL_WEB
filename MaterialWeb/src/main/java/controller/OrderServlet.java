package controller;

import dao.OrderDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.OrderItem;
import model.User; // model User bạn cần có

@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String view = request.getParameter("view");
        String namePage = "";

        if (view == null || view.equals("") || view.equalsIgnoreCase("order")) {
            namePage = "orderList";

            // ✅ Lấy danh sách đơn hàng từ DB
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("user");

            if (currentUser != null) {
                OrderDAO dao = new OrderDAO();
                List<OrderItem> orderList = dao.getOrderItemsByUserId(currentUser.getUserid());
                request.setAttribute("orderList", orderList);
            } else {
                response.sendRedirect("login");
                return;
            }

        } else if (view.equalsIgnoreCase("orderDetail")) {
            namePage = "orderDetail";
        }

        request.getRequestDispatcher("/WEB-INF/order/" + namePage + ".jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        int price = Integer.parseInt(request.getParameter("price"));
        String unit = request.getParameter("unit");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        OrderItem item = new OrderItem(productId, productName, price, unit, quantity);

        HttpSession session = request.getSession();
        List<OrderItem> orderList = (List<OrderItem>) session.getAttribute("orderList");
        if (orderList == null) {
            orderList = new java.util.ArrayList<>();
        }
        orderList.add(item);
        session.setAttribute("orderList", orderList);

        response.sendRedirect("order"); // Chuyển về trang đơn hàng
    }

    @Override
    public String getServletInfo() {
        return "OrderServlet handles viewing and storing orders.";
    }
}
