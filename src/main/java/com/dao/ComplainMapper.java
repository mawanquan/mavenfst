package com.dao;

import java.util.List;
import java.util.Map;

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

	/*
	 * 根据登录用户查询自己所有投诉内容
	 */

	List<Complain> selectcomplainBysupplierid(Integer suppliersid);

	/**
	 * 统计供货商地址信息
	 */
	List<Map<String, Object>> selectAddress();
}