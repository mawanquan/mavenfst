package com.bean;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Transient;
//采购询价附件表
public class GoodsPriceTwo implements Serializable {
	@Id
    private Integer id;

    private Integer goodspriceid;

    private String filepath;

	private static final long serialVersionUID = 1L;

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodspriceid() {
        return goodspriceid;
    }

    public void setGoodspriceid(Integer goodspriceid) {
        this.goodspriceid = goodspriceid;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath == null ? null : filepath.trim();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        GoodsPriceTwo other = (GoodsPriceTwo) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getGoodspriceid() == null ? other.getGoodspriceid() == null : this.getGoodspriceid().equals(other.getGoodspriceid()))
            && (this.getFilepath() == null ? other.getFilepath() == null : this.getFilepath().equals(other.getFilepath()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getGoodspriceid() == null) ? 0 : getGoodspriceid().hashCode());
        result = prime * result + ((getFilepath() == null) ? 0 : getFilepath().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", goodspriceid=").append(goodspriceid);
        sb.append(", filepath=").append(filepath);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}