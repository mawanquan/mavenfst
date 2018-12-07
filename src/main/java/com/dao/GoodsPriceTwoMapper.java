package com.dao;

import com.bean.GoodsPriceTwo;

public interface GoodsPriceTwoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodsPriceTwo record);

    int insertSelective(GoodsPriceTwo record);

    GoodsPriceTwo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsPriceTwo record);

    int updateByPrimaryKey(GoodsPriceTwo record);
}