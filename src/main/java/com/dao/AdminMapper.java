package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Admin;
@Repository("adminMapper")
public interface AdminMapper extends Mapper<Admin> {
	List<Admin> selAllAdmin(Admin admin);

	Admin selByAdminName(Admin admin);
  
}