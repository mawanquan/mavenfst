package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

		PageHelper.startPage(page, 6);// 第几页，每页条数
		List<Complain> list = complainService.selectcomplain();// 查询所有
		PageInfo pageInfo = new PageInfo(list);// 就是一个包含了分页数据的对象

		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		return "/tousu/showallcomplain";
	}

	/**
	 * 根据主键查询一个对象
	 */
	@RequestMapping("/selectcomplainById")
	public String selectcomplainById(HttpServletRequest req, Integer id) {
		Complain complain = (Complain) complainService.selectcomplainById(id);
		req.setAttribute("complain", complain);
		return "/tousu/selectbyprimarykeycomplain";
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
		complain.setSuppliersid(sl.getSupplierid());
		complain.setName(sl.getSuppliername());
		int r = complainService.insert(complain);
		return "redirect:/selectcomplain?page=1";
	}

	/*
	 * 根据登录用户查询自己所有投诉内容
	 */
	@RequestMapping("/selectcomplainBysupplierid")
	public String selectcomplainBysupplierid2(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Suppliers sl = (Suppliers) session.getAttribute("supplier");
		System.out.println(sl.getSupplierid());
		List<Complain> list3 = complainService.selectcomplainBysupplierid(sl
				.getSupplierid());
		req.setAttribute("list3", list3);
		req.setAttribute("data", "/jsp/tousu/selectcomplainBysupplierid.jsp");
		return "/toubiaofront/toubiaomain";
	}

	/**
	 * 根据主键查询一个对象
	 */
	@RequestMapping("/selectcomplainById2")
	public String selectcomplainById2(HttpServletRequest req, Integer id) {
		Complain complain = (Complain) complainService.selectcomplainById2(id);
		req.setAttribute("complain", complain);
		return "/tousu/selectcomplainById2";
	}

	/**
	 * 统计供货商地址信息
	 */
	@RequestMapping("/tongji")
	public String selectAddress(HttpServletRequest req) {
		List<Map<String, Object>> list4 = complainService.selectAddress();
		req.setAttribute("list4", list4);

		List<List<Object>> list = new ArrayList<List<Object>>();
		for (Map<String, Object> map : list4) {

			List<Object> lis2 = new ArrayList<Object>();
			lis2.add("'" + map.get("address") + "'");
			lis2.add(map.get("num"));
			list.add(lis2);
		}
		req.setAttribute("list", list);

		return "/tousu/tongji";
	}

	/**
	 * 统计个月采购信息
	 */
	@RequestMapping("/selectgoodsprice")
	public String selectgoodsprice(HttpServletRequest req) {
		List<Map<String, Object>> list5 = complainService.selectgoodsprice();

		List<Integer> listaaa = new ArrayList<Integer>();
		for (int i = 1; i <= 12; i++) {
			listaaa.add(0);
		}
		for (Map<String, Object> map : list5) {
			int a = Integer.parseInt(map.get("mon").toString());// 月份
			listaaa.set(a - 1, Integer.parseInt(map.get("num").toString()));
		}

		req.setAttribute("list5", listaaa);

		return "/tousu/selectgoodsprice";
	}

	/**
	 * 统计个月招标信息
	 */
	@RequestMapping("/selectdeclare")
	public String selectdeclare(HttpServletRequest req, String year) {
		List<Map<String, Object>> list5 = complainService.selectdeclare(year);

		List<Integer> listaaa = new ArrayList<Integer>();
		for (int i = 1; i <= 12; i++) {
			listaaa.add(0);
		}
		for (Map<String, Object> map : list5) {
			int a = Integer.parseInt(map.get("mon").toString());// 月份
			listaaa.set(a - 1, Integer.parseInt(map.get("num").toString()));
		}

		req.setAttribute("list5", listaaa);

		return "/tousu/selectdeclaress";
	}

	/**
	 * 统计各年招聘信息
	 */
	@RequestMapping("/selectdeclareyear")
	public String selectdeclareyear(HttpServletRequest req) {
		List<Map<String, Object>> list4 = complainService.selectdeclareyear();
		req.setAttribute("list4", list4);

		List<List<Object>> list = new ArrayList<List<Object>>();
		for (Map<String, Object> map : list4) {

			List<Object> lis2 = new ArrayList<Object>();
			lis2.add("'" + map.get("applydate") + "'");
			lis2.add(map.get("countNum"));
			list.add(lis2);
		}
		req.setAttribute("list", list);

		return "/tousu/selectdeclareyear";
	}
}