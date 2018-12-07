package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.Goods;
import com.bean.GoodsDetail;

public interface GoodsDetailSer {
	GoodsDetail selectgoodsbyid(Integer id);
	List<GoodsDetail> selectall();
	List<GoodsDetail> selectgoodsbyother(Integer goodscode,String goodsname,String type);
	int deletebyid1(Integer id1);
	int deletebyid2(Integer id3);
	int deletebyid3(Integer id3);
	int  insertgoods(Goods goods); 
	int insertgoodsde(GoodsDetail goodsdetail);
}
