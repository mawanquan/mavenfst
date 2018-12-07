package com.service;

import java.util.List;

import com.bean.Admin;
import com.bean.Branch;
import com.bean.Premeau;

public interface AdminService {

	List<Admin> selAllAdmin(Admin admin);

	public List<Branch> selByBranchid(int id);

	List<Branch> selByBranchidDetail(Integer id);

	Admin selByAdminName(Admin admin);

	Integer addInsAdmin(Admin admin);

	Admin selById(Integer id);

	Integer updateAdmin(Admin admin);

	Integer delAdmin(Integer id);

	public List<Branch> selBranchNot();

	public List<Premeau> selPremenuByAdminid(Integer id);

	Branch selBtanchByid(Integer id);

	Integer updateBranch(Branch branch);

	int insBranch(List<Branch> allbranch);

	Integer delBranch(Integer id,Integer sta);


}
