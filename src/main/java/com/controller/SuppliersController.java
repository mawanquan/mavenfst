package com.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Suppliers;
import com.service.SuppliersService;

@Controller
public class SuppliersController {
	@Resource(name = "suppliersServiceImp")
	SuppliersService suppliersService;

	// *************************************注册*****************************/

	@RequestMapping("/addSupplier")
	public String addSupplier(Suppliers suppliers, MultipartFile img,
			HttpServletRequest req) {
		String imgpath = req.getServletContext().getRealPath("");

		String img1 = "images";

		String path = imgpath + img1 + img.getOriginalFilename();
		suppliers.setAptitudeimg(img1 + "/"+img.getOriginalFilename());
		try {
			img.transferTo(new File(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		suppliers.setSign("刚注册待审核");
		suppliersService.insert(suppliers);
		return "suppliers/denglu";// 后面要改，登录成功之后是跳转到首页
	}

	/**

	/*@RequestMapping("/addSupplier")
	public String addSupplier(Suppliers suppliers){
		suppliers.setSign("刚注册待审核");
		suppliersService.insert(suppliers);
		return "suppliers/denglu";// 后面要改，登录成功之后是跳转到首页
	}*/
	// *************************** ** 登录(HttpServletRequest req)*****************************************/

	@RequestMapping("/a/selectsupplierqqqq")
	public ModelAndView selectSupplier(Suppliers suppliers,
			HttpServletRequest req) {// ModelAndView是springMvc视频第6课
		/* System.out.println(111); */
		// service
		Suppliers s = suppliersService.selectBylogin(suppliers);
		ModelAndView mv = new ModelAndView();
		// sign(状态)必须是供货商才能输入用户名和密码登录进入后台首页
		if (s != null && "已经是供货商".equals(s.getSign())) {// 判断状态是否为已经是供应商
			req.getSession().setAttribute("supplier", s);
			mv.setViewName("home");
		} else {
			mv.setViewName("/suppliers/denglu");
		}
		mv.addObject("s", s);
		return mv;

	}

	// ***********(修改分两步，先查询后修改)****************
	// **修改(先查询)供货商信息(前台)*****************************************/

	@RequestMapping("/selectsuppliers")
	public ModelAndView selectByPrimaryKey(HttpServletRequest req) {
		System.out.println("sadsadsd");
		Suppliers sup = (Suppliers) req.getSession().getAttribute("supplier");
		 System.out.println(sup+"==============="); 
		Suppliers suppliers = suppliersService.selectsuppliers(sup
				.getSupplierid());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/suppliers/xgxx");
		mv.addObject("suppliers", suppliers);
		return mv;
	}
	// **修改（后修改）供货商信息(前台)*****************************************/

		@RequestMapping("/upsuppliers")
		public ModelAndView upsuppliers(Suppliers suppliers) {
			
				suppliersService.upsuppliers(suppliers);
				ModelAndView mv = new ModelAndView();

				mv.addObject("data", "/jsp/suppliers/xgxx.jsp");
				mv.addObject("suppliers", suppliers);
				return mv;
		}
	//*************************** ** 审核(后台)*****************************************/

		@ResponseBody
		@RequestMapping("/deleteByPrimaryKey1")
		public Integer deleteByPrimaryKey1(HttpServletRequest req, Integer id) {
			
			 Suppliers s=suppliersService.selectone(id);
			String v= s.getAptitudeimg();
			
			String imgpath = req.getServletContext().getRealPath("");
			System.out.println(imgpath+"/"+v);
			String path=imgpath+"/"+v;
			new File(path).delete();
			int num = suppliersService.deleteByPrimaryKey(id);
			return num;
			
		}
	// *************************** **
	// 审核(后台)*****************************************/

	/*******
	 ** 刚注册，待采购员审核**
	 * *******/
	@RequestMapping("/suppliersshenhe1")
	// 对应suppliersxinxi1.jsp
	public ModelAndView suppliersShenhe1() {
		Suppliers s = new Suppliers();
		s.setSign("刚注册待审核");
		List<Suppliers> list = suppliersService.selectAllsuppliers(s);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/suppliers/suppliersshenhe1");
		mv.addObject("list", list);

		return mv;
	}

	/*******
	 ** 刚注册审核通过**
	 * *******/
	@RequestMapping("/suppliersshenhe2")
	// 对应suppliersxinxi2.jsp
	public ModelAndView suppliersShenhe2() {
		Suppliers s = new Suppliers();
		s.setSign("刚注册审核通过(待财务审核)");
		List<Suppliers> list = suppliersService.selectAllsuppliers(s);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/suppliers/suppliersshenhe2");
		mv.addObject("list", list);

		return mv;
	}

	/*******
	 ** 注册审核不通过**
	 * *******/
	@RequestMapping("/suppliersshenhe3")
	// 对应suppliersxinxi3.jsp
	public ModelAndView suppliersShenhe3() {
		Suppliers s = new Suppliers();
		s.setSign("注册审核不通过(待财务审核)");
		List<Suppliers> list = suppliersService.selectAllsuppliers(s);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/suppliers/suppliersshenhe3");
		mv.addObject("list", list);

		return mv;
	}

	/*******
	 ** 待财务审核**
	 * *******/
	@RequestMapping("/suppliersshenhe4")
	// 对应suppliersxinxi4.jsp
	public ModelAndView suppliersShenhe4() {
		Suppliers s = new Suppliers();
		s.setSign("刚注册审核通过(待财务审核)");
		List<Suppliers> list = suppliersService.selectAllsuppliers(s);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/suppliers/suppliersshenhe4");
		mv.addObject("list", list);

		return mv;
	}

	/*******
	 ** 财务审核通过,待交保证金**
	 * *******/
	@RequestMapping("/suppliersshenhe5")
	// 对应suppliersxinxi5.jsp
	public ModelAndView suppliersShenhe5() {
		Suppliers s = new Suppliers();
		s.setSign("财务审核通过,待交保证金");
		List<Suppliers> list = suppliersService.selectAllsuppliers(s);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/suppliers/suppliersshenhe5");
		mv.addObject("list", list);

		return mv;
	}

	/*******
	 ** 财务审核不通过**
	 * *******/
	@RequestMapping("/suppliersshenhe6")
	// 对应suppliersxinxi6.jsp
	public ModelAndView suppliersShenhe6() {
		Suppliers s = new Suppliers();
		s.setSign("财务审核不通过");
		List<Suppliers> list = suppliersService.selectAllsuppliers(s);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/suppliers/suppliersshenhe6");
		mv.addObject("list", list);

		return mv;
	}

	/*******
	 ** 财务审核通过,交完保证金**
	 * *******/
	// @RequestMapping("/suppliersshenhe7")//对应suppliersxinxi4.jsp
	// public ModelAndView suppliersShenhe7() {
	// Suppliers s = new Suppliers();
	// s.setSign("财务审核通过,交完保证金");
	// List<Suppliers> list = suppliersService.selectAllsuppliers(s);
	//
	// ModelAndView mv = new ModelAndView();
	// mv.setViewName("/suppliers/suppliersshenhe7");
	// mv.addObject("list", list);
	//
	// return mv;
	// }
	/*******
	 ** 财务审核通过,未交保证金**
	 * *******/
	/*
	 * @RequestMapping("/suppliersshenhe8")//对应suppliersxinxi4.jsp public
	 * ModelAndView suppliersShenhe8() { Suppliers s = new Suppliers();
	 * s.setSign("财务审核通过,未交保证金"); List<Suppliers> list =
	 * suppliersService.selectAllsuppliers(s);
	 * 
	 * ModelAndView mv = new ModelAndView();
	 * mv.setViewName("/suppliers/suppliersshenhe8"); mv.addObject("list",
	 * list);
	 * 
	 * return mv; }
	 */
	/*******
	 ** **黑名单企业
	 * *******/
	@RequestMapping("/suppliersshenhe7")
	// 对应suppliersxinxi7.jsp
	public ModelAndView suppliersShenhe7() {
		Suppliers s = new Suppliers();
		s.setSign("黑名单企业");
		List<Suppliers> list = suppliersService.selectAllsuppliers(s);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/suppliers/suppliersshenhe7");
		mv.addObject("list", list);

		return mv;
	}

	/*******
	 ** 已经是供货商**
	 * *******/
	@RequestMapping("/suppliersshenhe8")
	// 对应suppliersxinxi8.jsp
	public ModelAndView suppliersShenhe8() {
		Suppliers s = new Suppliers();
		s.setSign("已经是供货商");
		List<Suppliers> list = suppliersService.selectAllsuppliers(s);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/suppliers/suppliersshenhe8");
		mv.addObject("list", list);

		return mv;
	}

	// **************************************供应商的详细信息(suppliersxinxi.jsp)**********************************/
	// 根据id【查询】一个供应商
	@RequestMapping("/selectone/{id}/{view}")
	public ModelAndView selectByPrimaryKeysuppliers(HttpServletRequest req,
			@PathVariable("id") int id, @PathVariable("view") String view) {
		Suppliers suppliers = suppliersService.selectone(id);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/suppliers/" + view);
		mv.addObject("suppliers", suppliers);
		return mv;

	}

	// 根据id【修改】一个供应商状态在【刚注册审核通过页面】(刚注册审核通过(待财务审核)审核通过)
	@RequestMapping("/updateSign/{id}")
	public String updateByPrimaryKeySelective(HttpServletRequest req,
			@PathVariable("id") Integer id) {
		String sign = "刚注册审核通过(待财务审核)";

		Suppliers suppliers = new Suppliers();
		suppliers.setSupplierid(id);
		suppliers.setSign(sign);

		suppliersService.updateSign(suppliers);
		return "redirect:/suppliersshenhe1";
	}

	// 根据id【修改】一个供应商状态在【刚注册审核通过页面】(刚注册审核通过(待财务审核)审核不通过)
	@RequestMapping("/updateSign2/{id}")
	public String updateByPrimaryKeySelective2(HttpServletRequest req,
			@PathVariable("id") Integer id) {
		String sign = "注册审核不通过(待财务审核)";

		Suppliers suppliers = new Suppliers();
		suppliers.setSupplierid(id);
		suppliers.setSign(sign);

		suppliersService.updateSign(suppliers);
		return "redirect:/suppliersshenhe1";
	}

	// 根据id【修改】一个供应商状态在【财务审核页面】(刚注册审核通过(待财务审核)审核通过)
	@RequestMapping("/updateSign3/{id}")
	public String updateByPrimaryKeySelective3(HttpServletRequest req,
			@PathVariable("id") Integer id) {
		String sign = "财务审核通过,待交保证金";

		Suppliers suppliers = new Suppliers();
		suppliers.setSupplierid(id);
		suppliers.setSign(sign);

		suppliersService.updateSign(suppliers);
		return "redirect:/suppliersshenhe4";
	}

	// 根据id【修改】一个供应商状态在【待财务审核页面】(刚注册审核通过(待财务审核)审核不通过)
	@RequestMapping("/updateSign4/{id}")
	public String updateByPrimaryKeySelective4(HttpServletRequest req,
			@PathVariable("id") Integer id) {
		String sign = "财务审核不通过";

		Suppliers suppliers = new Suppliers();
		suppliers.setSupplierid(id);// 传id
		suppliers.setSign(sign);// 根据id来查状态

		suppliersService.updateSign(suppliers);
		return "redirect:/suppliersshenhe4";// 从定向
	}

	// 根据id【修改】一个供应商状态在【待财务通过审核页面】(已是供货商===财务审核通过，交完保证金)
	@RequestMapping("/updateSign5/{id}")
	public String updateByPrimaryKeySelective5(HttpServletRequest req,
			@PathVariable("id") Integer id) {
		String sign = "已经是供货商";

		Suppliers suppliers = new Suppliers();
		suppliers.setSupplierid(id);
		suppliers.setSign(sign);

		suppliersService.updateSign(suppliers);
		return "redirect:/suppliersshenhe5";
	}

	// 根据id【修改】一个供应商状态在【待财务审核页面】(已是供货商，有不良记录===加入黑名单)
	@RequestMapping("/updateSign6/{id}")
	public String updateByPrimaryKeySelective6(HttpServletRequest req,
			@PathVariable("id") Integer id) {
		String sign = "黑名单企业";

		Suppliers suppliers = new Suppliers();
		suppliers.setSupplierid(id);// 传id
		suppliers.setSign(sign);// 根据id来查状态

		suppliersService.updateSign(suppliers);
		return "redirect:/suppliersshenhe7";// 从定向
	}

	// *************************** **
	// 删除(关闭黑名单商家)*****************************************/

	@ResponseBody
	// 异步
	@RequestMapping("/deleteByPrimaryKeyaa")
	public Integer deleteByPrimaryKey(HttpServletRequest req, Integer id) {
		/* System.out.println(id); */
		int num = suppliersService.deleteByPrimaryKey(id);
		/* System.out.println("SDSADASDSd"); */
		return num;
	}
}
