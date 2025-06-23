package dao;

import db.DBContext;
import model.Product;
import java.sql.*;
import java.util.*;

public class ProductDao extends DBContext {
  // Trả về danh sách sản phẩm theo từng trang (phân trang)
    public List<Product> getProductsByPage(int page, int pageSize) {
        List<Product> list = new ArrayList<>();
        
        try {
            String sql = "SELECT * FROM products ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement ps = getConnection().prepareStatement(sql);
             // Tính OFFSET: số dòng cần bỏ qua
            ps.setInt(1, (page - 1) * pageSize);
             // Số dòng cần lấy
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getInt("category_id"),
                    rs.getInt("price"),
                    rs.getInt("stock_quantity"),
                    rs.getString("unit"),
                    rs.getString("brand_name")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
// Đếm tổng số sản phẩm trong bảng (dùng để tính tổng số trang)
    public int countProducts() {
        try {
            String sql = "SELECT COUNT(*) FROM products";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }
}
