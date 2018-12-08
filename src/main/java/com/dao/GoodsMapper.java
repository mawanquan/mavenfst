package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Goods;

public interface GoodsMapper extends Mapper<Goods>{
	List<Goods> selectbyothers(@Param(value = "goodsname") String goodsname,@Param(value = "goodscode")String goodscode,@Param(value = "type")String type);
	int insertgoods(Goods goods);
	int updategoods(Goods goods);
	Goods selectbygoodsname(String goodsname);
}