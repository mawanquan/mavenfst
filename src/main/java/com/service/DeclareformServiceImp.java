package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bean.Declarefile;
import com.bean.Declareform;
import com.dao.DeclarefileMapper;
import com.dao.DeclareformMapper;

@Service("declareformServiceImp")
public class DeclareformServiceImp implements DeclareformService {
	@Resource(name = "declareformMapper")
	DeclareformMapper declareformMapper;
	@Resource(name = "declarefileMapper")
	DeclarefileMapper declarefileMapper;

	@Override
	public List<Declareform> selectAllBysign(int sign,int status) {
		return declareformMapper.selectAllBysign(sign, status);
	}

	@Override
	public List<Declareform> selectAllByTitle(String title, int sign,int status) {
		return declareformMapper.selectAllByTitle(title, sign,status);
	}

	@Override
	public Declareform selectDeclareformById(int id) {
		return declareformMapper.selectByid(id);
	}

	@Override
	public List<Declarefile> selectAllByDeclareid(int declareid) {
		return declarefileMapper.selectAllByDeclareid(declareid);
	}


	@Override
	public Declarefile selectone(int id) {
		return declarefileMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Declareform> selectAll() {
		return declareformMapper.selectAll();
	}

	@Override
	public int updateById(Declareform declareform) {
		return declareformMapper.updateByPrimaryKey(declareform);
	}

	@Override
	public int insertDeclareform(Declareform declareform) {
		return declareformMapper.insert(declareform);
	}

	@Override
	public Declareform selectDeclareformBytitle(String title) {
		return declareformMapper.selectoneBytitle(title);
	}

	@Override
	public int insertDeclarefile(List<Declarefile> list) {
		return declarefileMapper.insertlist(list);
	}
	//查询所有未發佈招标项目
	@Override
	public List<Declareform> selectAllBystatus(int status, int publisher) {
		return declareformMapper.selectAllBystatus(status, publisher);
	}

	@Override
	public int deleteoneByid(int id) {
		return declareformMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Declareform> selectAllBystatusall(int status) {
		return declareformMapper.selectAllBystatus2(status);
	}

	@Override
	public int updateByid(Declarefile d) {
		return declarefileMapper.updateByPrimaryKey(d);
	}

	@Override
	public int deletefileByid(Declarefile d) {
		return declarefileMapper.delete(d);
	}

}
