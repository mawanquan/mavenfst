package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bean.Complain;
import com.dao.ComplainMapper;

/**
 * service层接口实现类
 */
@Component
public class ComplainServiceImp implements ComplainService {

	@Resource(name = "complainMapper")
	ComplainMapper complainMapper;

	/**
	 * 根据主键删除一个对象
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return complainMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 根据主键修改一个对象
	 */
	@Override
	public int updateByPrimaryKey(Complain complain) {
		return complainMapper.updateByPrimaryKey(complain);
	}

	/**
	 * 增加一个对象
	 */
	@Override
	public int insert(Complain complain) {
		return complainMapper.insert(complain);
	}

	/**
	 * 查詢所有投诉对象
	 */
	@Override
	public List<Complain> selectcomplain() {

		return complainMapper.selectcomplain();
	}

	/**
	 * 根据主键查询投诉对象
	 */
	@Override
	public Complain selectcomplainById(Integer id) {

		return complainMapper.selectcomplainById(id);
	}

	/*
	 * 根据登录用户查询自己所有投诉内容
	 */
	@Override
	public List<Complain> selectcomplainBysupplierid(Integer suppliersid) {

		return complainMapper.selectcomplainBysupplierid(suppliersid);
	}

	/**
	 * 统计供货商地址信息
	 */
	@Override
	public List<Map<String, Object>> selectAddress() {

		return complainMapper.selectAddress();
	}

	/**
	 * 统计供货商地址信息
	 */
	@Override
	public List<Map<String, Object>> selectgoodsprice() {

		return complainMapper.selectgoodsprice();
	}

	/**
	 * 统计个月招标信息
	 */
	@Override
	public List<Map<String, Object>> selectdeclare(String year) {

		return complainMapper.selectdeclare(year);
	}

	/**
	 * 统计各年招标数
	 */
	@Override
	public List<Map<String, Object>> selectdeclareyear() {

		return complainMapper.selectdeclareyear();
	}

}