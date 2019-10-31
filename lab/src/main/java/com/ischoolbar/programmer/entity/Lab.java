package com.ischoolbar.programmer.entity;

import java.io.Serializable;

public class Lab implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long id;

    private String name;

    private String admin;

    private Integer status;

    private Integer adminphone;

    private String comment;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getAdminphone() {
        return adminphone;
    }

    public void setAdminphone(Integer adminphone) {
        this.adminphone = adminphone;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Lab{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", admin='" + admin + '\'' +
                ", status=" + status +
                ", adminphone=" + adminphone +
                ", comment='" + comment + '\'' +
                '}';
    }
}