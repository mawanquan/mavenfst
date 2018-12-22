package com.service;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

import com.dao.ProclamationMapper;
import com.sun.org.apache.bcel.internal.generic.Select;
import com.bean.Proclamation;

/**
 * service层接口实现类
 */
@Component
public class ProclamationServiceImp implements ProclamationService {

	@Resource(name = "proclamationMapper")
	ProclamationMapper proclamationMapper;

	@Override
	public int insert(Proclamation proclamation) {
		// TODO Auto-generated method stub
		return proclamationMapper.insert(proclamation);
	}

	@Override
	public List<Proclamation> SelectAll() {
		// TODO Auto-generated method stub
		return proclamationMapper.selectAll();
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return proclamationMapper.deleteByPrimaryKey(id);
	}

	
	
	@Override
	public Proclamation selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return proclamationMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Proclamation proclamation) {
		// TODO Auto-generated method stub
		return proclamationMapper.updateByPrimaryKey(proclamation);
	}

	@Override
	public Proclamation updateProclamationByTitle(String title) {
		// TODO Auto-generated method stub
		return proclamationMapper.updateByTitle(title);

	

	}
	public Proclamation updateProclamationByComment(String comment) {
		// TODO Auto-generated method stub
		return proclamationMapper.updateByComment(comment);

	

	}

	@Override
	public List<Proclamation> selectAllProclamationJionSuppliers() {
		// TODO Auto-generated method stub
		return proclamationMapper.selectAllProclamationJionSuppliers();
	}
}
