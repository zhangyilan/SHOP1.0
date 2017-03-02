package com.bigJD.product.entity;

public class ProductImg {
    private Integer id;//图片ID
    private String url;//图片路径
    private Product product;//对应的商品

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "ProductImg{" +
                "id=" + id +
                ", url='" + url + '\'' +
                '}';
    }
}
