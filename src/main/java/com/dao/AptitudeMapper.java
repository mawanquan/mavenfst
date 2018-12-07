package com.dao;

import com.bean.Aptitude;

public interface AptitudeMapper {
    int deleteByPrimaryKey(Integer aptitudesid);

    int insert(Aptitude record);

    int insertSelective(Aptitude record);

    Aptitude selectByPrimaryKey(Integer aptitudesid);

    int updateByPrimaryKeySelective(Aptitude record);

    int updateByPrimaryKey(Aptitude record);
}