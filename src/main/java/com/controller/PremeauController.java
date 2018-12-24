package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Admin;
import com.bean.Branch;
import com.bean.Premeau;
import com.bean.Role;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.AdminService;
import com.service.PremeauService;
import com.sun.javafx.collections.MappingChange.Map;

@Controller
@RequestMapping("/premeau")
public class PremeauController {
	@Resource(name = "premeauServiceImp")
	private PremeauService premeauService;
	@Resource(name = "adminServiceImp")
	private AdminService adminService;

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public PremeauService getPremeauService() {
		return premeauService;
	}

	public void setPremeauService(PremeauService premeauService) {
		this.premeauService = premeauService;
	}

	/**
	 * 
	 * @param pre2
	 * @param pre
	 * @param url
	 * @param prestart
	 * @return
	 */
	@RequestMapping("/upinspremeau")
	public String upInsPremeau(String[] pre2, String[] pre, String[] url,
			Integer[] prestart) {
		List<Premeau> allpremeau2 = new ArrayList<Premeau>();
		if (pre2 != null) {
			for (int i = 0; i < pre2.length; i++) {
				Premeau premeau = new Premeau();
				premeau.setPre(pre2[i]);
				premeau.setPrestart(0);
				premeau.setStart(0);
				allpremeau2.add(premeau);
			}
			int num = this.premeauService.insPremeau(allpremeau2);
		}
		if (pre != null) {
			List<Premeau> allpremeau = new ArrayList<Premeau>();
			for (int i = 0; i < pre.length; i++) {
				Premeau premeau = new Premeau();
				premeau.setPre(pre[i]);
				premeau.setUrl(url[i]);
				premeau.setPrestart(prestart[i]);
				premeau.setStart(0);
				allpremeau.add(premeau);
			}

			int num = this.premeauService.insPremeau(allpremeau);

		}
		return "redirect:/premeau/selallrole?page=1";

	}

	/**
	 * 
	 * @param ids
	 * @param pre
	 * @param url
	 * @return
	 */
	@RequestMapping("/upinspremeau2")
	public String upInsPremeau2(Integer ids, String pre, String url) {

		List<Premeau> allpremeau = new ArrayList<Premeau>();
		Premeau premeau = new Premeau();
		premeau.setId(ids);
		premeau.setPre(pre);
		premeau.setUrl(url);
		allpremeau.add(premeau);

		int num = this.premeauService.upallPremeau(allpremeau);
		return "redirect:/premeau/selallrole?page=1";
	}

	/**
	 * 
	 * @param ids
	 * @param rolename
	 * @return
	 */
	@RequestMapping("/upinsrole")
	public String upInsRole(Integer[] ids, String[] rolename) {
		List<Role> allrole = new ArrayList<Role>();
		if (ids == null) {
			for (int i = 0; i < rolename.length; i++) {
				Role rol = new Role();
				rol.setRolename(rolename[i]);
				rol.setRolestart(0);
				allrole.add(rol);
			}
			int num = this.premeauService.insRole(allrole);
			if (num > 0) {
				return "redirect:/premeau/selallbranch?page=1";
			}

		} else {
			for (int i = 0; i < rolename.length; i++) {
				Role rol = new Role();
				rol.setId(ids[i]);
				rol.setRolename(rolename[i]);
				allrole.add(rol);
			}
			int num = this.premeauService.upallrole(allrole);
			if (num > 0) {
				return "redirect:/premeau/selallbranch?page=1";
			}

		}
		return null;

	}

	/**
	 * 异步根据查询premenu父类
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selpremeaubyprestartid")
	public List<Premeau> selPremeaubyprestartid() {

		List<Premeau> lispre = this.premeauService.selAllPremeaubyprestartid();
		return lispre;

	}

	/**
	 * 异步删除权限根据主键改变状态
	 * 
	 * @param id
	 * @param sta
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delpremeaubyid")
	public Integer delPremeauById(Integer id, Integer sta) {
		Integer num = this.premeauService.delPremeauById(id, sta);
		return num;

	}

	/**
	 * 异步删除根据主键改变状态
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delrolebyid")
	public Integer delRoleById(Integer id) {
		Integer num = this.premeauService.delrolebyid(id);
		return num;

	}

	/**
	 * 异步获取当前用户下的role根据主键
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selrolebyid")
	public Role upRoles(Integer id) {
		Role myrole = this.premeauService.selRolebyid(id);
		return myrole;

	}

	/**
	 * 异步获取premeau通过id
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selpremeaubyid")
	public Premeau upPremeau(Integer id) {
		Premeau mypremeau = this.premeauService.selPremeauByid(id);
		return mypremeau;

	}

	/**
	 * 异步获取当前用户下的role
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/myrole")
	public HashMap<String, List<Role>> selMyRole(Integer id) {
		// 获取所有角色
		HashMap<String, List<Role>> map = new HashMap<String, List<Role>>();
		List<Role> role = this.premeauService.selAllrole();
		List<Role> myrole = this.premeauService.selMyRole(id);
		map.put("allrole", role);
		map.put("myrole", myrole);
		return map;

	}

	/**
	 * 异步获取当前Branch下的role
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/myrolebranch")
	public HashMap<String, List<Role>> selMyRoleBranch(Integer id) {
		// 获取所有角色
		HashMap<String, List<Role>> map = new HashMap<String, List<Role>>();
		List<Role> role = this.premeauService.selAllrole();
		List<Role> myrole = this.premeauService.selMyRoleBranch(id);
		map.put("allrole", role);
		map.put("myrole", myrole);
		return map;
	}

	/**
	 * 异步获取当前role下的premeau
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/myrolepremeau")
	public HashMap<String, List<Premeau>> selMyPremeauRole(Integer id) {
		// 获取所有角色
		HashMap<String, List<Premeau>> map = new HashMap<String, List<Premeau>>();
		List<Premeau> premeau = this.premeauService.selAllPremeautwo();
		List<Premeau> mypremeau = this.premeauService.selMyPremauRole(id);
		map.put("allpremeau", premeau);
		map.put("mypremeau", mypremeau);
		return map;
	}

	/**
	 * 修改当前admin 的 role
	 * 
	 * @param mybox
	 * @param ids
	 * @return
	 */
	@RequestMapping("/upPremeauByAdmin")
	public String upPremeauByAdmin(int[] mybox, Integer ids) {
		Integer num = this.premeauService.upPremeauByAdmin(mybox, ids);
		return "redirect:/premeau/selalladminpre?page=1";

	}

	/**
	 * 修改当前branch 的 role
	 * 
	 * @param mybox
	 * @param ids
	 * @return
	 */
	@RequestMapping("/uppremeaubybranch")
	public String upPremeauByBranch(int[] mybox, Integer ids) {
		Integer num = this.premeauService.upPremeauByBranch(mybox, ids);
		return "redirect:/premeau/selallbranch?page=1";
	}

	/**
	 * 修改当前branch 的 role
	 * 
	 * @param mybox
	 * @param ids
	 * @return
	 */
	@RequestMapping("/uppremeaubyrole")
	public String upPremeauByRole(int[] mybox, Integer ids) {
		Integer num = this.premeauService.upPremeauByRole(mybox, ids);
		return "redirect:/premeau/selallrole?page=1";
	}

	/**
	 * 获取所有的role和用户 以及部门
	 * 
	 * @param page
	 * @param name
	 * @param brid
	 * @param model
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/selalladminpre")
	public String selAllAdminPre(Integer page, String name, String brid,
			Model model, HttpServletRequest request)
			throws UnsupportedEncodingException {
		Admin admin = new Admin();
		Integer id = null;
		if (request.getMethod().equals("GET")) {
			if (name != null && !"".equals(name)) {
				name = new String(name.getBytes("iso-8859-1"), "utf-8");
			}
		}
		if ("0".equals(brid) || null == brid || "".equals(brid)) {
			admin.setBranchid(null);
		} else {
			id = Integer.parseInt(brid);
			admin.setBranchid(id);
		}
		admin.setAdminname(name);
		admin.setAdminstart(0);
		PageHelper.startPage(page, 1);
		// 获取用户
		List<Admin> lisadmin = this.premeauService.selAllAdminPre(admin);
		PageInfo pageinfo = new PageInfo(lisadmin);
		// 获取部门
		List<Branch> lisbranch = this.premeauService.selBranchNotPre();
		model.addAttribute("lisbranchs", lisbranch);
		model.addAttribute("pageinfo", pageinfo);
		model.addAttribute("lisadmin", lisadmin);
		model.addAttribute("name", name);
		model.addAttribute("brid", brid);
		return "premeauset/adminrole";
	}

	/**
	 * 获取所有的role和用户 以及部门
	 * 
	 * @param page
	 * @param model
	 * @return
	 */
	@RequestMapping("/selBranchAll2")
	public String selBranchAll2(Integer page, Model model) {
		PageHelper.startPage(page, 2);
		List<Branch> lisadmin = this.premeauService.selAllBranch();
		PageInfo pageinfo = new PageInfo(lisadmin);
		model.addAttribute("pageinfo", pageinfo);
		model.addAttribute("lisallbranch", lisadmin);
		return "premeauset/branch";

	}

	/**
	 * 部门增删》
	 * 
	 * @ResponseBody
	 * @return
	 */
	@RequestMapping("/selbranchbybranchnameid")
	public List<Branch> selBranchbybranchnameid() {
		List<Branch> a = this.adminService.selByBranchidDetail(0);
		for (Branch branch : a) {
			System.out.println(branch);
		}
		return a;

	}

	/**
	 * 部门增删》根据id查询部门要修改
	 * 
	 * @ResponseBody
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selbranchbyid")
	public Branch selBranchbyid(Integer id) {
		Branch a = this.adminService.selBtanchByid(id);
		return a;

	}

	/**
	 * 部门增删》根据id查询部门要修改
	 * 
	 * @param id
	 * @param sta
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delbranchbyid")
	public Integer delBranchByid(Integer id, Integer sta) {
		int num = this.adminService.delBranch(id, sta);
		return num;

	}

	/**
	 * 部门增删》改获取所有
	 * 
	 *
	 * @param ids
	 * @param branchname
	 * @return
	 */
	@RequestMapping("/upbranch")
	public String upBranch(Integer ids, String branchname) {
		Branch branch = new Branch();
		branch.setId(ids);
		branch.setBranchname(branchname);
		int num = this.adminService.updateBranch(branch);
		return "redirect:/premeau/selBranchAll2/?page=1";

	}

	/**
	 * 增加部门
	 * 
	 * @param branchnameid
	 * @param branchname
	 * @param branchname2
	 * @return
	 */
	@RequestMapping("/insbranch")
	public String insBranch(Integer[] branchnameid, String branchname[],
			String[] branchname2) {
		List<Branch> allbranch = new ArrayList<Branch>();
		if (branchname2 != null) {
			for (int i = 0; i < branchname2.length; i++) {
				Branch premeau = new Branch();
				premeau.setBranchname(branchname2[i]);
				premeau.setBranchnameid(0);
				premeau.setStart(0);
				allbranch.add(premeau);
			}
		}
		if (branchnameid != null) {
			for (int i = 0; i < branchnameid.length; i++) {
				Branch branch = new Branch();
				branch.setBranchname(branchname[i]);
				branch.setBranchnameid(branchnameid[i]);
				branch.setStart(0);
				allbranch.add(branch);
			}
		}
		int num = this.adminService.insBranch(allbranch);

		return "redirect:/premeau/selBranchAll2/?page=1";

	}

	/**
	 * 部门与角色中间表权限设置 角色表修改
	 * 
	 * @param page
	 * @param page2
	 * @param model
	 * @return
	 */
	@RequestMapping("/selallbranch")
	public String selAllBranch(Integer page, Integer page2, Model model) {

		if (page == null) {
			page = 1;
		}
		if (page2 == null) {
			page2 = 1;
		}
		// 角色分页
		PageHelper.startPage(page2, 2);
		List<Role> lisrole = this.premeauService.selAllrole();
		PageInfo pageinfo2 = new PageInfo(lisrole);
		model.addAttribute("pageinfo2", pageinfo2);
		// 部门分页
		PageHelper.startPage(page, 2);
		List<Branch> lisadmin = this.premeauService.selAllBranch();
		PageInfo pageinfo = new PageInfo(lisadmin);
		model.addAttribute("pageinfo", pageinfo);

		model.addAttribute("lisallbranch", lisadmin);
		model.addAttribute("lisrole", lisrole);
		return "premeauset/branchrole";
	}

	/**
	 * 角色与权限 获取所有的角色 权限表修改
	 * 
	 * @param page
	 * @param page2
	 * @param model
	 * @return
	 */
	@RequestMapping("/selallrole")
	public String selAllRole(Integer page, Integer page2, Model model) {
		if (page == null) {
			page = 1;
		}
		if (page2 == null) {
			page2 = 1;
		}

		// 角色分页
		PageHelper.startPage(page, 2);
		List<Role> lisrole = this.premeauService.selAllrole();
		PageInfo pageinfo = new PageInfo(lisrole);
		model.addAttribute("pageinfo", pageinfo);
		// 权限分页
		PageHelper.startPage(page2, 2);
		List<Premeau> lispremeau = this.premeauService.selAllPremeautwo();
		PageInfo pageinfo2 = new PageInfo(lispremeau);
		model.addAttribute("pageinfo2", pageinfo2);

		model.addAttribute("lisallrole", lisrole);
		model.addAttribute("lisallpremeau", lispremeau);
		return "premeauset/rolepremeau";
	}

}
