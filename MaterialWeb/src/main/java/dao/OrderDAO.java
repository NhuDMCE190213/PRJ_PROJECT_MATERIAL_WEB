/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderReport;

/**
 *
 * @author Tieu Gia Huy - CE191594
 */
public class OrderDAO {

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM orders";

        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(query);  ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order o = new Order(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getDate("order_date"),
                        rs.getInt("total_amount"),
                        rs.getString("status")
                );
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<OrderReport> getReportByMonth(int year) {
        List<OrderReport> list = new ArrayList<>();
        String sql = "SELECT MONTH(order_date) AS month, COUNT(*) AS orders, SUM(total_amount) AS revenue "
                + "FROM orders WHERE YEAR(order_date) = ? AND status = 'Hoàn thành' "
                + "GROUP BY MONTH(order_date)";

        try {
            DBContext db = new DBContext();
            ResultSet rs = db.executeSelectionQuery(sql, new Object[]{year});
            while (rs.next()) {
                list.add(new OrderReport(rs.getInt("month"), rs.getInt("orders"), rs.getInt("revenue")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<OrderReport> getReportByQuarter(int year) {
        List<OrderReport> list = new ArrayList<>();
        String sql = "SELECT DATEPART(QUARTER, order_date) AS quarter, COUNT(*) AS orders, SUM(total_amount) AS revenue "
                + "FROM orders WHERE YEAR(order_date) = ? AND status = 'Hoàn thành' "
                + "GROUP BY DATEPART(QUARTER, order_date)";

        try {
            DBContext db = new DBContext();
            ResultSet rs = db.executeSelectionQuery(sql, new Object[]{year});
            while (rs.next()) {
                list.add(new OrderReport(rs.getInt("quarter"), rs.getInt("orders"), rs.getInt("revenue")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
