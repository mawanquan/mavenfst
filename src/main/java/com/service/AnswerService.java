package com.service;

import java.util.List;

import com.bean.Answer;

/**
 * service层接口
 */
public interface AnswerService {

	/**
	 * 查询所有的数据
	 */
	List<Answer> selectanswer();

	/**
	 * 根据主键查询回复对象
	 * 
	 * @return
	 */
	Answer selectanswerbyid(Integer id);

	/**
	 * 根据主键删除一个对象
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * 根据主键修改一个对象
	 */
	int updateByPrimaryKey(Answer answer);

	/**
	 * 增加一个对象
	 */
	int insert(Answer answer);

}
