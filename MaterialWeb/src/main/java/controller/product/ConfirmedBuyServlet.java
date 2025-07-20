/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.product;

import dao.OrderDAO;
import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;
import model.User;

/**
 *
 * @author Huynh Thai Duy Phuong - CE190603 
 */
@WebServlet(name="ConfirmedBuyServlet", urlPatterns={"/confirmBuy"})
public class ConfirmedBuyServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConfirmedBuyServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmedBuyServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession();
    User currentUser = (User) session.getAttribute("user");

    String[] productIds = request.getParameterValues("productIds");
    String[] quantities = request.getParameterValues("quantities");

    if (productIds == null || quantities == null || productIds.length != quantities.length) {
        response.sendRedirect(request.getContextPath() + "/carts");
        return;
    }

    ProductDao productDao = new ProductDao();
    OrderDAO dao = new OrderDAO();
    int total = 0;

    // First: Calculate total
    for (int i = 0; i < productIds.length; i++) {
        int pid = Integer.parseInt(productIds[i]);
        int qty = Integer.parseInt(quantities[i]);

        Product p = productDao.getById(pid);
        total += p.getPrice() * qty;
    }

    // Insert order
    int orderId = dao.insertOrder(currentUser.getUserid(), total);

    // Insert order items
    for (int i = 0; i < productIds.length; i++) {
        int pid = Integer.parseInt(productIds[i]);
        int qty = Integer.parseInt(quantities[i]);

        Product p = productDao.getById(pid);
        dao.insertOrderItem(orderId, pid, qty, p.getPrice());
    }

    response.sendRedirect("order");
}


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
