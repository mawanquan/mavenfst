package com.service;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Goods;
import com.bean.GoodsDetail;
import com.bean.GoodsPrice;
import com.bean.GoodsPriceDetail;
import com.bean.GoodsPriceTwo;
import com.dao.GoodsDetailMapper;
import com.dao.GoodsMapper;
import com.dao.GoodsPriceDetailMapper;
import com.dao.GoodsPriceMapper;
import com.dao.GoodsPriceTwoMapper;
@Service(value="goodsPriceDetailServiceImp")
public class GoodsPriceDetailServiceImp implements GoodsPriceDetailService{
	@Resource
	GoodsPriceDetailMapper gpd;
	@Resource
	GoodsMapper gm;
	@Resource
	GoodsDetailMapper gdm;
	@Resource
	GoodsPriceMapper gpm;
	@Resource
	GoodsPriceTwoMapper gpt;
	
	
	
	public GoodsMapper getGm() {
		return gm;
	}
	public void setGm(GoodsMapper gm) {
		this.gm = gm;
	}
	public GoodsDetailMapper getGdm() {
		return gdm;
	}
	public void setGdm(GoodsDetailMapper gdm) {
		this.gdm = gdm;
	}
	public GoodsPriceMapper getGpm() {
		return gpm;
	}
	public void setGpm(GoodsPriceMapper gpm) {
		this.gpm = gpm;
	}
	
	public GoodsPriceTwoMapper getGpt() {
		return gpt;
	}
	public void setGpt(GoodsPriceTwoMapper gpt) {
		this.gpt = gpt;
	}
	public GoodsPriceDetailMapper getGpd() {
		return gpd;
	}
	public void setGpd(GoodsPriceDetailMapper gpd) {
		this.gpd = gpd;
	}
	@Override
	public List<GoodsPriceDetail> selectall() {
		// TODO Auto-generated method stub
		return gpd.selectall();
	}
	@Override
	public List<GoodsPriceDetail> selectbygoodscode(Integer goodscode,String type,String goodsname) {
		// TODO Auto-generated method stub
		return gpd.selectbygoodscode(goodscode,type,goodsname);
	}
	@Override
	public void insertgoods(GoodsPriceDetail goodspricedetail) {
		// TODO Auto-generated method stub
		gpd.insert(goodspricedetail);
	}
	
	
	@Override
	public int deletegoods(Integer id) {
		
		return gpd.deleteByPrimaryKey(id);
		
	}
	
	public int deletegood2(Integer id2){
		return gm.deleteByPrimaryKey(id2);
	}
	public int deletegood3(Integer id3){
		return gdm.deleteByPrimaryKey(id3);
	}
	public int deletegood4(Integer id4){
		return gpm.deleteByPrimaryKey(id4);
	}
	
	public int deletegood5(Integer id5){
		return gpt.deleteByPrimaryKey(id5);
	}
	
	@Override
	public int changegoods(GoodsPriceDetail good) {
		// TODO Auto-generated method stub
		return gpd.changegoods(good);
	}
	@Override
	public int deletelist(String[] pks) {
		// TODO Auto-generated method stub
		return gpd.deletelist(pks);
	}
	@Override
	public GoodsPriceDetail selectbyid(Integer id) {
		// TODO Auto-generated method stub
		return gpd.selectbyid(id);
	}

}
