package com.service;

import java.util.List;

import com.bean.Admin;
import com.bean.Branch;
import com.bean.Premeau;
import com.bean.Role;

public interface PremeauService {
	public List<Admin> selAllAdminPre(Admin admin);

	public List<Branch> selBranchNotPre();

	public List<Role> selAllrole();

	public List<Role> selMyRole(Integer id);

	public Integer upPremeauByAdmin(int[] mybox, Integer ids);

	public List<Branch> selAllBranch();

	public List<Role> selMyRoleBranch(Integer id);

	public Integer upPremeauByBranch(int[] mybox, Integer ids);

	public List<Premeau> selAllPremeau();

	public List<Premeau> selMyPremauRole(Integer id);

	public Integer upPremeauByRole(int[] mybox, Integer ids);

	public Role selRolebyid(Integer id);

	public Integer delrolebyid(Integer id);

	public Integer insRole(List<Role> allrole);

	public int upallrole(List<Role> allrole);

	public List<Premeau> selAllPremeautwo();

	public Premeau selPremeauByid(Integer id);

	public int upallPremeau(List<Premeau> allpremeau);

	public int insPremeau(List<Premeau> allpremeau);

	public Integer delPremeauById(Integer id, Integer sta);

	public List<Premeau> selAllPremeaubyprestartid();


}
