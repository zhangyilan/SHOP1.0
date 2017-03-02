package com.bigJD.user.entity;


import java.util.Date;
public class Address{
    /**
	 * 
	 */
	private Integer id;//地址
    private String name;//地名
    private Date addTime; //添加时间
    private User user;//对应的用户
    private String tell;//收货电话
    private String receipt;//收货人

    public String getTell() {
        return tell;
    }

    public void setTell(String tell) {
        this.tell = tell;
    }

    public String getReceipt() {
        return receipt;
    }

    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }

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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

	@Override
	public String toString() {
		return "Address [id=" + id + ", name=" + name + ", addTime=" + addTime
				+ ", user=" + user + ", tell=" + tell + ", receipt=" + receipt
				+ "]";
	}
    
}
