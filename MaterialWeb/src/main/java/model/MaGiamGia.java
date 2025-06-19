/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import constant.Constants.*;

/**
 *
 * @author Dai Minh Nhu - CE190213
 */
public class MaGiamGia {

    private int id;     // bat dau tu 1, 2, 3; id chi cho 1 san pham duy nhat, co tao moi
    private String name;
    private int discount;
    private int typeOfDiscount;
    private int soLuong;        //neu khong gioi han so luon thi la INFINITY cua constant
    private boolean coHanSuDung;
    private String dateStart;      //seconds => max 68year 24days
    private String dateEnd;

    public MaGiamGia(int id, String name, int discount, int typeOfDiscount, int soLuong, boolean coHanSuDung, String dateStart, String dateEnd) {
        this.id = id;
        this.name = name;
        this.discount = discount;
        this.typeOfDiscount = typeOfDiscount;
        this.soLuong = soLuong;
        this.coHanSuDung = coHanSuDung;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getTypeOfDiscount() {
        return typeOfDiscount;
    }

    public void setTypeOfDiscount(int typeOfDiscount) {
        this.typeOfDiscount = typeOfDiscount;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public boolean isCoHanSuDung() {
        return coHanSuDung;
    }

    public void setCoHanSuDung(boolean coHanSuDung) {
        this.coHanSuDung = coHanSuDung;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }
    
    
}
