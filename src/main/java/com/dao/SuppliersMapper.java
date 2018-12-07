package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Suppliers;
@Repository
public interface SuppliersMapper extends Mapper<Suppliers>{
	List<Suppliers> selectAllsuppliers();

}