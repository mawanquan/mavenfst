package com.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.bean.Goods;
import com.bean.GoodsDetail;
import com.bean.GoodsPrice;
import com.bean.GoodsPriceDetail;

public interface GoodsPriceDetailService {
	List<GoodsPriceDetail> selectall();
	List<GoodsPriceDetail>selectbygoodscode(Integer goodscode,String type,String goodsname);
	void insertgoods(GoodsPriceDetail goodspricedetail);
	int deletegoods(Integer id);
	int deletegood2(Integer id);
	int deletegood3(Integer id);
	int deletegood4(Integer id);
	int deletegood5(Integer id);
	int deletelist (String [] pks);
	GoodsPriceDetail selectbyid(Integer id);
	int changegoods(GoodsPriceDetail good);

}
