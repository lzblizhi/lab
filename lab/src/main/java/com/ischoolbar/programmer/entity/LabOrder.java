package com.ischoolbar.programmer.entity;

import java.io.Serializable;

public class LabOrder implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;

    private Integer uid;

    private String name;

    private String part;
    
    private String email;

    private String useTo;

    private Integer day;

    private Integer beginclass;

    private Integer endclass;

    private Integer astatus;

    private Integer rstatus;

    private User user;
    
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUseTo() {
		return useTo;
	}

	public void setUseTo(String useTo) {
		this.useTo = useTo;
	}

	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	public Integer getBeginclass() {
		return beginclass;
	}

	public void setBeginclass(Integer beginclass) {
		this.beginclass = beginclass;
	}

	public Integer getEndclass() {
		return endclass;
	}

	public void setEndclass(Integer endclass) {
		this.endclass = endclass;
	}
	
	
	
	public Integer getAstatus() {
		return astatus;
	}

	public void setAstatus(Integer astatus) {
		this.astatus = astatus;
	}

	public Integer getRstatus() {
		return rstatus;
	}

	public void setRstatus(Integer rstatus) {
		this.rstatus = rstatus;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "LabOrder [id=" + id + ", uid=" + uid + ", name=" + name + ", part=" + part + ", email=" + email
				+ ", useTo=" + useTo + ", day=" + day + ", beginclass=" + beginclass + ", endclass=" + endclass
				+ ", astatus=" + astatus + ", rstatus=" + rstatus + ", user=" + user + "]";
	}
    
}