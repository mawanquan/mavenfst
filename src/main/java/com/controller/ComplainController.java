package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Complain;
import com.bean.Suppliers;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.ComplainService;

@Controller
public class ComplainController {

	@Resource(name = "complainServiceImp")
	ComplainService complainService;// 依赖service层

	/**
	 * 分页查询查询所有的数据
	 */
	@RequestMapping("/selectcomplain")
	public String selectcomplain(HttpServletRequest req, Integer page) {

		PageHelper.startPage(page, 2);// 第几页，每页条数
		List<Complain> list = complainService.selectcomplain();// 查询所有
		PageInfo pageInfo = new PageInfo(list);// 就是一个包含了分页数据的对象

		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		return "showallcomplain";
	}

	/**
	 * 根据主键查询一个对象
	 */
	@RequestMapping("/selectcomplainById")
	public String selectcomplainById(HttpServletRequest req, Integer id) {
		Complain complain = (Complain) complainService.selectcomplainById(id);
		req.setAttribute("complain", complain);
		return "selectbyprimarykeycomplain";
	}

	/**
	 * 根据主键删除一个对象
	 */
	@RequestMapping("/deletebyprimarykeycomplain")
	public String deleteByPrimaryKeyComplain(HttpServletRequest req, Integer id) {
		int r = complainService.deleteByPrimaryKey(id);
		return "redirect:/selectallcomplain?page=1";
	}

	/**
	 * 根据主键修改一个对象
	 */
	@RequestMapping("/is/updatebyprimarykeycomplain.html")
	public String updateByPrimaryKeyComplain(Complain complain) {
		int r = complainService.updateByPrimaryKey(complain);
		return "updatebyprimarykeycomplain";
	}

	/**
	 * 增加一个对象
	 */
	@RequestMapping("/insertComplain")
	public String insertComplain(Complain complain, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Suppliers sl = (Suppliers) session.getAttribute("supplier");
		System.out.println(sl.getSupplierid() + "" + sl.getSuppliername());
		complain.setSuppliersid(sl.getSupplierid());

		complain.setName(sl.getSuppliername());
		int r = complainService.insert(complain);
		return "redirect:/selectcomplain?page=1";

	}
}
