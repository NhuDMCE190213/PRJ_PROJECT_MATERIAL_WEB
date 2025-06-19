/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

public class ProductDao extends DBContext {

    public static void main(String[] args) {
        ProductDao dao = new ProductDao();
        List<Product> list = dao.getAll();
        for (Product pr : list) {
            System.out.println(pr.getName());
        }
    }
    // CRUD

    // Create
//    public int create(String name) {
//        try {
//            String getNextIdQuery = "select Max(ArtistId) + 1 from Artist";
//            PreparedStatement ps = this.getConnection().prepareStatement(getNextIdQuery);
//            ResultSet rs = ps.executeQuery();
//            int nextId = 1;
//            if (rs.next()) {
//                nextId = rs.getInt(1);
//            }
//
//            String createQuery = "insert into Artist value (?, ?)";
//            ps = this.getConnection().prepareStatement(createQuery);
//            ps.setObject(1, nextId);
//            ps.setObject(2, name);
//
//            return ps.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return 0;
//    }

    // Read ( list )
    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        try {
            String query = "select id, name, description, category_id, price, stock_quantity, unit, brand_name FROM products";
            PreparedStatement pstatment = this.getConnection().prepareStatement(query);
            ResultSet rs = pstatment.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                int categoryId = rs.getInt("category_id");
                int price = rs.getInt("price");
                int stockQuantity = rs.getInt("stock_quantity");
                String unit = rs.getString("unit");
                String brandName = rs.getString("brand_name");

                Product pr = new Product(id, name, description, categoryId, price, stockQuantity, unit, brandName);
                list.add(pr);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    // Read by id
    // update
    // delete
}
