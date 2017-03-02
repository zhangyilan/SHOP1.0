package com.bigJD.product.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class SecondCategoryProduct {
    private int id; //类别ID
    private String name;    //二级类别名称
    private Date addTime;    //添加时间
    private FirstCategoryProduct firstCategoryProduct;//对应的一级分类
    private Set<ThirdCategoryProduct> thirdCategoryProducts = new HashSet<ThirdCategoryProduct>();//二级分类下的所有三级分类

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

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public FirstCategoryProduct getFirstCategoryProduct() {
        return firstCategoryProduct;
    }

    public void setFirstCategoryProduct(FirstCategoryProduct firstCategoryProduct) {
        this.firstCategoryProduct = firstCategoryProduct;
    }

    public Set<ThirdCategoryProduct> getThirdCategoryProducts() {
        return thirdCategoryProducts;
    }

    public void setThirdCategoryProducts(Set<ThirdCategoryProduct> thirdCategoryProducts) {
        this.thirdCategoryProducts = thirdCategoryProducts;
    }
}
