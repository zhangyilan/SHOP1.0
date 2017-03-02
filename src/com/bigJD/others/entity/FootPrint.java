package com.bigJD.others.entity;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;

import java.util.Date;

public class FootPrint {
    private Integer id;  //足迹ID
    private Product product;//商品
    private User user;//用户
    private Date addTime;//添加时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }
}
