package com.bigJD.user.entity;

public class Menu {
    private Integer id;//菜单ID
    private String name;//
    private String url;
    private int state;
    private Authority authority;//对应的权限

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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Authority getAuthority() {
        return authority;
    }

    public void setAuthority(Authority authority) {
        this.authority = authority;
    }

	@Override
	public String toString() {
		return "Menu [id=" + id + ", name=" + name + ", url=" + url
				+ ", state=" + state + "]";
	}
}
