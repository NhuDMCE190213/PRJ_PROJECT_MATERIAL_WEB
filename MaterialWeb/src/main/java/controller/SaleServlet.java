/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Sale;

/**
 *
 * @author Dai Minh Nhu - CE190213
 */
@WebServlet(name = "SaleServlet", urlPatterns = {"/sale"})
public class SaleServlet extends HttpServlet {

    SaleDAO saleDAO = new SaleDAO();

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
            out.println("<title>Servlet SaleServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleServlet at " + request.getContextPath() + "</h1>");
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

        List<Sale> salesList = saleDAO.getAll();
        request.setAttribute("salesList", salesList);

        String view = request.getParameter("view");

        String namePage = "";

        if (view == null || view.equals("") || view.equalsIgnoreCase("list")) {
            namePage = "list";
        } else if (view.equalsIgnoreCase("create")) {
            namePage = "create";
        } else if (view.equalsIgnoreCase("delete")) {
            namePage = "remove";
        }

        request.getRequestDispatcher("/WEB-INF/sale/" + namePage + ".jsp").forward(request, response);
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

//        Sale sale = new Sale(0, name, discount, typeOfDiscount, amount, coHanSuDung, dateStart, dateEnd);
//        System.out.println(sale);
        String action = request.getParameter("action");
        if (action != null && !action.isEmpty()) {

            if (action.equalsIgnoreCase("create")) {
                String name = request.getParameter("name");
                int discount = Integer.parseInt(request.getParameter("discount"));
                int typeOfDiscount = Integer.parseInt(request.getParameter("typeOfDiscount"));
                int amount = Integer.parseInt(request.getParameter("amount"));
                boolean coHanSuDung = request.getParameter("coHanSuDung") != null;
                String dateStart = "";
                String dateEnd = "";
                if (coHanSuDung) {
                    dateStart = request.getParameter("dateStart");
                    dateEnd = request.getParameter("dateEnd");
                }

                // chua co check cac dieu kien
                if (name != null && !name.isEmpty()) {
                    if (saleDAO.create(name, discount, typeOfDiscount, amount, coHanSuDung, dateStart, dateEnd) >= 1) {
                        System.out.println("Creating a new sale successful");
                    } else {
                        System.out.println("Creation successful");
                    }
                }
            } else if (action.equalsIgnoreCase("remove")) {
                int id = Integer.parseInt(request.getParameter("id"));
                saleDAO.remove(id);
            } else if (action.equalsIgnoreCase("edit")) {
                String name = request.getParameter("name");
//                int id = Integer.parseInt(action[1]);
                int id = Integer.parseInt(request.getParameter("id"));

//                saleDAO.update(id, name);
            }
        }

        response.sendRedirect(request.getContextPath() + "/sale");
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
