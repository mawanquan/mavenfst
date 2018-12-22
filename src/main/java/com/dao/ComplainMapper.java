package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Complain;

@Repository
public interface ComplainMapper extends Mapper<Complain> {
	/**
	 * 查询所有的投诉对象
	 * 
	 * @return
	 */
	List<Complain> selectcomplain();

	/**
	 * 根据主键查询投诉对象
	 * 
	 * @return
	 */
	Complain selectcomplainById(Integer id);

	List<Complain> selectcomplainById();

}