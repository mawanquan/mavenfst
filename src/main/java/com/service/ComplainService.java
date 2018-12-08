package com.service;

import java.util.List;

import com.bean.Complain;

/**
 * service层接口
 */
public interface ComplainService {

	/**
	 * 查询所有的数据
	 */

	List<Complain> selectcomplain();

	/**
	 * 根据主键查询一个对象
	 */
	Complain selectcomplainById(Integer id);

	/**
	 * 根据主键删除一个对象
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * 根据主键修改一个对象
	 */
	int updateByPrimaryKey(Complain complain);

	/**
	 * 增加一个对象
	 */
	int insert(Complain complain);

}
