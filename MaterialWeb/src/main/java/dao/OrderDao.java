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
import java.util.List;
import model.CartItem;
import model.Order;

/**
 *
 * @author Le Duy Khanh - CE190235
 */
public class OrderDao extends DBContext {

    public int createOrder(Order order, List<CartItem> cartItems) throws SQLException {
        String insertOrder = "INSERT INTO orders (customer_name, customer_phone, customer_address, total_price) "
                + "OUTPUT INSERTED.id VALUES (?, ?, ?, ?)";
        String insertItem = "INSERT INTO order_items (order_id, product_id, quantity, price) "
                + "VALUES (?, ?, ?, ?)";

        int orderId = -1;

        try ( Connection conn = getConnection()) {
            conn.setAutoCommit(false); // bắt đầu transaction

            // 1. Chèn đơn hàng vào bảng orders
            try ( PreparedStatement psOrder = conn.prepareStatement(insertOrder)) {
                psOrder.setString(1, order.getCustomerName());
                psOrder.setString(2, order.getCustomerPhone());
                psOrder.setString(3, order.getCustomerAddress());
                psOrder.setInt(4, order.getTotalPrice());

                try ( ResultSet rs = psOrder.executeQuery()) {
                    if (rs.next()) {
                        orderId = rs.getInt(1); // lấy id mới chèn
                    }
                }
            }

            // 2. Chèn từng mục giỏ hàng vào order_items
            try ( PreparedStatement psItem = conn.prepareStatement(insertItem)) {
                for (CartItem item : cartItems) {
                    psItem.setInt(1, orderId);
                    psItem.setInt(2, item.getProduct().getId());
                    psItem.setInt(3, item.getQuantity());
                    psItem.setInt(4, item.getProduct().getPrice());
                    psItem.addBatch();
                }
                psItem.executeBatch();
            }

            conn.commit(); // nếu mọi thứ OK
        } catch (SQLException ex) {
            // Nếu lỗi thì rollback
            try ( Connection conn = getConnection()) {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace(); // log rollback lỗi
            }
            throw ex; // ném lỗi cho servlet xử lý tiếp
        }

        return orderId;
    }
}
