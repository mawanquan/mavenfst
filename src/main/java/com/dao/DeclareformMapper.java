package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Declareform;
@Repository("declareformMapper")
public interface DeclareformMapper extends Mapper<Declareform>{
    
	//根据招标类型查询所有数据
	List<Declareform> selectAllBysign(int sign,int status);
	List<Declareform> selectmyAllBysign(Integer publisher,Integer sign,Integer status);
	//搜索查询
	List<Declareform> selectAllByTitle(String title,int sign,int status);
	
	Declareform selectoneBytitle(String title);
	//查询所有未發佈招标项目
	List<Declareform> selectAllBystatus(int status,int publisher);
	
	List<Declareform> selectAllBystatus2(int status);
	
	Declareform selectByid(int id);
	//已截止招标待开标项目
	
}