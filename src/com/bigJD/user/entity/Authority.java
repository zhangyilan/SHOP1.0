package com.bigJD.user.entity;

import java.util.HashSet;
import java.util.Set;

public class Authority  {
    private Integer id;//权限ID
    private String name;//
    private Admin admin;//对应的管理员
    private Set<Menu> menus = new HashSet<Menu>();

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

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Set<Menu> getMenus() {
        return menus;
    }

    public void setMenus(Set<Menu> menus) {
        this.menus = menus;
    }

	@Override
	public String toString() {
		return "Authority [id=" + id + ", name=" + name 
				+ ", menus=" + menus + "]";
	}
}
