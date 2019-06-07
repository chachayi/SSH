package com.ssh.model;

public class User {
    private Integer id;
    private String username;
    private String pwd;
    private int permissions;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getPermissions() {
        return permissions;
    }

    public void setPermissions(int permissions) {
        this.permissions = permissions;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    public User(String username, String pwd) {
        this.username = username;
        this.pwd = pwd;
}
    public User() {
        // TODO Auto-generated constructor stub
    }
}