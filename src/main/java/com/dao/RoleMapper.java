package com.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Role;
@Repository("roleMapper")
public interface RoleMapper extends Mapper<Role> {
	public List<Role> selAllRole();

	public List<Role> selMyRole(Integer id);

	public Integer delPoleByAdminId(Integer ids);

	public void insRoleByAdminId(Map<String, Object> map);

	public List<Map<String, Object>> selAdminandRole(Integer ids);

	public List<Role> selMyRoleBranch(Integer id);

	public List<Map<String, Object>> selBranchandRole(Integer ids);

	public Integer delPoleByBranchid(Integer ids);

	public void insRoleByBranchId(Map<String, Object> map);

	public Integer insRoleall(List<Role> allrole);
}