/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tieu Gia Huy - CE191594
 */
public class OrderReport {
    public int period; // month or quarter
    public int orders;
    public int revenue;

    public OrderReport(int period, int orders, int revenue) {
        this.period = period;
        this.orders = orders;
        this.revenue = revenue;
    }

    // Getters

    public int getPeriod() {
        return period;
    }

    public int getOrders() {
        return orders;
    }

    public int getRevenue() {
        return revenue;
    }
}

