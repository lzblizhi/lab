package com.ischoolbar.programmer.entity;

import java.io.Serializable;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

public class DevOrder implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;

    private Integer uid;

    private String part;
    
    private String useTo;

    private String name;

    private Integer number;
    
    private User user;

    @JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date btime;

    @JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date rtime;

    private String email;

    private Integer astatus;

    private Integer rstatus;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	
	
	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUseTo() {
		return useTo;
	}

	public void setUseTo(String useTo) {
		this.useTo = useTo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Date getBtime() {
		return btime;
	}

	public void setBtime(Date btime) {
		this.btime = btime;
	}

	public Date getRtime() {
		return rtime;
	}

	public void setRtime(Date rtime) {
		this.rtime = rtime;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
		return "DevOrder [id=" + id + ", uid=" + uid + ", part=" + part + ", useTo=" + useTo + ", name=" + name
				+ ", number=" + number + ", user=" + user + ", btime=" + btime + ", rtime=" + rtime + ", email=" + email
				+ ", astatus=" + astatus + ", rstatus=" + rstatus + "]";
	}
	
    
}