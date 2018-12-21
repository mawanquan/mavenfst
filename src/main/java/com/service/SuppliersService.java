package com.service;

import java.util.List;

import com.bean.Aptitude;
import com.bean.Branch;
import com.bean.Suppliers;

public interface SuppliersService {
	// **********注册************
	int insert(Suppliers record);

	
	int deleteByPrimaryKey(int id);

	// **********登录************
	Suppliers selectBylogin(Suppliers suppliers);

	// /******************审核*************
	List<Suppliers> selectAllsuppliers(Suppliers s);

	
	public Suppliers selectone(int id);

	int updateSign(Suppliers suppliers);

	
	Suppliers selectsuppliers(Integer id);

	
	int upsuppliers(Suppliers suppliers);


	int deleteByPrimaryKey1(int id);
	
	
	// 增加redis手机对应的短信
	public boolean setRedisData(String key, String value) ;

	// 查询redis手机对应的短信


boolean getRedisData(String key,String val);


}
