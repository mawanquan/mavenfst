package com.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
//采购询价
@Table(name="goodsprice")
public class GoodsPrice implements Serializable {
	@Id
    private Integer id;

    private String goodstitle;

    private Integer userid;

    private Date lastdate;
    
    private Integer form;
    @Transient
    private Admin admin;

    private static final long serialVersionUID = 1L;
    @Transient
    private GoodsPriceTwo goodspricetwo;
    @Transient
    List<GoodsDetail> goodsdetail;
    
	public Integer getForm() {
		return form;
	}

	public void setForm(Integer form) {
		this.form = form;
	}

	public List<GoodsDetail> getGoodsdetail() {
		return goodsdetail;
	}

	public void setGoodsdetail(List<GoodsDetail> goodsdetail) {
		this.goodsdetail = goodsdetail;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public GoodsPriceTwo getGoodspricetwo() {
		return goodspricetwo;
	}

	public void setGoodspricetwo(GoodsPriceTwo goodspricetwo) {
		this.goodspricetwo = goodspricetwo;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoodstitle() {
        return goodstitle;
    }

    public void setGoodstitle(String goodstitle) {
        this.goodstitle = goodstitle == null ? null : goodstitle.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getLastdate() {
        return lastdate;
    }

    public void setLastdate(Date lastdate) {
        this.lastdate = lastdate;
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
        GoodsPrice other = (GoodsPrice) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getGoodstitle() == null ? other.getGoodstitle() == null : this.getGoodstitle().equals(other.getGoodstitle()))
            && (this.getUserid() == null ? other.getUserid() == null : this.getUserid().equals(other.getUserid()))
            && (this.getLastdate() == null ? other.getLastdate() == null : this.getLastdate().equals(other.getLastdate()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getGoodstitle() == null) ? 0 : getGoodstitle().hashCode());
        result = prime * result + ((getUserid() == null) ? 0 : getUserid().hashCode());
        result = prime * result + ((getLastdate() == null) ? 0 : getLastdate().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", goodstitle=").append(goodstitle);
        sb.append(", userid=").append(userid);
        sb.append(", lastdate=").append(lastdate);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}