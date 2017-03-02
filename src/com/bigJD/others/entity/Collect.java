package com.bigJD.others.entity;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;

import java.util.Date;
public class Collect {
    private Integer id;//收藏ID
    private Date addTime;//
    private User user;
    private Product product;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
