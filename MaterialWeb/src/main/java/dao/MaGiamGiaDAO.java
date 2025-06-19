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
import model.MaGiamGia;

/**
 *
 * @author Dai Minh Nhu - CE190213
 */
public class MaGiamGiaDAO extends DBContext {

    int idTop = -1;

    public static void main(String[] args) {
        MaGiamGiaDAO dao = new MaGiamGiaDAO();
    }

    public List<MaGiamGia> getAll() {
        List<MaGiamGia> list = new ArrayList<>();
//        try {
//            String query = "select ArtistId, Name from Artist";
//            PreparedStatement pstatement = this.getConnection().prepareStatement(query);
//            ResultSet rs = pstatement.executeQuery();
//
//            while (rs.next()) {
//                int id = rs.getInt("ArtistId");
//                String name = rs.getString(2);
//                Artist ar = new Artist(id, name);
//
//                list.add(ar);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(MaGiamGiaDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }

        return list;
    }

    public int create(String name, int discount, int typeOfDiscount, int soLuong, boolean coHanSuDung, String dateStart, String dateEnd) {
        try {

            String query = "INSERT INTO MaGiamGia (Name, Discount, TypeOfDiscount, SoLuong, CoHanSuDung, DateStart, DateEnd)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?);";
            if (idTop == -1) {
                idTop = getNextIDTop();
            }
            idTop++;

            return this.executeQuery(query, new Object[]{idTop, new Object[]{idTop, name, discount, typeOfDiscount, soLuong, coHanSuDung, dateStart, dateEnd}});

        } catch (SQLException ex) {
            Logger.getLogger(MaGiamGiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void update(int id, String name, int discount, int typeOfDiscount, int soLuong, boolean coHanSuDung, String dateStart, String dateEnd) {
        try {
            String query = "UPDATE MaGiamGia\n"
                    + "SET Name = ?, Discount = ?, TypeOfDiscount = ?, SoLuong = ?, CoHanSuDung = ?, DateStart = ?, DateEnd = ?\n"
                    + "WHERE Id = ?;";

            int result = this.executeQuery(query, new Object[]{name, discount, typeOfDiscount, soLuong, coHanSuDung, dateStart, dateEnd, id});
//            PreparedStatement pstatement = this.getConnection().prepareStatement(query);
//
//            pstatement.setInt(2, id);
//            pstatement.setString(1, name);

            if (result == 1) {
                System.out.println("Updated");
            } else {
                System.out.println("The ID is not existed!!!");
            }

        } catch (SQLException ex) {
            Logger.getLogger(MaGiamGiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void remove(int id) {
        try {
            String query = "DELETE FROM Artist WHERE ArtistId = ?;";
            PreparedStatement pstatement = this.getConnection().prepareStatement(query);

            pstatement.setInt(1, id);

            if (pstatement.executeUpdate() == 1) {
                System.out.println("Removed");
            } else {
                System.out.println("The ID is not existed!!!");
            }

        } catch (SQLException ex) {
            Logger.getLogger(MaGiamGiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getNextIDTop() {
        try {
            String query = "SELECT TOP 1 ArtistID FROM Artist ORDER BY ArtistID DESC";
            PreparedStatement pstatement = this.getConnection().prepareStatement(query);
            ResultSet rs = pstatement.executeQuery();

            int id = -1;
            while (rs.next()) {
                id = rs.getInt(1);
            }

//            if (id == -1) {
//                return 0;
//            } else {
//                return id + 1;
//            }
            return id;

        } catch (SQLException ex) {
            Logger.getLogger(MaGiamGiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return -1;
    }

    public int getNextIDInside() {
        try {
            String query = "select ArtistId from Artist";
            PreparedStatement pstatement = this.getConnection().prepareStatement(query);
            ResultSet rs = pstatement.executeQuery();

            int pre = -1;

            while (rs.next()) {
                int id = rs.getInt(1);

                if (!(pre == -1 || pre + 1 == id)) {
                    return pre + 1;
                }

                pre = id;
            }

            if (pre == -1) {
                return 0;
            } else {
                return pre + 1;
            }

        } catch (SQLException ex) {
            Logger.getLogger(MaGiamGiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }
}
