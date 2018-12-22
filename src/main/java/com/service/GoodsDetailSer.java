package com.service;

import java.util.List;

import com.bean.Admin;
import com.bean.Goods;
import com.bean.GoodsDetail;
import com.bean.GoodsPrice;
public interface GoodsDetailSer {
	List<Goods> selectall(); 
	Goods selectbyid(Integer id);
	Goods selectbygoodsname(String goodsname);
	List<Goods> selectbyothers(String goodsname,String goodscode,String type);
	int insertgoods(Goods goods);
	int updategoods(Goods goods);
	GoodsDetail selectdetailbyid(Integer id);
	List<GoodsPrice> selectgp();
	List<GoodsPrice> selecta();
	int insertgoodsdetail(GoodsDetail goodsdetail);
	GoodsDetail selectdetailbyspriceid(Integer id);
	List<Admin> selectall2();

}
