package com.bigJD.user.entity;
import com.bigJD.cart.entity.ProductItem;
import com.bigJD.others.entity.Collect;
import com.bigJD.others.entity.FootPrint;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
public class User {
    private Integer id;//用户ID
    private String realName;//真实姓名
    private String userName;//用户名
    private String password;//密码
    private String photoUrl;//头像路径
    private String sex="未知";//性别
    private String phone;//
    private Date registerTime;//注册时间
    private Integer state;//状态
    private String remark;//备注
    private Set<ProductItem> productItems =  new HashSet<ProductItem>();//用户购物车中所有商品
    private Set<Address> addresss =  new HashSet<Address>();//用户所有收货地址
    private Set<Collect> collects=  new HashSet<Collect>();//用户所有收藏
    private Set<FootPrint> footPrints =  new HashSet<FootPrint>();//用户所有足迹
    private Set<BankCard> bankCards=  new HashSet<BankCard>();//用户所有银行卡

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }


    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Integer getState() {
        return state;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Set<ProductItem> getProductItems() {
        return productItems;
    }

    public void setProductItems(Set<ProductItem> productItems) {
        this.productItems = productItems;
    }

    public Set<Address> getAddresss() {
        return addresss;
    }

    public void setAddresss(Set<Address> addresss) {
        this.addresss = addresss;
    }

    public Set<Collect> getCollects() {
        return collects;
    }

    public void setCollects(Set<Collect> collects) {
        this.collects = collects;
    }

    public Set<FootPrint> getFootPrints() {
        return footPrints;
    }

    public void setFootPrints(Set<FootPrint> footPrints) {
        this.footPrints = footPrints;
    }

    public Set<BankCard> getBankCards() {
        return bankCards;
    }

    public void setBankCards(Set<BankCard> bankCards) {
        this.bankCards = bankCards;
    }
}
