package com.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Premeau;
import com.bean.Role;
@Repository("premeauMapper")
public interface PremeauMapper extends Mapper<Premeau> {
	public List<Premeau> selPremeauByAdminid(Integer id);
	 
	public List<Premeau> selPremeauByPrestart(Integer id);

	public  List<Premeau> selALLPremeau();

	public List<Premeau> selPremeauByRoleId(Integer id);
	public List<Premeau> selPremeauByRoleId2(Integer id);

	public void delPromeanByRoleid(Integer ids);

	public void insPremeauByRoleid(Map<String, Object> map);

	public int insAllPremeau(List<Premeau> allpremeau);

	public List<Premeau> selPremeauByPrestart2(Integer id,Integer prestart);

	public Premeau selPrestartAndRoleid(Integer ids, Integer prestart);

	public void insroleandpremeau(Map<String, Object> ma);
	

	
}