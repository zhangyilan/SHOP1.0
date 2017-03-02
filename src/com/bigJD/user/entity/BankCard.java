package com.bigJD.user.entity;

import com.bigJD.user.entity.User;

public class BankCard {
    private Integer id;//银行卡ID
    private String name;//什么银行
    private String cardNumber;//银行卡号
    private User user;//谁的银行卡啊
    private int money;//余额
    private Integer state;//状态

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

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "BankCard{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cardNumber='" + cardNumber + '\'' +
                ", user=" + user +
                ", money=" + money +
                ", state=" + state +
                '}';
    }
}
