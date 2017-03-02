package com.bigJD.order.entity;

import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;
import com.bigJD.utils.Constant;
import java.util.Date;

public class Order {

    private Integer id;  //订单id
    private String orderNumber; //订单号
    private User user; //下单人
    private Product product;    //对应的商品
    private Date addTime;    //下单时间
    private Date finishTime;   //收货时间
    private Integer state  = Constant.ORDER_NOT_PAY;//订单状态（默认未付款）
    private String address;//收货地址
    private String consigneeName;//收货人
    private Date payTime;//付款时间
    private String tell;//收货电话
    private String remark;//备注
    private int number ;//购买数量

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getTell() {
        return tell;
    }

    public void setTell(String tell) {
        this.tell = tell;
    }

    public String getConsigneeName() {
        return consigneeName;
    }

    public void setConsigneeName(String consigneeName) {
        this.consigneeName = consigneeName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
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

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
