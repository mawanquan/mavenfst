package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import tk.mybatis.mapper.common.Mapper;

import com.bean.GoodsDetail;

public interface GoodsDetailMapper extends Mapper<GoodsDetail>{
	GoodsDetail selectgoodsbyid(Integer id);
	List<GoodsDetail> selectall();
	List<GoodsDetail> selectgoodsbyother(@Param(value = "goodscode")Integer goodscode,@Param(value = "goodsname")String goodsname,@Param(value = "type")String type);
	
}