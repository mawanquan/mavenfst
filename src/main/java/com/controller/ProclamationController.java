package com.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;
import com.bean.Admin;
import com.bean.Proclamation;
import com.bean.Suppliers;
import com.service.ProclamationService;

@Controller
public class ProclamationController {

	private static final Proclamation proclamation = null;
	@Resource(name = "proclamationServiceImp")
	ProclamationService proclamationService;// 依赖service层

	// 查询所有的

	@RequestMapping("/select")
	public String selectproclamation(HttpServletRequest req) {
		List<Proclamation> list = proclamationService.SelectAll();
		req.setAttribute("list", list);

		return "proclamation/a";

	}
	@RequestMapping("/selectselect")
	public String selectproclamation11(HttpServletRequest req) {
		List<Proclamation> list = proclamationService.SelectAll();
		req.setAttribute("list", list);

		return "proclamation/gengduo";

	}
	@RequestMapping("/select1")
	public String selectproclamation1(HttpServletRequest req) {
		List<Proclamation> list = proclamationService.SelectAll();
		req.setAttribute("list", list);

		return "jiapage/gongyingshanggonggao";

	}
	
	
	@RequestMapping("/selecta")
	public String selectaproclamation(HttpServletRequest req) {
		List<Proclamation> list = proclamationService.SelectAll();
		req.setAttribute("list", list);

		return "proclamation/index";

	}
	@RequestMapping(value="/selecta1")
	public String selectaproclamationa(HttpServletRequest req,Integer page) {
//		PageHelper.startPage(page, 2);// 第几页，每页条数
	
		List<Proclamation> list = proclamationService.SelectAll();
//		PageInfo pageInfo = new PageInfo(list);// 就是一个包含了分页数据的对象
		req.setAttribute("list", list);
//		req.setAttribute("pageInfo", pageInfo);
		return "proclamation/T";

	}

	// 修改一个对象
	@RequestMapping(value = "/updateproclamaltion")
	public String updateproclamaltion(Proclamation proclamation,Integer id, String title,Date time,
			String comment) {
		System.out.println("hshsh");
		proclamation.setId(id);
		proclamation.setTitle(title);
		proclamation.setTime(time);
		proclamation.setComment(comment);
		proclamationService.updateByPrimaryKey(proclamation);
		return "proclamation/e";
	}

	/**
	 * 增加一个对象
	 */
	@RequestMapping("/insertproclamation")
	public String insertProclamation(Proclamation proclamation, HttpServletRequest req) {
		
		HttpSession sessiion = req.getSession();
		Admin ad = (Admin) sessiion.getAttribute("user");
		
		
		proclamation.setNumber(ad.getId());
		proclamationService.insert(proclamation);
		return "proclamation/e";

	}

	// 根据id查询一个对象
	@RequestMapping("//ajaxdelbyid/{id}")
	public ModelAndView ajaxDelById1(@PathVariable("id") Integer id) {
		Proclamation proclamation = proclamationService.selectByPrimaryKey(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("proclamation/b");
		mv.addObject("proclamation", proclamation);

		return mv;
	}

	// 根据id查询一个对象
	@RequestMapping("//ajaxdelbyid11/{id}")
	public ModelAndView ajaxDelById11(@PathVariable("id") Integer id) {
		Proclamation proclamation = proclamationService.selectByPrimaryKey(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("proclamation/c");
		mv.addObject("proclamation", proclamation);

		return mv;
	}

	// 根据id删除一个对象
	@ResponseBody
	@RequestMapping("/ajaxdelbyid")
	public Integer ajaxDelById(Integer id) {

		int num = this.proclamationService.deleteByPrimaryKey(id);
		return num;

	}

}