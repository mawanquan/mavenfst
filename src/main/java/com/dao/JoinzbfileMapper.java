package com.dao;

import org.springframework.stereotype.Repository;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Joinzbfile;
@Repository("joinzbfileMapper")
public interface JoinzbfileMapper extends Mapper<Joinzbfile> {

	Integer delByJoinjoinzbxxid(Integer id);

 
}