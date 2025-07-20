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
import model.OrderItem;
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

    public int insertOrder(int userId, int total) {
        String sql = "INSERT INTO orders (user_id, total_amount) OUTPUT INSERTED.id VALUES (?, ?)";
        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, total);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public void insertOrderItem(int orderId, int productId, int quantity, int priceAtTime) {
        String sql = "INSERT INTO order_items (order_id, product_id, quantity, price_at_time) VALUES (?, ?, ?, ?)";
        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);
            ps.setInt(4, priceAtTime);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<OrderItem> getOrderItemsByUserId(int userId) {
        List<OrderItem> list = new ArrayList<>();
        String sql
                = "SELECT o.id AS order_id, p.name, p.unit, oi.price_at_time, oi.quantity, o.status "
                + "FROM orders o "
                + " JOIN order_items oi ON o.id = oi.order_id "
                + " JOIN products p ON oi.product_id = p.id "
                + "WHERE o.user_id = ?";
        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderItem item = new OrderItem(
                        rs.getInt("order_id"), // <-- orderId
                        rs.getString("name"),
                        rs.getInt("price_at_time"),
                        rs.getString("unit"),
                        rs.getInt("quantity"),
                        rs.getString("status")
                );
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateStatus(int orderId, String status) {
        String sql = "UPDATE orders SET status = ? WHERE id = ?";
        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, orderId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Order> getOrdersByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id = ?";
        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
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

}
