package com.bili.bean;

import java.util.Date;

public class Comment {
    private Integer id;

    private String content;

    private Integer vid;

    private Integer uid;

    private Date time;

    private String username;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getVid() {
        return vid;
    }

    public void setVid(Integer vid) {
        this.vid = vid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Comment() {
    }

    public Comment(Integer id, String content, Integer vid, Integer uid, Date time, String username) {
        this.id = id;
        this.content = content;
        this.vid = vid;
        this.uid = uid;
        this.time = time;
        this.username = username;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", vid=" + vid +
                ", uid=" + uid +
                ", time=" + time +
                ", username='" + username + '\'' +
                '}';
    }
}