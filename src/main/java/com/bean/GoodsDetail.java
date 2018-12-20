package com.bean;

import java.io.Serializable;

import java.util.Date;
//采购询价物资明细表
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Transient;
public class GoodsDetail implements Serializable {
	@Id
    private Integer id;
    private Integer num;
    private Integer goodspriceid;
    private Integer goodsid;
    private Date getdate;
    @Transient
    private Goods goods;
    @Transient
    private GoodsPrice goodsprice;
    

	public GoodsPrice getGoodsprice() {
		return goodsprice;
	}

	public void setGoodsprice(GoodsPrice goodsprice) {
		this.goodsprice = goodsprice;
	}

	public Integer getGoodspriceid() {
		return goodspriceid;
	}

	public void setGoodspriceid(Integer goodspriceid) {
		this.goodspriceid = goodspriceid;
	}

	public Integer getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}


	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Date getGetdate() {
		return getdate;
	}

	public void setGetdate(Date getdate) {
		this.getdate = getdate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}