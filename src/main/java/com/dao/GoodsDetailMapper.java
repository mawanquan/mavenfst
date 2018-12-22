package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import tk.mybatis.mapper.common.Mapper;

import com.bean.GoodsDetail;

public interface GoodsDetailMapper extends Mapper<GoodsDetail>{
	int deletebygoodsid(Integer id);
	GoodsDetail selectdetailbyid(Integer id);
	List<GoodsDetail> selectdetailbyspriceid(Integer id);
}