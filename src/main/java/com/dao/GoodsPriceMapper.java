package com.dao;

import com.bean.GoodsPrice;

public interface GoodsPriceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodsPrice record);

    int insertSelective(GoodsPrice record);

    GoodsPrice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsPrice record);

    int updateByPrimaryKey(GoodsPrice record);
}