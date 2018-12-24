package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Encoder;

import com.bean.Declarefile;
import com.bean.Declareform;
import com.bean.Joinzbfile;
import com.bean.Joinzbxx;
import com.bean.Suppliers;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.DeclareformService;
import com.service.ToubiaoFrontService;
import com.service.ToubiaoFrontServiceImp;
import com.test.WordToHtml;

@Controller
@RequestMapping("/bids")
public class TouBiaoController {
	@Resource(name = "declareformServiceImp")
	DeclareformService declareformService;
	@Resource(name = "toubiaoFrontServiceImp")
	ToubiaoFrontService toubiaoFrontService;

	public ToubiaoFrontService getToubiaoFrontService() {
		return toubiaoFrontService;
	}

	public void setToubiaoFrontService(ToubiaoFrontService toubiaoFrontService) {
		this.toubiaoFrontService = toubiaoFrontService;
	}

	public DeclareformService getDeclareformService() {
		return declareformService;
	}

	public void setDeclareformService(DeclareformService declareformService) {
		this.declareformService = declareformService;
	}

	/**
	 * 所有招标信息
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/zhaobiaoall")
	public ModelAndView zhaoBiaoAll(Integer page) {
		PageHelper.startPage(page, 5);
		List<Declareform> list = declareformService.selectAllBysign(0, 1);
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("toubiaofront/toubiaomain");
		mv.addObject("data", "/jsp/toubiaofront/invitebids.jsp");
		mv.addObject("list", list);
		mv.addObject("active", 1);
		mv.addObject("path", "bids/zhaobiaoall");
		mv.addObject("pg", pg);
		return mv;

	}

	/**
	 * 根据条件查询
	 * 
	 * @param page
	 * @param title
	 * @return
	 */
	@RequestMapping(value = "/search")
	public ModelAndView search(Integer page, String title) {
		PageHelper.startPage(page, 5);
		List<Declareform> list = declareformService.selectAllByTitle(title, 0,
				1);
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("toubiaofront/toubiaomain");
		mv.addObject("data", "/jsp/toubiaofront/invitebids.jsp");
		mv.addObject("list", list);
		mv.addObject("active", 1);
		mv.addObject("path", "search");
		mv.addObject("title", title);
		mv.addObject("pg", pg);
		return mv;
	}

	/**
	 * 工程详细
	 * 
	 * @param id
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/show")
	public ModelAndView show(Integer id, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Suppliers sup = (Suppliers) req.getSession().getAttribute("supplier");
		Joinzbxx zbxx = this.toubiaoFrontService.selBidsSupidAndDecid(
				sup.getSupplierid(), id);
		if (zbxx != null) {
			mv.setViewName("redirect:/bids/toubiaoall");
			return mv;
		} else {
			Declareform df = declareformService.selectDeclareformById(id);
			List<Declarefile> listfile = declareformService
					.selectAllByDeclareid(id);
			mv.setViewName("toubiaofront/invitebidsdetailed");
			mv.addObject("df", df);
			mv.addObject("listfile", listfile);
			return mv;

		}

	}

	/**
	 * ajaxx下载
	 * 
	 * @param id
	 * @param resp
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/previewupload")
	public byte[] preview(int id, HttpServletResponse resp,
			HttpServletRequest res) throws Exception {
		Declarefile d = declareformService.selectone(id);
		String filepath = d.getFilepath();
		String path = res.getServletContext().getRealPath("");
		/*
		 * String path = ContextLoader.getCurrentWebApplicationContext()
		 * .getServletContext().getRealPath("");
		 */
		String filename = filepath.substring(filepath.lastIndexOf("/") + 1,
				filepath.length());
		resp.setContentType("application/x-tar;charset=utf-8");// 设置输出的格式及编码
		filename = "=?utf-8?B?"
				+ new BASE64Encoder().encode(filename.getBytes("utf-8")) + "?=";
		/*
		 * resp.setHeader("Content-disposition","attachment;filename="+
		 * java.net.URLEncoder.encode(filename, "utf-8"));
		 */
		resp.setHeader("Content-disposition", "attachment;filename=" + filename);
		String ss = res.getHeader("User-Agent");
		byte[] bt = FileCopyUtils.copyToByteArray(new File(path + filepath));
		return bt;

	}

	/**
	 * 获取详细招标文件根据id
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/bidsaction")
	public String bidsAction(Integer id, Model model) {
		Declareform df = declareformService.selectDeclareformById(id);
		model.addAttribute("decl", df);
		return "/toubiaofront/bidsaction";
	}

	/**
	 * 下载
	 */
	@ResponseBody
	@RequestMapping(value = "/upload")
	public Map<String, Object> upload(@RequestParam("file") MultipartFile file,
			HttpServletRequest req, Integer dfid) throws IOException {
		Suppliers sup = (Suppliers) req.getSession().getAttribute("supplier");
		String userid = sup.getSupplierid().toString();
		// ///////////////////////////////////
		String fileName = file.getOriginalFilename();
		String suff = fileName.substring(fileName.lastIndexOf("."),
				fileName.length());
		if (!".doc".equals(suff) && !".xlsx".equals(suff)) {
			return null;
		}
		String path = ContextLoader.getCurrentWebApplicationContext()
				.getServletContext()
				.getRealPath("/upload/" + dfid + "/" + userid + "/");
		File files = new File(path, fileName);
		if (!files.getParentFile().exists()) {
			files.getParentFile().mkdirs();
		}
		file.transferTo(files);
		// System.out.println(path);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("imgurl", "/images/word.png");
		map.put("fileurl", "/upload/" + dfid + "/" + userid + "/" + fileName);
		map.put("fileName", fileName);
		return map;
	}

	/**
	 * 插入文件
	 * 
	 * @param joinzbxx
	 * @param filess
	 * @param req
	 * @return
	 */
	@RequestMapping("/insjoinzbxx")
	public String insJoinzbxx(Joinzbxx joinzbxx, String[] filess,
			HttpServletRequest req) {
		Suppliers sup = (Suppliers) req.getSession().getAttribute("supplier");
		joinzbxx.setSupplierid(sup.getSupplierid());
		List<Joinzbfile> zbflis = new ArrayList<Joinzbfile>();
		for (int i = 0; i < filess.length; i++) {
			Joinzbfile jf = new Joinzbfile();
			jf.setFilepath(filess[i]);
			String filename = filess[i].substring(
					filess[i].lastIndexOf("/") + 1, filess[i].length());
			jf.setFilename(filename);
			zbflis.add(jf);
		}
		joinzbxx.setLisjoinzbfile(zbflis);

		if (joinzbxx.getId() == null) {

			int num = this.toubiaoFrontService.insToubiao(joinzbxx);
			return "redirect:/bids/zhaobiaoall?page=1";

		} else {

			int num = this.toubiaoFrontService.upToubiao(joinzbxx);
			if (num > 0) {
				return "redirect:/bids/toubiaoall";
			}

			return null;
		}

	}

	/**
	 * 插入文件
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/upjpoinzbxxzbfile")
	public String upJoinzbxxJoinfile(Integer id, Model model) {

		Joinzbxx zbxx = this.toubiaoFrontService.selBidsById(id);
		Declareform df = declareformService.selectDeclareformById(zbxx
				.getDeclareid());
		df.setZbxx(zbxx);
		model.addAttribute("decl", df);
		return "/toubiaofront/bidsaction";

	}

	/**
	 * 查询投标
	 * 
	 * @param req
	 * @param start
	 * @param mod
	 * @return
	 */
	@RequestMapping("/toubiaoall")
	public String touBiaoAll(HttpServletRequest req, Integer start, Model mod) {
		// ///////////////////////////////
		if (start == null) {
			start = 2;
		}
		Suppliers sup = (Suppliers) req.getSession().getAttribute("supplier");
		List<Joinzbxx> liszbxx = this.toubiaoFrontService.selBidsByStart(
				sup.getSupplierid(), start);
		for (Joinzbxx joinzbxx : liszbxx) {
			Declareform df = declareformService.selectDeclareformById(joinzbxx
					.getDeclareid());
			joinzbxx.setDecl(df);
		}
		mod.addAttribute("lisdec", liszbxx);
		mod.addAttribute("data", "/jsp/toubiaofront/bidsmeau.jsp");
		return "/toubiaofront/toubiaomain";

	}

	/**
	 * 修改招标状态
	 * 
	 * @param start
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/upJoinZbxx")
	public Integer upJoinZbxx(Integer start, Integer id) {
		System.out.println(start + "" + id);
		int num = this.toubiaoFrontService.upJoinZbxx(start, id);
		return num;

	}

	/**
	 * 异步根据不同状态获取
	 * 
	 * @param req
	 * @param start
	 * @param mod
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selstrat1")
	public List<Joinzbxx> touBiaoAjaxAll(HttpServletRequest req, Integer start,
			Model mod) {
		Suppliers supjiashe = new Suppliers();
		// ///////////////////////////////
		Suppliers sup = (Suppliers) req.getSession().getAttribute("supplier");
		List<Joinzbxx> liszbxx = this.toubiaoFrontService.selBidsByStart(
				sup.getSupplierid(), start);
		if (liszbxx == null) {
			return null;
		} else {
			for (Joinzbxx joinzbxx : liszbxx) {
				Declareform df = declareformService
						.selectDeclareformById(joinzbxx.getDeclareid());
				joinzbxx.setDecl(df);
			}
		}
		return liszbxx;
	}

	/**
	 * 异步根据不同状态获取2
	 * 
	 * @param req
	 * @param start
	 * @param mod
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selstart")
	public List<Joinzbxx> touBiaoAjaxAll2(HttpServletRequest req,
			Integer start, Model mod) {
		// ///////////////////////////////
		Suppliers sup = (Suppliers) req.getSession().getAttribute("supplier");
		List<Joinzbxx> liszbxx = this.toubiaoFrontService
				.selBidsByStartHistory(sup.getSupplierid(), start);
		if (liszbxx == null) {
			return null;
		} else {
			for (Joinzbxx joinzbxx : liszbxx) {
				Declareform df = declareformService
						.selectDeclareformById(joinzbxx.getDeclareid());
				joinzbxx.setDecl(df);
			}
			return liszbxx;
		}

	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delJoinZbxx")
	public Integer delJoinzbxx(Integer id, HttpServletRequest req) {
		Joinzbxx zbxx = this.toubiaoFrontService.selBidsById(id);
		List<Joinzbfile> zbfile = zbxx.getLisjoinzbfile();
		String path = ContextLoader.getCurrentWebApplicationContext()
				.getServletContext().getRealPath("");
		for (Joinzbfile joinzbfile : zbfile) {
			File files = new File(path + joinzbfile.getFilepath());
			System.out.println(path + joinzbfile.getFilepath());
			if (files.exists()) {
				files.delete();
			}
		}
		int num = this.toubiaoFrontService.delJoinzbxx(id);
		return num;
	}

	/**
	 * 删除路径
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delfileurl")
	public Integer delFileUrl(Integer id) {
		Joinzbfile zbfile = this.toubiaoFrontService.selJoinzbfileByid(id);
		String path = ContextLoader.getCurrentWebApplicationContext()
				.getServletContext().getRealPath("");
		File files = new File(path + zbfile.getFilepath());
		if (files.exists()) {
			files.delete();
		}
		int num = this.toubiaoFrontService.delJoinzbfileByid(id);
		return num;

	}

}
