package dao;

import db.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

public class CategoryDAO {

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM category";

        DBContext db = new DBContext();

        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String icon = rs.getString("icon_class");
                String color = rs.getString("text_color");

                Category category = new Category(id, name, icon, color);
                list.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
