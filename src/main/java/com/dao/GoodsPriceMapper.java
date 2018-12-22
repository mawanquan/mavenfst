package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Admin;
import com.bean.GoodsPrice;
import com.bean.GoodsPriceTwo;

public interface GoodsPriceMapper extends Mapper<com.bean.GoodsPrice>{
	List<GoodsPrice> selectgp();
	List<GoodsPrice> selecta();
	List<Admin> selectall2();
	GoodsPrice selectbytitle(String goodstitle);
	Admin selectbyadmin(String adminname);
	Integer updateform(@Param(value = "id")Integer id);
	List<GoodsPrice> selectform();
	Integer updatemany(List<Integer> ids);
	void insertgp(GoodsPrice goodsprice);
	GoodsPriceTwo selecttw(Integer goodspriceid);
}