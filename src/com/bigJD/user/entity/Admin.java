package com.bigJD.user.entity;

import java.util.HashSet;
import java.util.Set;

public class Admin {
    private Integer id;//管理员ID
    private String realName;//名字
    private String loginName;//登录名
    private String password;//登录密码
    private Integer state;
    private Set<Authority> authoritys = new HashSet<Authority>();

    public Set<Authority> getAuthoritys() {
		return authoritys;
	}

	public void setAuthoritys(Set<Authority> authoritys) {
		this.authoritys = authoritys;
	}

	public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", realName=" + realName + ", loginName="
				+ loginName + ", password=" + password + ", state=" + state
				+ ", authoritys=" + authoritys + "]";
	}

	
	
    
}
