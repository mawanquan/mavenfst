package com.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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

		return "a";
		
		
	}
	
	@RequestMapping("/selecta")
	public String selectaproclamation(HttpServletRequest req) {
		List<Proclamation> list = proclamationService.SelectAll();
		req.setAttribute("list", list);

		return "proclamation/index";
		
		
	}
	
	
    //根据主键修改一个对象
    @RequestMapping("/updateproclamaltion")
    public String updateproclamaltion(Proclamation proclamation,String title,String time,String comment)
    	throws ParseException {
    		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    		java.util.Date date1 = (java.util.Date) formatter.parse(title
    				.replace("T", " "));
    		java.util.Date date2 = (java.util.Date) formatter.parse(time
    				.replace("T", " "));
    		java.util.Date date3 = (java.util.Date) formatter.parse(comment
    				.replace("T", " "));
		    proclamation.setTitle(title);
		    proclamation.setTime(date1);
		    proclamation.setComment(comment);
		   proclamationService.updateByPrimaryKey(proclamation);
    	return null;
    }
	/**
	 * 增加一个对象
	 */
	@RequestMapping("/insertproclamation")
	public String insertProclamation(Proclamation proclamation) {

		int r = proclamationService.insert(proclamation);
		return "a";

	}
	//根据id查询一个对象
	@RequestMapping("//ajaxdelbyid/{id}")
	public ModelAndView ajaxDelById1(@PathVariable("id") Integer id) {
		Proclamation proclamation=proclamationService.selectByPrimaryKey(id);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("b");
		mv.addObject("proclamation", proclamation);
		
		return mv;
	}
	//根据id查询一个对象
		@RequestMapping("//ajaxdelbyid11/{id}")
		public ModelAndView ajaxDelById11(@PathVariable("id") Integer id) {
			Proclamation proclamation=proclamationService.selectByPrimaryKey(id);
			ModelAndView mv=new ModelAndView();
			mv.setViewName("c");
			mv.addObject("proclamation", proclamation);
			
			return mv;
		}
	//根据id删除一个对象
	@ResponseBody
	@RequestMapping("/ajaxdelbyid")
	public Integer ajaxDelById( Integer id) {
		
         int num=this.proclamationService.deleteByPrimaryKey(id);
		return num;

	}

}
