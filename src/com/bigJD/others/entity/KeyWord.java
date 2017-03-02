package com.bigJD.others.entity;


import java.util.Date;
public class KeyWord {
    private Integer  id;  //关键字ID
    private String   name;       //关键字名
    private Integer  clickNumber; //点击次数
    private Date     addTime;     //添加时间

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

    public Integer getClickNumber() {
        return clickNumber;
    }

    public void setClickNumber(Integer clickNumber) {
        this.clickNumber = clickNumber;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }
}
