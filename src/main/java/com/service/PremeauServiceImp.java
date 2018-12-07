package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Admin;
import com.bean.Branch;
import com.bean.Premeau;
import com.bean.Role;
import com.dao.AdminMapper;
import com.dao.BranchMapper;
import com.dao.PremeauMapper;
import com.dao.RoleMapper;

@Service("premeauServiceImp")
public class PremeauServiceImp implements PremeauService {
	@Resource(name = "adminMapper")
	private AdminMapper adminMapper;
	@Resource(name = "branchMapper")
	private BranchMapper branchMapper;
	@Resource(name = "premeauMapper")
	private PremeauMapper premeauMapper;
	@Resource(name = "roleMapper")
	private RoleMapper roleMapper;

	public RoleMapper getRoleMapper() {
		return roleMapper;
	}

	public void setRoleMapper(RoleMapper roleMapper) {
		this.roleMapper = roleMapper;
	}

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
	public List<Admin> selAllAdminPre(Admin admin) {
		List<Admin> lis = this.adminMapper.selAllAdmin(admin);
		return lis;

	}

	// 查询所有不是父部门的部门
	@Override
	public List<Branch> selBranchNotPre() {
		List<Branch> lis = this.branchMapper.selByBranchNot();
		return lis;
	}

	// 查询所有的角色
	@Override
	public List<Role> selAllrole() {
		return this.roleMapper.selAllRole();
	}

	// 查询当前用户下的角色
	@Override
	public List<Role> selMyRole(Integer id) {
		List<Role> rl = this.roleMapper.selMyRole(id);
		return rl;
	}

	@Override
	// 删除admin与role中间表 与adminID相关的id
	public Integer upPremeauByAdmin(int[] mybox, Integer ids) {
		List<Map<String, Object>> rolemap = this.roleMapper
				.selAdminandRole(ids);
		Integer num = 0;
		System.out.println(rolemap);
		if (rolemap != null) {
			num = this.roleMapper.delPoleByAdminId(ids);
		}
		if (mybox != null) {
			for (int i : mybox) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("adminid", ids);
				map.put("roleid", i);
				this.roleMapper.insRoleByAdminId(map);
			}

		}
		return num;
	}

	// ---------------部门与角色
	// 查询所有部门
	@Override
	public List<Branch> selAllBranch() {
		List<Branch> lisbranch = this.branchMapper.selByBranchid(0);
		for (Branch branch : lisbranch) {
			List<Branch> lisbranchtwo = this.branchMapper
					.selByBranchidDetail(branch.getId());
			branch.setLisbranch(lisbranchtwo);
		}
		return lisbranch;
	}

	// 查询当前所有branch角色以及当前所有角色
	@Override
	public List<Role> selMyRoleBranch(Integer id) {
		List<Role> lisrole = this.roleMapper.selMyRoleBranch(id);

		return lisrole;
	}

	// 修改删除当前部门与角色用户中间表
	@Override
	public Integer upPremeauByBranch(int[] mybox, Integer ids) {
		List<Map<String, Object>> rolemap = this.roleMapper
				.selBranchandRole(ids);
		Integer num = 0;
		if (rolemap != null) {
			num = this.roleMapper.delPoleByBranchid(ids);
		}
		if (mybox != null) {
			for (int i : mybox) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("branchid", ids);
				map.put("roleid", i);
				this.roleMapper.insRoleByBranchId(map);
			}

		}
		return num;

	}

	// ---------------角色与权限
	@Override
	public List<Premeau> selAllPremeau() {

		return this.premeauMapper.selALLPremeau();
	}

	@Override
	public List<Premeau> selMyPremauRole(Integer id) {
		return this.premeauMapper.selPremeauByRoleId2(id);
	}

	@Override
	public Integer upPremeauByRole(int[] mybox, Integer ids) {
		List<Premeau> premeaumap = this.premeauMapper.selPremeauByRoleId(ids);
		Integer num = 0;
		System.out.println(premeaumap.size()+"ssssssdsdsdsdsds");
		if (premeaumap.size()!=0) {
			this.premeauMapper.delPromeanByRoleid(ids);
			num = 1;
		}
		if (mybox != null) {
			for (int i : mybox) {
				Premeau prem=	this.premeauMapper.selectByPrimaryKey(i);
				Premeau pre=this.premeauMapper.selPrestartAndRoleid(ids,prem.getPrestart());
				if(pre==null){
					System.out.println(prem.getPrestart()+"sdasdasdsdsdsall");
					Map<String, Object> ma=new HashMap<String, Object>();
					ma.put("roleid", ids);
					ma.put("premeauid", prem.getPrestart());
					this.premeauMapper.insPremeauByRoleid(ma);
				}
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("roleid", ids);
				map.put("premeauid", i);
				this.premeauMapper.insPremeauByRoleid(map);
			}

		}
		return num;
	}

	@Override
	public Role selRolebyid(Integer id) {
		Role role = this.roleMapper.selectByPrimaryKey(id);
		return role;
	}

	// 删除修改role 状态
	@Override
	public Integer delrolebyid(Integer id) {
		Role role = this.roleMapper.selectByPrimaryKey(id);
		role.setRolestart(1);
		Integer num = this.roleMapper.updateByPrimaryKeySelective(role);
		return num;
	}

	@Override
	// 批量增加role
	public Integer insRole(List<Role> allrole) {
		Integer num = this.roleMapper.insRoleall(allrole);
		return num;
	}
//批量修改
	@Override
	public int upallrole(List<Role> allrole) {
		Integer num = 0;
		for (Role role : allrole) {
			num = this.roleMapper.updateByPrimaryKeySelective(role);
		}
		return num;
	}

	// 查询权限父与子所有类
	@Override
	public List<Premeau> selAllPremeautwo() {
		List<Premeau> lisone = this.premeauMapper.selPremeauByPrestart(0);
		for (Premeau premeau : lisone) {
			List<Premeau> pre = this.premeauMapper.selPremeauByPrestart(premeau
					.getId());
			premeau.setListpremeau(pre);
		}
		return lisone;
	}

	@Override
	public Premeau selPremeauByid(Integer id) {
		return this.premeauMapper.selectByPrimaryKey(id);
	}
//批量修改权限
	@Override
	public int upallPremeau(List<Premeau> allpremeau) {
		Integer num = 0;
		for (Premeau premeau : allpremeau) {
			num = this.premeauMapper.updateByPrimaryKeySelective(premeau);
		}
		return num;
	}

	@Override
	public int insPremeau(List<Premeau> allpremeau) {
		
		
		return this.premeauMapper.insAllPremeau(allpremeau);
	}

	@Override
	public Integer delPremeauById(Integer id, Integer sta) {
		if (sta == 0) {
			int num = 0;
			List<Premeau> lisone = this.premeauMapper.selPremeauByPrestart(id);
			if (lisone.size() == 0) {
				Premeau premeau = this.premeauMapper.selectByPrimaryKey(id);
				premeau.setStart(1);
				num = this.premeauMapper.updateByPrimaryKeySelective(premeau);
				return num;
			}else{
				
				return 0;
			}
			
		}else if(sta==1){
			List<Premeau> lisone = this.premeauMapper.selPremeauByPrestart(id);
			for (Premeau premeaus : lisone) {
				premeaus.setStart(1);
				this.premeauMapper.updateByPrimaryKeySelective(premeaus);
			}
			Premeau premeau = this.premeauMapper.selectByPrimaryKey(id);
			premeau.setStart(1);
			int num = this.premeauMapper.updateByPrimaryKeySelective(premeau);
			return num;
			
		}
		return null;

	}

	@Override
	public List<Premeau> selAllPremeaubyprestartid() {
		return this.premeauMapper.selPremeauByPrestart(0);
	}



}
