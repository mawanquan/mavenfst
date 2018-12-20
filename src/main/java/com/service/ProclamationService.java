package com.service;

import java.util.List;
import com.bean.Proclamation;

/**
 * service层接口
 */
public interface ProclamationService {

	/**
	 * 增加一个对象
	 */
	int insert(Proclamation proclamation);

	Proclamation selectByPrimaryKey(Integer id);

	List<Proclamation> SelectAll();

	int deleteByPrimaryKey(Integer id);

	int updateByPrimaryKey(Proclamation proclamation);

}
