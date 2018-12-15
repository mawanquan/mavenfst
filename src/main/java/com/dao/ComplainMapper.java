package com.dao;

import java.util.List;
import java.util.Map;

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
	Complain selectcomplainById(Integer id);

	List<Complain> selectcomplainById();

	/*
	 * ���ݵ�¼�û���ѯ�Լ�����Ͷ������
	 */

	List<Complain> selectcomplainBysupplierid(Integer suppliersid);

	/**
	 * ͳ�ƹ����̵�ַ��Ϣ
	 */
	List<Map<String, Object>> selectAddress();
}