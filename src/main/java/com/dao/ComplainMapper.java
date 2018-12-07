package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Complain;

@Repository
public interface ComplainMapper extends Mapper<Complain> {
	/**
	 * ��ѯ���е�Ͷ�߶���
	 * 
	 * @return
	 */
	List<Complain> selectcomplain();

	/**
	 * ����������ѯͶ�߶���
	 * 
	 * @return
	 */
	Complain selectcomplainById(int id);

	List<Complain> selectcomplainById();

}