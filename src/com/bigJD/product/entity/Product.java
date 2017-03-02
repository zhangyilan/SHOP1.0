package com.bigJD.product.entity;


import com.bigJD.user.entity.Admin;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Product {
    private Integer id;
    private String name;
    private double oldPrice;//原价
    private double barginPrice;//促销价
    private int sales;//销量
    private Date addTime;//添加时间
    private String info;//详情
    private int state;//状态
    private ThirdCategoryProduct thirdCategoryProduct;//对应的三级分类
    private Admin admin;//哪个管理员添加的添加的
    private Set<ProductImg> imgs = new HashSet<>();

    public Set<ProductImg> getImgs() {
        return imgs;
    }

    public void setImgs(Set<ProductImg> imgs) {
        this.imgs = imgs;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(double oldPrice) {
        this.oldPrice = oldPrice;
    }

    public double getBarginPrice() {
        return barginPrice;
    }

    public void setBarginPrice(double barginPrice) {
        this.barginPrice = barginPrice;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public ThirdCategoryProduct getThirdCategoryProduct() {
        return thirdCategoryProduct;
    }

    public void setThirdCategoryProduct(ThirdCategoryProduct thirdCategoryProduct) {
        this.thirdCategoryProduct = thirdCategoryProduct;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", oldPrice=" + oldPrice +
                ", barginPrice=" + barginPrice +
                ", sales=" + sales +
                ", addTime=" + addTime +
                ", info='" + info + '\'' +
                ", state=" + state +
                '}';
    }
}
