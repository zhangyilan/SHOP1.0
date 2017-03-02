package com.bigJD.cart.entity;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;

import java.util.Date;


public class ProductItem {

    private Integer id; //商品项id
    private Integer number; //购买数量
    private Double totalPrice;//小计
    private Product product;//对应的产品
    private Date addTime;//添加时间
    private User user;//用户ID

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "ProductItem{" +
                "id=" + id +
                ", number=" + number +
                ", totalPrice=" + totalPrice +
                ", product=" + product +
                ", addTime=" + addTime +
                ", user=" + user +
                '}';
    }
}
