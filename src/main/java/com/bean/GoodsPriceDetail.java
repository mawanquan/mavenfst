package com.bean;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Transient;
//询价报价表
public class GoodsPriceDetail implements Serializable {
	@Id
    private Integer id;

    private Integer supplierid;

    private Integer price;

    private String remarks;
    
    private Integer goodsdetailid;
    @Transient
    private GoodsDetail goodsDetail;

    private static final long serialVersionUID = 1L;
    

    
	public Integer getGoodsdetailid() {
		return goodsdetailid;
	}

	public void setGoodsdetailid(Integer goodsdetailid) {
		this.goodsdetailid = goodsdetailid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSupplierid() {
		return supplierid;
	}

	public void setSupplierid(Integer supplierid) {
		this.supplierid = supplierid;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public GoodsDetail getGoodsDetail() {
		return goodsDetail;
	}

	public void setGoodsDetail(GoodsDetail goodsDetail) {
		this.goodsDetail = goodsDetail;
	}

	public GoodsPriceDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodsPriceDetail(Integer id, Integer supplierid, Integer price,
			String remarks, GoodsDetail goodsDetail) {
		super();
		this.id = id;
		this.supplierid = supplierid;
		this.price = price;
		this.remarks = remarks;
		this.goodsDetail = goodsDetail;
	}
    
    
   
   
}