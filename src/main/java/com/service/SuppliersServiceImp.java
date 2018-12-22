package com.service;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.bean.Suppliers;
import com.dao.SuppliersMapper;
import com.redisdao.RedisDao;

@Service
public class SuppliersServiceImp implements SuppliersService {
	@Resource(name = "suppliersMapper")
	SuppliersMapper suppliersMapper;
	
	@Resource(name = "redisDaoImp")
	RedisDao redisDao;

	// **********注册*********
	@Override
	public int insert(Suppliers record) {

		return suppliersMapper.insert(record);
	}

	// 删除
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

	// 根据id修改状态

	@Override
	public int updateSign(Suppliers suppliers) {
		return suppliersMapper.updateByPrimaryKeySelective(suppliers);
	}

	
	@Override
	public Suppliers selectsuppliers(Integer id) {
		return this.suppliersMapper.selectByPrimaryKey(id);
	}

	

	@Override
	public int upsuppliers(Suppliers suppliers) {

		return suppliersMapper.updateByPrimaryKeySelective(suppliers);
	}


	@Override
	public int deleteByPrimaryKey1(int id) {

		return suppliersMapper.deleteByPrimaryKey(id);
	}
	
	
	// 增加redis手机对应的短信
	public boolean setRedisData(String key, String value) {
		return redisDao.setData(key, value);
	}
	// 查询redis手机对应的短信
	@Override
	public boolean getRedisData(String key,String val) {
		String valpo=redisDao.getData(key);
		if(val!=null&&valpo!=null&&val.equals(valpo)){
			return true;
		}else{
			return false;
		}
	}
}