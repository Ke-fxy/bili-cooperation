package com.bili.bean;

import java.sql.Timestamp;

/**
 * @Author Ke
 */
public class Concern {

    private Integer id;

    private int concernId;

    private int concernedId;

    private Timestamp concernTime;

    public Concern() {
    }

    public Concern(Integer id, int concernId, int concernedId, Timestamp concernTime) {
        this.id = id;
        this.concernId = concernId;
        this.concernedId = concernedId;
        this.concernTime = concernTime;
    }

    @Override
    public String toString() {
        return "Concern{" +
                "id=" + id +
                ", concernId=" + concernId +
                ", concernedId=" + concernedId +
                ", concernTime=" + concernTime +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getConcernId() {
        return concernId;
    }

    public void setConcernId(int concernId) {
        this.concernId = concernId;
    }

    public int getConcernedId() {
        return concernedId;
    }

    public void setConcernedId(int concernedId) {
        this.concernedId = concernedId;
    }

    public Timestamp getConcernTime() {
        return concernTime;
    }

    public void setConcernTime(Timestamp concernTime) {
        this.concernTime = concernTime;
    }
}