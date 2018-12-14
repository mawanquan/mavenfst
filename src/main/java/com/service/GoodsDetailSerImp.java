package com.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Admin;
import com.bean.Goods;
import com.bean.GoodsDetail;
import com.bean.GoodsPrice;
import com.dao.AdminMapper;
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
	@Override
	public List<Goods> selectall() {
		// TODO Auto-generated method stub
		return gm.selectAll();
	}
	@Override
	public Goods selectbyid(Integer id) {
		// TODO Auto-generated method stub
		return gm.selectByPrimaryKey(id);
	}
	@Override
	public List<Goods> selectbyothers(String goodsname, String goodscode,
			String type) {
		// TODO Auto-generated method stub
		return gm.selectbyothers(goodsname, goodscode, type);
	}
	
	@Override
	public int insertgoods(Goods goods) {
		// TODO Auto-generated method stub
		return gm.insertgoods(goods);
	}
	@Override
	public int updategoods(Goods goods) {
		// TODO Auto-generated method stub
		return gm.updategoods(goods);
	}
	@Override
	public GoodsDetail selectdetailbyid(Integer id) {
		// TODO Auto-generated method stub
		return gdm.selectdetailbyid(id);
	}
	@Override
	public List<GoodsPrice> selectgp() {
		// TODO Auto-generated method stub
		return gp.selectgp();
	}
	@Override
	public List<GoodsPrice> selecta() {
		// TODO Auto-generated method stub
		return gp.selecta();
	}
	@Override
	public int insertgoodsdetail(GoodsDetail goodsdetail) {
		// TODO Auto-generated method stub
		return gdm.insert(goodsdetail);
	}
	@Override
	public GoodsDetail selectdetailbyspriceid(Integer id) {
		// TODO Auto-generated method stub
		return gdm.selectdetailbyspriceid(id);
	}
	@Override
	public Goods selectbygoodsname(String goodsname) {
		// TODO Auto-generated method stub
		return gm.selectbygoodsname(goodsname);
	}
	@Override
	public List<Admin> selectall2() {
		// TODO Auto-generated method stub
		return gp.selectall2();
	}
	@Override
	public int insertgp(GoodsPrice goodsprice) {
		// TODO Auto-generated method stub
		return gp.insert(goodsprice);
	}
	@Override
	public Admin selectbyadmin(String adminname) {
		// TODO Auto-generated method stub
		return gp.selectbyadmin(adminname);
	}
	@Override
	public GoodsPrice selectbytitle(String goodstitle) {
		// TODO Auto-generated method stub
		return gp.selectbytitle(goodstitle);
	}
	@Override
	public Integer updateform(Integer id, Integer form) {
		// TODO Auto-generated method stub
		return gp.updateform(id, form);
	}
	@Override
	public List<GoodsPrice> selectform() {
		// TODO Auto-generated method stub
		return gp.selectform();
	}
}
