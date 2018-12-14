package com.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Admin;
import com.bean.GoodsPrice;

public interface GoodsPriceMapper extends Mapper<com.bean.GoodsPrice>{
	List<GoodsPrice> selectgp();
	List<GoodsPrice> selecta();
	List<Admin> selectall2();
	GoodsPrice selectbytitle(String goodstitle);
	Admin selectbyadmin(String adminname);
	Integer updateform(Integer id,Integer form);
	List<GoodsPrice> selectform();
}