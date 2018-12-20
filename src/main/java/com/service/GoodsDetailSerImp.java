package com.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Goods;
import com.bean.GoodsDetail;
import com.bean.GoodsPrice;
import com.dao.GoodsDetailMapper;
import com.dao.GoodsMapper;
import com.dao.GoodsPriceMapper;


@Service(value="goodsDetailSerImp")
public class GoodsDetailSerImp implements GoodsDetailSer{
	@Resource
	GoodsDetailMapper gdm;
	@Resource
	GoodsMapper gm;
	@Resource
	GoodsPriceMapper gp;
	
	public GoodsPriceMapper getGp() {
		return gp;
	}
	public void setGp(GoodsPriceMapper gp) {
		this.gp = gp;
	}
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
	public GoodsDetail selectgoodsbyid(Integer id) {
		// TODO Auto-generated method stub
		return gdm.selectgoodsbyid(id);
	}
	@Override
	public List<GoodsDetail> selectall() {
		// TODO Auto-generated method stub
		return gdm.selectall();
	}
	@Override
	public List<GoodsDetail> selectgoodsbyother(Integer goodscode, String goodsname,
			String type) {
		// TODO Auto-generated method stub
		return gdm.selectgoodsbyother(goodscode, goodsname, type);
	}

	public int deletebyid1(Integer id1){
		return gdm.deleteByPrimaryKey(id1);
	}
	public int deletebyid2(Integer id2){
		return gm.deleteByPrimaryKey(id2);
	}
	public int deletebyid3(Integer id3){
		return gp.deleteByPrimaryKey(id3);
	}
	@Override
	public int insertgoods(Goods goods) {
		// TODO Auto-generated method stub
		return gm.insert(goods);
	}
	@Override
	public int insertgoodsde(GoodsDetail goodsdetail) {
		// TODO Auto-generated method stub
		return gdm.insert(goodsdetail);
	}

}
