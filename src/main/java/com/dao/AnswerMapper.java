package com.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Answer;

public interface AnswerMapper extends Mapper<Answer> {

	List<Answer> selectanswer();

	/**
	 * ����������ѯ�ظ�����
	 * 
	 * @return
	 */
	Answer selectanswerbyid(Integer id);

	List<Answer> selectanswerbyid();

}