package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bean.Answer;
import com.bean.Complain;
import com.dao.AnswerMapper;

/**
 * service层接口实现类
 */
@Component
public class AnswerServiceImp implements AnswerService {

	@Resource(name = "answerMapper")
	AnswerMapper answerMapper;

	/**
	 * 查询所有的数据
	 */
	@Override
	public List<Answer> selectanswer() {

		return (List<Answer>) answerMapper.selectanswer();
	}

	/**
	 * 根据主键查询一个对象
	 */
	@Override
	public Answer selectByPrimaryKey(Integer id) {
		return answerMapper.selectByPrimaryKey(id);
	}

	/**
	 * 根据主键删除一个对象
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return answerMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 根据主键修改一个对象
	 */
	@Override
	public int updateByPrimaryKey(Answer answer) {
		return answerMapper.updateByPrimaryKey(answer);
	}

	/**
	 * 增加一个对象
	 */
	@Override
	public int insert(Answer answer) {
		return answerMapper.insert(answer);
	}

	/**
	 * 后台查询投诉对象
	 * 
	 * @return
	 */
	@Override
	public Complain selectcomplainkeyid(Integer id) {

		return answerMapper.selectcomplainkeyid(id);
	}

}
