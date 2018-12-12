package com.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Declarefile;
import com.bean.Declareform;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.DeclareformService;
import com.test.WordToHtml;

import fr.opensagres.xdocreport.document.json.JSONObject;

@Controller("declareformController")
public class DeclareformController {
	@Resource(name = "declareformServiceImp")
	DeclareformService declareformService;

	@RequestMapping(value = "/data")
	public ModelAndView show1(Integer page) {
		PageHelper.startPage(page, 5);
		List<Declareform> list = declareformService.selectAllBysign(0,1);
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/zhaobiao");
		mv.addObject("data", "/jsp/zhaobiao/zzzb.jsp");
		mv.addObject("list", list);
		mv.addObject("active", 1);
		mv.addObject("path", "data");
		mv.addObject("pg", pg);
		return mv;
	}
	@RequestMapping(value = "/maindata")
	public ModelAndView mainshow(Integer page) {
//		PageHelper.startPage(page, 8);
		List<Declareform> list = declareformService.selectAllBysign(0,1);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/listshow");
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value = "/data2/{page}")
	public ModelAndView show2(@PathVariable("page") int page) {
		PageHelper.startPage(page, 5);
		List<Declareform> list = declareformService.selectAllBysign(1,1);
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/zhaobiao");
		mv.addObject("data", "/jsp/zhaobiao/jjkb.jsp");
		mv.addObject("list", list);
		mv.addObject("active", 2);
		mv.addObject("path", "data2");
		mv.addObject("pg", pg);
		return mv;
	}
	@RequestMapping(value = "/maindata2")
	public ModelAndView mainshow2(Integer page) {
//		PageHelper.startPage(page, 8);
		List<Declareform> list = declareformService.selectAllBysign(1,1);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/listshow");
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping(value = "/data3/{page}")
	public ModelAndView show3(@PathVariable("page") int page) {
		PageHelper.startPage(page, 5);
		List<Declareform> list = declareformService.selectAllBysign(2,1);
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/zhaobiao");
		mv.addObject("data", "/jsp/zhaobiao/jszb.jsp");
		mv.addObject("list", list);
		mv.addObject("active", 3);
		mv.addObject("path", "data3");
		mv.addObject("pg", pg);
		return mv;
	}
	@RequestMapping(value = "/maindata3")
	public ModelAndView mainshow3(Integer page) {
//		PageHelper.startPage(page, 8);
		List<Declareform> list = declareformService.selectAllBysign(2,1);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/listshow");
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping(value = "/search")
	public ModelAndView search(Integer page, String title) {

		PageHelper.startPage(page, 5);
		List<Declareform> list = declareformService.selectAllByTitle(title, 0,1);
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/zhaobiao");
		mv.addObject("data", "/jsp/zhaobiao/zzzb.jsp");
		mv.addObject("list", list);
		mv.addObject("active", 1);
		mv.addObject("path", "search");
		mv.addObject("title", title);
		mv.addObject("pg", pg);
		return mv;
	}

	@RequestMapping(value = "/search2/{page}")
	public ModelAndView search2(@PathVariable("page") int page, String title) {
		PageHelper.startPage(page, 5);
//		System.out.println(title);
		List<Declareform> list = declareformService.selectAllByTitle(title, 1,1);
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/zhaobiao");
		mv.addObject("data", "/jsp/zhaobiao/jjkb.jsp");
		mv.addObject("list", list);
		mv.addObject("active", 2);
		mv.addObject("t", title);
		mv.addObject("path", "search2");
		mv.addObject("pg", pg);
		return mv;
	}

	@RequestMapping(value = "/search3/{page}")
	public ModelAndView search3(@PathVariable("page") int page, String title) {
		PageHelper.startPage(page, 5);
		List<Declareform> list = declareformService.selectAllByTitle(title, 2,1);
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/zhaobiao");
		mv.addObject("data", "/jsp/zhaobiao/jszb.jsp");
		mv.addObject("list", list);
		mv.addObject("active", 3);
		mv.addObject("t", title);
		mv.addObject("path", "search3");
		mv.addObject("pg", pg);
		return mv;
	}
//前台招标详细页面展示
	@RequestMapping(value = "/show")
	public ModelAndView show(int id) {
		Declareform df = declareformService.selectDeclareformById(id);
		List<Declarefile> listfile = declareformService
				.selectAllByDeclareid(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/xiangxi");
		mv.addObject("df", df);
		mv.addObject("listfile", listfile);
		return mv;
	}
//前台文件预览word转html
	@RequestMapping(value = "/preview")
	public String preview(int id) throws Exception {
		Declarefile d = declareformService.selectone(id);
		String filepath = d.getFilepath();
		String path = ContextLoader.getCurrentWebApplicationContext()
				.getServletContext().getRealPath("");
//		String path="F:\\Git\\mygitprj\\mavenfst";
		
		String suffix = filepath.substring(filepath.lastIndexOf(".") + 1);
			String htmlpath = filepath.replace(suffix, "html");
			WordToHtml.convert2Html(path + filepath, path + htmlpath);
			return "redirect:"+ htmlpath;
	}

}
