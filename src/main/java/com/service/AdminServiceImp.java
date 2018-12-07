package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Admin;
import com.bean.Branch;
import com.bean.Premeau;
import com.dao.AdminMapper;
import com.dao.BranchMapper;
import com.dao.PremeauMapper;

@Service("adminServiceImp")
public class AdminServiceImp implements AdminService {
	@Resource(name ="adminMapper")
	private AdminMapper adminMapper;
	@Resource(name="branchMapper")
	private BranchMapper branchMapper;
	@Resource(name="premeauMapper")
	private PremeauMapper premeauMapper;
	
	public PremeauMapper getPremeauMapper() {
		return premeauMapper;
	}

	public void setPremeauMapper(PremeauMapper premeauMapper) {
		this.premeauMapper = premeauMapper;
	}

	public BranchMapper getBranchMapper() {
		return branchMapper;
	}

	public void setBranchMapper(BranchMapper branchMapper) {
		this.branchMapper = branchMapper;
	}

	public AdminMapper getAdminMapper() {
		return adminMapper;
	}

	public void setAdminMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}
 
	@Override
	public List<Admin> selAllAdmin(Admin  admin) { 
		List<Admin> lis = this.adminMapper.selAllAdmin(admin);
		return lis;
  
	}
	@Override//查询父部门为0时
	public List<Branch> selByBranchid(int branchnameid){
		List<Branch> lis=this.branchMapper.selByBranchid(branchnameid);
		return lis;
		
		
	}

	@Override//查询子部门根据父部门id
	public List<Branch> selByBranchidDetail(Integer id) {
		List<Branch> lis=this.branchMapper.selByBranchidDetail(id);
		return lis;
	}

	@Override//登录注册根据名字返回用户
	public Admin selByAdminName(Admin Voadmin) {
		Admin Poadmin=this.adminMapper.selByAdminName(Voadmin);
		return Poadmin;
	}

	@Override//增加用户
	public Integer addInsAdmin(Admin admin) {
		int num=this.adminMapper.insertSelective(admin);
		return num;
	}

	@Override//根据id查询用户
	public Admin selById(Integer id) {
		return this.adminMapper.selectByPrimaryKey(id);
	}

	@Override//修改用户
	public Integer updateAdmin(Admin admin) {
		Integer num=this.adminMapper.updateByPrimaryKeySelective(admin);
		return num;
	}

	@Override//删除修改状态
	public Integer delAdmin(Integer id) {
		Integer  start=1;
	 Admin admin=this.adminMapper.selectByPrimaryKey(id);
	 admin.setAdminstart(start);
	 Integer num=this.adminMapper.updateByPrimaryKeySelective(admin);
		return num;
	}

	@Override//查询所有子部门
	public List<Branch> selBranchNot() {
		List<Branch> lis=this.branchMapper.selByBranchNot();
		return lis;
	}

	@Override
	//通过用户id查询当前用户权限
	public List<Premeau> selPremenuByAdminid(Integer id) {
		List<Premeau> lis=this.premeauMapper.selPremeauByAdminid(id);
		for (Premeau premeau : lis) {
			List<Premeau> list=this.premeauMapper.selPremeauByPrestart2(id,premeau.getId());
			if(list==null){
				lis.remove(premeau);
			}
			premeau.setListpremeau(list);
		}
		return lis;
	}

	@Override
	public Branch selBtanchByid(Integer id) {
		return this.branchMapper.selectByPrimaryKey(id);
	}

	@Override
	public Integer updateBranch(Branch branch) {
		return this.branchMapper.updateByPrimaryKeySelective(branch);
	}

	@Override
	public int insBranch(List<Branch> allbranch) {
		
		int num=this.branchMapper.insAllBranch(allbranch);
		return num;
	}

	@Override
	public Integer delBranch(Integer id,Integer sta) {
		
		if (sta == 0) {
			int num = 0;
			List<Branch> lisone = this.branchMapper.selByBranchidDetail(id);
			if (lisone.size() == 0) {
				Branch branch=this.branchMapper.selectByPrimaryKey(id);
				branch.setStart(1);
				num = this.branchMapper.updateByPrimaryKeySelective(branch);
				return num;
			}else{
				
				return 0;
			}
			
		}else if(sta==1){
			List<Branch> lisone = this.branchMapper.selByBranchidDetail(id);
			for (Branch branch : lisone) {
				branch.setStart(1);
				 this.branchMapper.updateByPrimaryKeySelective(branch);
			}
			Branch branch=this.branchMapper.selectByPrimaryKey(id);
			branch.setStart(1);
			int num = this.branchMapper.updateByPrimaryKeySelective(branch);
			return num;
		}
		return null;
	}



	
}
