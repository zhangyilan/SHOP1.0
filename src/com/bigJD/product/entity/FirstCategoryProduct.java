package com.bigJD.product.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class FirstCategoryProduct {
    private  Integer id;  //类别ID
    private  String name; //一级类别名称
    private Date addTime; //添加时间
    private Set<SecondCategoryProduct> secondCategoryProducts = new HashSet<SecondCategoryProduct>();//一级分类下面的二级分类

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

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Set<SecondCategoryProduct> getSecondCategoryProducts() {
        return secondCategoryProducts;
    }

    public void setSecondCategoryProducts(Set<SecondCategoryProduct> secondCategoryProducts) {
        this.secondCategoryProducts = secondCategoryProducts;
    }
}
