package com.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Proclamation;

public interface ProclamationMapper extends Mapper<Proclamation>{

Proclamation updateByTitle(String title);
Proclamation updateByComment(String comment);
List<Proclamation> selectAllProclamationJionSuppliers();

   
}