package com.service;

import java.util.List;

import com.bean.Aptitude;
import com.bean.Branch;
import com.bean.Suppliers;

public interface SuppliersService {
	// **********注册************
	int insert(Suppliers record);
	// **********关闭商家(拉入黑名单之后)************
	int deleteByPrimaryKey(int id);

	// **********登录************
	Suppliers selectBylogin(Suppliers suppliers);

	// /******************审核*************
	List<Suppliers> selectAllsuppliers(Suppliers s);

	// 根据id查询一个供应商
	public Suppliers selectone(int id);
	//根据id修改状态(后台)
	int updateSign(Suppliers suppliers);
	//根据id修改（先查询）状态(前台修改供货商信息)

	Suppliers selectsuppliers(Integer id);
	//根据id修改（后修改）状态(前台修改供货商信息)
int upsuppliers(Suppliers suppliers);
		
//**********删除照片************

	int deleteByPrimaryKey1(int id);
}
