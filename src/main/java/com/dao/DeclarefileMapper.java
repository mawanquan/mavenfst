package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Declarefile;
@Repository("declarefileMapper")
public interface DeclarefileMapper extends Mapper<Declarefile>{
	//根据招标表id查询所有文件
    List<Declarefile> selectAllByDeclareid(int declareid);
    //批量增加文件
    int insertlist(List<Declarefile> list);
    
    //int updatefilepath(String filepath,int declareid);
}