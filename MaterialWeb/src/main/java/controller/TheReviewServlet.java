/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static constant.CommonFunction.getTotalPages;
import static constant.CommonFunction.isEmptyString;
import dao.TheReviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.TheReview;

/**
 *
 * @author Dai Minh Nhu - CE190213
 */
@WebServlet(name = "TheReviewServlet", urlPatterns = {"/theReview"})
public class TheReviewServlet extends HttpServlet {

    TheReviewDAO theReviewDAO = new TheReviewDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RatingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RatingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String view = request.getParameter("view");

        int page = 1;
        int totalPages = 0;

        String namePage = "";

        String productId_str = request.getParameter("pId");
        String userId_str = request.getParameter("uId");

        if (view == null || view.equals("") || view.equalsIgnoreCase("list")) {
            namePage = "list";

            String pageParam = request.getParameter("page");
            if (pageParam != null && Integer.parseInt(pageParam) > 1) {
                page = Integer.parseInt(pageParam);
            }

            List<TheReview> reviewList;
            int countItems;
            if (!isEmptyString(productId_str)) {
                int productId = Integer.parseInt(productId_str);
                countItems = theReviewDAO.countItem_toProduct(productId);

                reviewList = theReviewDAO.getAll_toProduct(productId, page);
            } else if (!isEmptyString(userId_str)) {
                int userId = Integer.parseInt(userId_str);
                countItems = theReviewDAO.countItem_toUser(userId);

                reviewList = theReviewDAO.getAll_toUser(userId, page);
            } else {
                countItems = theReviewDAO.countItem();
                reviewList = theReviewDAO.getAll(page);
            }

            totalPages = getTotalPages(countItems);

            if (page > totalPages) {
                page = totalPages;
            }

            request.setAttribute("totalPages", totalPages);

//            List<TheReview> reviewList = theReviewDAO.getAll(page);
            request.setAttribute("reviewList", reviewList);

        } else if (view.equalsIgnoreCase("create")) {
//            namePage = "create";
        } else if (view.equalsIgnoreCase("delete")) {
//            int id = Integer.parseInt(request.getParameter("id"));
//            request.setAttribute("currentSale", saleDAO.getElementByID(id));
//
//            namePage = "remove";
        } else if (view.equalsIgnoreCase("edit")) {
//
//            int id = Integer.parseInt(request.getParameter("id"));
//            request.setAttribute("currentSale", saleDAO.getElementByID(id));
//
//            namePage = "edit";
        }

        request.getRequestDispatcher("/WEB-INF/theReview/" + namePage + ".jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
