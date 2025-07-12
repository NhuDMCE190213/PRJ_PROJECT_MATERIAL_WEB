/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import db.DBContext;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class DAOUser extends DBContext {
    
    
    public ArrayList<User>getALlUser(){
        String sql = "Select * from user_login";
        
        ArrayList<User> listuser = new ArrayList<>();
        
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                User user = new User(
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("Status"),
                        rs.getString("FullName"),
                        rs.getString("PhoneNumber"),
                        rs.getInt("UserID"));
                listuser.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listuser;
    }
    

    //check email ton tai
    public User getUserByEmail(String email) {
        String sql = "Select * from [user_login] where email = ?";
        try {
            PreparedStatement ps = this.getConnection().prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("Status"),
                        rs.getString("FullName"),
                        rs.getString("PhoneNumber"),
                        rs.getInt("UserID"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserById(int userId) {
        String sql = "Select * from [user_login] where UserID = ?";
        try {
            PreparedStatement ps = this.getConnection().prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("Status"),
                        rs.getString("FullName"),
                        rs.getString("PhoneNumber"),
                        rs.getInt("UserID"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updatePassword(String email, String password) {
        String sql = "UPDATE [dbo].[user_login]\n"
                + "   SET [password] = ?\n"
                + " WHERE [email] = ?";
        try {
            String hashedPassword = hashMd5(password);
            PreparedStatement st = this.getConnection().prepareStatement(sql);
            st.setString(1, hashedPassword);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    private String hashMd5(String raw) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] mess = md.digest(raw.getBytes());

            StringBuilder sb = new StringBuilder();
            for (byte b : mess) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(DAOAuth.class.getName()).log(Level.SEVERE, null, ex);
            return "";
        }
    }
}
