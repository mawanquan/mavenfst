package com.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Answer;

public interface AnswerMapper extends Mapper<Answer> {

	List<Answer> selectanswer();

	/**
	 * 根据主键查询回复对象
	 * 
	 * @return
	 */
	Answer selectanswerbyid(Integer id);

	List<Answer> selectanswerbyid();

}