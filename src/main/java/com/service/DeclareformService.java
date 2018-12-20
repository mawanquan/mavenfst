package com.service;

import java.util.List;

import com.bean.Declarefile;
import com.bean.Declareform;

public interface DeclareformService {

	// 根据招标类型查询所有数据
	List<Declareform> selectAllBysign(int sign,int status);

	// 查询所有数据
	List<Declareform> selectAll();

	// 搜索查询
	List<Declareform> selectAllByTitle(String title, int sign,int status);

	Declareform selectDeclareformById(int id);

	List<Declarefile> selectAllByDeclareid(int declareid);

	int insertDeclareform(Declareform declareform);

	Declareform selectDeclareformBytitle(String title);

	int insertDeclarefile(List<Declarefile> list);

	Declarefile selectone(int id);

	int updateById(Declareform declareform);

	// 查询所有未發佈招标项目
	List<Declareform> selectAllBystatus(int status, int publisher);
	List<Declareform> selectAllBystatusall(int status);
	
	int deleteoneByid(int id);
	
	int updateByid(Declarefile d);
	
	int deletefileByid(Declarefile d);
	
}
