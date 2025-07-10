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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
// Đếm tổng số sản phẩm trong bảng (dùng để tính tổng số trang)

    public int countProducts() {
        try {
            String sql = "SELECT COUNT(*) FROM products";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void insert(Product p) {
        try {
            String sql = "INSERT INTO products (name, description, category_id, price, stock_quantity, unit, brand_name) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setInt(3, p.getCategoryId());
            ps.setInt(4, p.getPrice());
            ps.setInt(5, p.getStockQuantity());
            ps.setString(6, p.getUnit());
            ps.setString(7, p.getBrandName());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Cập nhật sản phẩm
    public void update(Product p) {
        try {
            String sql = "UPDATE products SET name = ?, description = ?, category_id = ?, price = ?, stock_quantity = ?, unit = ?, brand_name = ? WHERE id = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setInt(3, p.getCategoryId());
            ps.setInt(4, p.getPrice());
            ps.setInt(5, p.getStockQuantity());
            ps.setString(6, p.getUnit());
            ps.setString(7, p.getBrandName());
            ps.setInt(8, p.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Xoá sản phẩm theo ID
    public void delete(int id) {
        try {
            String sql = "DELETE FROM products WHERE id = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Lấy sản phẩm theo ID
    public Product getById(int id) {
        try {
            String sql = "SELECT * FROM products WHERE id = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("category_id"),
                        rs.getInt("price"),
                        rs.getInt("stock_quantity"),
                        rs.getString("unit"),
                        rs.getString("brand_name")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    public List<Product> searchByName(String keyword, int page, int pageSize) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE name LIKE ? ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try ( Connection conn = getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ps.setInt(2, (page - 1) * pageSize);
            ps.setInt(3, pageSize);
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
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int countByKeyword(String keyword) {
        String sql = "SELECT COUNT(*) FROM products WHERE name LIKE ?";
        try ( Connection conn = getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

}
