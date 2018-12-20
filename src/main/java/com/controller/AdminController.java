package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Admin;
import com.bean.Branch;
import com.bean.Premeau;
import com.bean.Suppliers;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.AdminService;
/**
 * @author 马万全
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "adminServiceImp")
	private AdminService adminService;

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping("/tuichu")
	public String goTuichu(HttpServletRequest req) {
		Admin suo = (Admin) req.getSession().getAttribute("user");
		if (suo != null) {
			req.getSession().removeAttribute("supplier");
			return "redirect:/admin/gologinview";
		}
		return "redirect:/admin/gologinview";
	}
	
	
// 查询所有用户数据
	
	/**
	 * @param page
	 * @param name
	 * @param brid
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/selalluser")
	public String selAllUser(Integer page, String name, String brid, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		if (request.getMethod().equals("GET")) {
			if (name != null && !"".equals(name)) {
				name = new String(name.getBytes("iso-8859-1"), "utf-8");
			}
		}
		
		Admin admin = new Admin();
		Integer id = null;
		if ("0".equals(brid) || null == brid || "".equals(brid)) {
			admin.setBranchid(null);
		} else {
			id = Integer.parseInt(brid);
			admin.setBranchid(id);
		}
		admin.setAdminname(name);
		admin.setAdminstart(0);
		PageHelper.startPage(page, 5);
		List<Admin> lisadmin = this.adminService.selAllAdmin(admin);
		PageInfo pageinfo = new PageInfo(lisadmin);
		List<Branch> lisbranch = this.adminService.selBranchNot();
		model.addAttribute("lisbranch", lisbranch);
		model.addAttribute("pageinfo", pageinfo);
		model.addAttribute("lisuser", lisadmin);
		model.addAttribute("name", name);
		model.addAttribute("brid", brid);
		return "manage/manageadmin";
	}

	@ResponseBody
	@RequestMapping("/ajaxbranch")
	public List<Branch> ajaxBranch(Integer branchnameid) {
		List<Branch> lisbranch = this.adminService.selByBranchid(branchnameid);
		return lisbranch;

	}

	@ResponseBody
	@RequestMapping("/ajaxbyid")
	public List<Branch> ajaxById(Integer id) {
		List<Branch> lisbranchs = this.adminService.selByBranchidDetail(id);
		return lisbranchs;

	}
//添加与修改用户
@RequestMapping("/addinsertadmin")
	public String addInsAdmin(Admin admin, Model model) {
		System.out.println(admin.getId());
		//
		if (0 == admin.getBranchid() || null == admin.getBranchid()) {
			model.addAttribute("admin", admin);
			model.addAttribute("message", "请分配部门");
			return "manage/manageadd";
		}
		// 设置状态与修改时间
		admin.setAdminstart(0);
		Date data = new Date();
		admin.setAdmindate(data.toString());
		// 判断增加还是修改
		// 有id修改
		if (admin.getId() != null) {
			int num = this.adminService.updateAdmin(admin);
			if (num > 0) {
				model.addAttribute("message", "修改成功");
				return "manage/manageadmin";
			}
			model.addAttribute("message", "更新错误");
			return "manage/manageadd";
		} else {
			// 增加用户
			Admin adminpo = this.adminService.selByAdminName(admin);
			if (adminpo != null) {
				model.addAttribute("adminpwd", admin.getAdminpwd());
				model.addAttribute("message", "用户请重新输入名已存在");
				return "manage/manageadd";
			}
			int num = this.adminService.addInsAdmin(admin);
			if (num > 0) {
				model.addAttribute("message", "seccuss");
				return "manage/manage";
			} 
		}
		return null;
	}

// 修改用户从后台获取信息给前台页面
	@RequestMapping("/tomanageadd")
	public String toManageadd(Integer id, Model model) {
		Admin admin = this.adminService.selById(id);
		model.addAttribute("admin", admin);
		return "manage/manageadd";
	}
//登录
	@RequestMapping("/gologin")
	public String goLogain(Admin adminVo, Model model,
			HttpServletRequest request) {
		Admin adminPo = this.adminService.selByAdminName(adminVo);
		if (adminPo != null) {
			if (adminVo.getAdminpwd().equals(adminPo.getAdminpwd())) {
				HttpSession session = request.getSession();
				session.setAttribute("user", adminPo);
				List<Premeau> lispremeau=this.adminService.selPremenuByAdminid(adminPo.getId());
				session.setAttribute("lispremeau", lispremeau);
				HashMap<String, Object> map = (HashMap<String, Object>) session.getAttribute("map");
				session.removeAttribute("map");
				if (map != null) {
					return (String) map.get("path");
				}
				return "manage/manage";
			} else {
				model.addAttribute("message", "密码错误");
				return "manage/managelogin";
			}

		} else {
			model.addAttribute("message", "用户名不存在");
			return "manage/managelogin";
		}
	}

	@ResponseBody
	@RequestMapping("/deladmin")
	public Integer delAdmin(Integer id) {
		System.out.println("ok--------------------------------" + id);
		Integer num = this.adminService.delAdmin(id);
		System.out.println(num);
		return num;

	}

	@RequestMapping("/gologinview")
	public String goLoginView() {
		return "manage/managelogin";
	}

	@RequestMapping("/goaddadminview")
	public String goAddAdminView() {
		return "manage/manageadd";
	}

	
	
}
