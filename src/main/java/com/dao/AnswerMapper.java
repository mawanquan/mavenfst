package com.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Answer;
import com.bean.Complain;

public interface AnswerMapper extends Mapper<Answer> {

	List<Answer> selectanswer();

	/**
	 * 后台查询投诉对象
	 * 
	 * @return
	 */
	Complain selectcomplainkeyid(Integer id);

	List<Complain> selectcomplainkeyid();

}