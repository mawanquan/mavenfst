package com.service;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.bean.Suppliers;
import com.dao.SuppliersMapper;

@Service
public class SuppliersServiceImp implements SuppliersService {
	@Resource(name = "suppliersMapper")
	SuppliersMapper suppliersMapper;

	// **********注册*********
	@Override
	public int insert(Suppliers record) {

		return suppliersMapper.insert(record);
	}
//删除
	@Override
	public int deleteByPrimaryKey(int id) {

		return suppliersMapper.deleteByPrimaryKey(id);
	}

	// *** 登录*********
	@Override
	public Suppliers selectBylogin(Suppliers suppliers) {
		return suppliersMapper.selectOne(suppliers);
	}

	// ***审核*********
	@Override
	public List<Suppliers> selectAllsuppliers(Suppliers s) {

		return suppliersMapper.select(s);
	}

	// 根据id查询一个供应商
	@Override
	public Suppliers selectone(int id) {
		return suppliersMapper.selectByPrimaryKey(id);
	}

	// 根据id修改状态(后台)

	@Override
	public int updateSign(Suppliers suppliers) {
		return suppliersMapper.updateByPrimaryKeySelective(suppliers);
	}
	
	//修改(先查询)供货商信息(前台)
	@Override
	public Suppliers selectsuppliers(Integer id) {
		return this.suppliersMapper.selectByPrimaryKey(id);
	}
	//修改(后修改)供货商信息(前台)
	
	@Override
	public int upsuppliers(Suppliers suppliers) {
		
		return suppliersMapper.updateByPrimaryKeySelective(suppliers);
	}
	
	//删除照片
		@Override
		public int deleteByPrimaryKey1(int id) {

			return suppliersMapper.deleteByPrimaryKey(id);
		}


	
}