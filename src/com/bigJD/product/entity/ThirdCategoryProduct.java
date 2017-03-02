package com.bigJD.product.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class ThirdCategoryProduct {
    private Integer id;  //类别ID
    private String name;        //二级类别名称
    private Date addTime;       //添加时间
    private SecondCategoryProduct secondCategoryProduct;//对应的二级分类
    private Set<Product> products = new HashSet<Product>();//三级分类下所有产品

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

    public SecondCategoryProduct getSecondCategoryProduct() {
        return secondCategoryProduct;
    }

    public void setSecondCategoryProduct(SecondCategoryProduct secondCategoryProduct) {
        this.secondCategoryProduct = secondCategoryProduct;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }
}
