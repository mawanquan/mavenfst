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

	/**
	 * 统计采购商品信息
	 */
	List<Map<String, Object>> selectgoodsprice();

	/**
	 * 统计个月招标信息
	 */
	List<Map<String, Object>> selectdeclare(String year);

	/**
	 * 统计各年招标数
	 */
	List<Map<String, Object>> selectdeclareyear();

}