package com.dao;

import java.util.List;

import com.bean.Goods;

public interface GoodsMapper {
	List<Goods> selectall();
	
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
}