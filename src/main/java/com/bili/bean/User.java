package com.bili.bean;

/**
 * @author Ihlov
 */
public class User {

    private Integer id;

    private String username;

    private String password;

    private String email;

    private String img;

    private String tag;

    private String notice;

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email= email;
    }

    public User() {
    }

    public User(Integer id, String username, String password, String email, String img, String tag, String notice) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.img = img;
        this.tag = tag;
        this.notice = notice;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", img='" + img + '\'' +
                ", tag='" + tag + '\'' +
                ", notice='" + notice + '\'' +
                '}';
    }
}
