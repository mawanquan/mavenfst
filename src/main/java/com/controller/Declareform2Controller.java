package com.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.jsqlparser.statement.delete.Delete;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Admin;
import com.bean.Declarefile;
import com.bean.Declareform;
import com.bean.Joinzbxx;
import com.bean.Suppliers;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.DeclareformService;
import com.service.SuppliersService;
import com.service.ToubiaoFrontService;
import com.test.WordToHtml;

@Controller("declareform2Controller")
public class Declareform2Controller {
	@Resource(name = "toubiaoFrontServiceImp")
	ToubiaoFrontService toubiaoFrontService;
	@Resource(name = "declareformServiceImp")
	DeclareformService declareformService;
	@Resource(name = "suppliersServiceImp")
	SuppliersService suppliersService;

	// 增加招标
	@RequestMapping(value = "/addzb")
	public String addzb(HttpSession session) {
		session.getAttribute("user");
		return "/zhaobiao/addzb";
	}

	// 上传文件
	@ResponseBody
	@RequestMapping(value = "/upload")
	public Map<String, Object> upload(@RequestParam("file") MultipartFile file)
			throws IOException {
		String fileName = file.getOriginalFilename();
		String path = ContextLoader.getCurrentWebApplicationContext()
				.getServletContext().getRealPath("/upload/" + fileName);
		file.transferTo(new File(path));
		// System.out.println(path);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("imgurl", "/images/word.png");
		map.put("fileurl", "/upload/" + fileName);
		map.put("fileName", fileName);
		return map;
	}

	// 增加招标文件到数据库
	@RequestMapping(value = "/insertfabu")
	public String insertzb(Declareform declareform, String[] filess,
			String finishdate0, String opentime0, HttpSession session)
			throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date1 = (Date) formatter.parse(formatter.format(new Date()));
		Date date2 = (Date) formatter.parse(finishdate0.replace("T", " "));
		Date date3 = (Date) formatter.parse(opentime0.replace("T", " "));
		declareform.setApplydate(date1);
		declareform.setFinishdate(date2);
		declareform.setOpentime(date3);
		declareform.setSign(0);
		declareform.setStatus(0);
		Admin admin = (Admin) session.getAttribute("user");
		declareform.setPublisher(admin.getId());
		declareformService.insertDeclareform(declareform);
		Declareform d2 = declareformService
				.selectDeclareformBytitle(declareform.getTitle());
		List<Declarefile> list = new ArrayList<Declarefile>();
		if (filess != null || (filess == null && filess.length != 0)) {
			for (int i = 0; i < filess.length; i++) {
				Declarefile declarefile = new Declarefile();
				declarefile.setDeclareid(d2.getId());
				declarefile.setFilepath(filess[i]);
				list.add(declarefile);
			}
		}
		declareformService.insertDeclarefile(list);
		return "forward:/addzb";
	}

	// 发布招标设置
	@RequestMapping(value = "/fabuzbset/{page}")
	public ModelAndView fabuzbset(@PathVariable("page") int page,
			HttpSession session) {
		PageHelper.startPage(page, 10);
		// ////////////////////////////
		Admin admin = (Admin) session.getAttribute("user");
		List<Declareform> list = declareformService.selectAllBystatusall(0);
		// ////////////////////////
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/zbset");
		mv.addObject("list", list);
		mv.addObject("pg", pg);
		mv.addObject("path", "fabuzbset");
		return mv;
	}

	// 我的发布招标设置
	@RequestMapping(value = "/myfabuzbset/{page}")
	public ModelAndView myfabuzbset(@PathVariable("page") int page,
			HttpSession session) {
		PageHelper.startPage(page, 10);
		// ////////////////////////////
		Admin admin = (Admin) session.getAttribute("user");
		List<Declareform> list = declareformService.selectAllBystatus(0,
				admin.getId());
		// ////////////////////////
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/zbset");
		mv.addObject("list", list);
		mv.addObject("pg", pg);
		mv.addObject("path", "myfabuzbset");
		return mv;
	}

	@RequestMapping(value = "/update")
	public ModelAndView update(int id) {
		Declareform declareform = declareformService.selectDeclareformById(id);
		List<Declarefile> list = declareformService.selectAllByDeclareid(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/update");
		mv.addObject("d", declareform);
		mv.addObject("listfile", list);
		return mv;
	}

	@RequestMapping(value = "/xiugai")
	public String xiugai(Declareform declareform, String[] filess,
			String finishdate0, String opentime0) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		java.util.Date date2 = (java.util.Date) formatter.parse(finishdate0
				.replace("T", " "));
		java.util.Date date3 = (java.util.Date) formatter.parse(opentime0
				.replace("T", " "));
		declareform.setFinishdate(date2);
		declareform.setOpentime(date3);
		declareformService.updateById(declareform);

		return "forward:/fabuzbset/1";
	}

	@ResponseBody
	@RequestMapping(value = "/deletezb")
	public String deletezb(int id) {
		declareformService.deleteoneByid(id);
		return "";
	}

	@RequestMapping(value = "/fabuzb")
	public ModelAndView fabuzb(int id) {
		Declareform declareform = declareformService.selectDeclareformById(id);
		declareform.setStatus(1);
		declareformService.updateById(declareform);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/zbset");
		mv.addObject("d", declareform);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/deletefile")
	public String deletefile(int id) {
		Declarefile d = declareformService.selectone(id);
		declareformService.deletefileByid(d);
		// ModelAndView mv = new ModelAndView();
		return "";
	}

	// 正在招标项目
	@RequestMapping(value = "/zhengzaizb/{page}")
	public ModelAndView zhengzaizb(@PathVariable("page") int page,
			HttpSession session) throws ParseException {
		PageHelper.startPage(page, 10);
		// ////////////////////////////
		Admin admin = (Admin) session.getAttribute("user");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date1 = (Date) formatter.parse(formatter.format(new Date()));
		List<Declareform> list = declareformService.selectAllBysign(0, 1);
		if (list.size() != 0) {
			for (Declareform declareform : list) {
				if (declareform.getFinishdate().getTime() < date1.getTime()
						&& date1.getTime() < declareform.getOpentime()
								.getTime()) {
					declareform.setSign(1);
					declareformService.updateById(declareform);
				}
			}
		}
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/houtai/zhengzaizb");
		mv.addObject("list", list);
		mv.addObject("pg", pg);
		mv.addObject("path", "zhengzaizb");
		return mv;
	}

	// 正在招标项目
	@RequestMapping(value = "/myzhengzaizb/{page}")
	public ModelAndView myzhengzaizb(@PathVariable("page") int page,
			HttpSession session) throws ParseException {
		PageHelper.startPage(page, 10);
		// ////////////////////////////
		Admin admin = (Admin) session.getAttribute("user");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date1 = (Date) formatter.parse(formatter.format(new Date()));
		List<Declareform> list = declareformService.selectmyAllBysign(
				admin.getId(), 0, 1);
		if (list.size() != 0) {
			for (Declareform declareform : list) {
				if (declareform.getFinishdate().getTime() < date1.getTime()
						&& date1.getTime() < declareform.getOpentime()
								.getTime()) {
					declareform.setSign(1);
					declareformService.updateById(declareform);
				}
			}
		}
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/houtai/zhengzaizb");
		mv.addObject("list", list);
		mv.addObject("pg", pg);
		mv.addObject("path", "myzhengzaizb");
		return mv;
	}

	// 已截止招标待开标项目
	@RequestMapping(value = "/jiezhizb/{page}")
	public ModelAndView jiezhizb(@PathVariable("page") int page,
			HttpSession session) throws ParseException {
		PageHelper.startPage(page, 10);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date1 = (Date) formatter.parse(formatter.format(new Date()));
		// ////////////////////////////
		Admin admin = (Admin) session.getAttribute("user");
		List<Declareform> list = declareformService.selectAllBysign(1, 1);
		if (list.size() != 0) {
			for (Declareform declareform : list) {
				if (declareform.getOpentime().getTime() < date1.getTime()) {
					declareform.setSign(2);
					declareformService.updateById(declareform);
				}
			}
		}
		// ////////////////////////
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/houtai/jiezhizb");
		mv.addObject("list", list);
		mv.addObject("pg", pg);
		mv.addObject("path", "jiezhizb");
		return mv;
	}

	// 我的已截止招标待开标项目
	@RequestMapping(value = "/myjiezhizb/{page}")
	public ModelAndView myjiezhizb(@PathVariable("page") int page,
			HttpSession session) throws ParseException {
		PageHelper.startPage(page, 10);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date1 = (Date) formatter.parse(formatter.format(new Date()));
		// ////////////////////////////
		Admin admin = (Admin) session.getAttribute("user");
		List<Declareform> list = declareformService.selectmyAllBysign(
				admin.getId(), 1, 1);
		if (list.size() != 0) {
			for (Declareform declareform : list) {
				if (declareform.getOpentime().getTime() < date1.getTime()) {
					declareform.setSign(2);
					declareformService.updateById(declareform);
				}
			}
		}
		// ////////////////////////
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/houtai/jiezhizb");
		mv.addObject("list", list);
		mv.addObject("pg", pg);
		mv.addObject("path", "myjiezhizb");
		return mv;
	}

	// 可开标项目
	@RequestMapping(value = "/kekaibiao/{page}")
	public ModelAndView kekaibiao(@PathVariable("page") int page,
			HttpSession session) {
		PageHelper.startPage(page, 10);
		// SimpleDateFormat formatter = new
		// SimpleDateFormat("yyyy-MM-dd HH:mm");
		// Admin admin = (Admin) session.getAttribute("user");
		List<Declareform> list = declareformService.selectAllBysign(2, 1);
		List<Declareform> list2 = new ArrayList<Declareform>();
		for (Declareform declareform : list) {
			if (declareform.getHit() == null
					|| ("").equals(declareform.getHit())) {
				list2.add(declareform);
			}
		}
		// ////////////////////////
		PageInfo pg = new PageInfo(list2);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/houtai/kekaibiao");
		mv.addObject("list", list2);
		mv.addObject("pg", pg);
		mv.addObject("path", "kekaibiao");
		return mv;
	}

	// 我的可开标项目
	@RequestMapping(value = "/mykekaibiao/{page}")
	public ModelAndView mykekaibiao(@PathVariable("page") int page,
			HttpSession session) {
		PageHelper.startPage(page, 10);
		// SimpleDateFormat formatter = new
		// SimpleDateFormat("yyyy-MM-dd HH:mm");
		// ////////////////////////////
		Admin admin = (Admin) session.getAttribute("user");
		List<Declareform> list = declareformService.selectmyAllBysign(
				admin.getId(), 2, 1);
		List<Declareform> list2 = new ArrayList<Declareform>();
		for (Declareform declareform : list) {
			if (declareform.getHit() == null
					|| ("").equals(declareform.getHit())) {
				list2.add(declareform);
			}
		}
		// ////////////////////////
		PageInfo pg = new PageInfo(list2);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/houtai/kekaibiao");
		mv.addObject("list", list2);
		mv.addObject("pg", pg);
		mv.addObject("path", "mykekaibiao");
		return mv;
	}

	@RequestMapping(value = "/kaibiao")
	public ModelAndView kaibiao(HttpSession session, int id) {
		Declareform d = declareformService.selectDeclareformById(id);
		ModelAndView mv = new ModelAndView();
		Suppliers listsuppliers = null;
		Joinzbxx jzbxxandfile = null;
		// 查询应标的供应商
		List<Joinzbxx> list = toubiaoFrontService.selBidsxxAllByDecidandStart(
				id, 1);
		mv.addObject("d", d);
		mv.addObject("list", list);
		mv.setViewName("zhaobiao/houtai/kaibiao");
		return mv;
	}

	// 文件预览word转html
	@RequestMapping(value = "/houtaipreview")
	public String houtaipreview(String filepath) throws Exception {
		String path = ContextLoader.getCurrentWebApplicationContext()
				.getServletContext().getRealPath("");
		// String path="F:\\Git\\mygitprj\\mavenfst";
		String suffix = filepath.substring(filepath.lastIndexOf(".") + 1);
		String htmlpath = filepath.replace(suffix, "html");
		WordToHtml.convert2Html(path + filepath, path + htmlpath);
		return "redirect:" + htmlpath;
	}

	// 中标项目
	@RequestMapping(value = "/zhongbiao")
	public String zhongbiao(Integer id, String hit) {
		// ////////////////////////////
		Declareform declareform = declareformService.selectDeclareformById(id);
		declareform.setHit(hit);
		declareformService.updateById(declareform);
		return "forward:/kekaibiao/1";
	}

	// 已完成招标项目
	@RequestMapping(value = "/finishzb/{page}")
	public ModelAndView finishzb(@PathVariable("page") int page,
			HttpSession session) {
		PageHelper.startPage(page, 10);
		// SimpleDateFormat formatter = new
		// SimpleDateFormat("yyyy-MM-dd HH:mm");
		// ////////////////////////////
		// Admin admin = (Admin) session.getAttribute("user");
		List<Declareform> list = declareformService.selectAllBysign(2, 1);
		List<Declareform> list2 = new ArrayList<Declareform>();
		for (Declareform declareform : list) {
			if (declareform.getHit() != null) {
				list2.add(declareform);
			}
		}
		// ////////////////////////
		PageInfo pg = new PageInfo(list2);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/houtai/finishzb");
		mv.addObject("list", list2);
		mv.addObject("pg", pg);
		mv.addObject("path", "finishzb");
		return mv;
	}

	// 已完成招标项目
	@RequestMapping(value = "/myfinishzb/{page}")
	public ModelAndView myfinishzb(@PathVariable("page") int page,
			HttpSession session) {
		PageHelper.startPage(page, 10);
		// SimpleDateFormat formatter = new
		// SimpleDateFormat("yyyy-MM-dd HH:mm");
		// ////////////////////////////
		Admin admin = (Admin) session.getAttribute("user");
		List<Declareform> list = declareformService.selectmyAllBysign(admin.getId(), 2, 1);
		List<Declareform> list2 = new ArrayList<Declareform>();
		for (Declareform declareform : list) {
			if (declareform.getHit() != null) {
				list2.add(declareform);
			}
		}
		// ////////////////////////
		PageInfo pg = new PageInfo(list2);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/houtai/finishzb");
		mv.addObject("list", list2);
		mv.addObject("pg", pg);
		mv.addObject("path", "myfinishzb");
		return mv;
	}

	// 废标项目
	@RequestMapping(value = "/feibiao/{page}")
	public ModelAndView feibiao(@PathVariable("page") int page) {
		PageHelper.startPage(page, 5);
		List<Declareform> list = declareformService.selectAllBysign(2, 2);
		PageInfo pg = new PageInfo(list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("zhaobiao/houtai/feibiao");
		mv.addObject("list", list);
		mv.addObject("path", "feibiao");
		mv.addObject("pg", pg);
		return mv;
	}
	// 我的废标项目
		@RequestMapping(value = "/myfeibiao/{page}")
		public ModelAndView myfeibiao(@PathVariable("page") int page,HttpSession session) {
			PageHelper.startPage(page, 5);
			Admin admin = (Admin) session.getAttribute("user");
			List<Declareform> list = declareformService.selectmyAllBysign(admin.getId(), 2, 2);
			PageInfo pg = new PageInfo(list);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("zhaobiao/houtai/feibiao");
			mv.addObject("list", list);
			mv.addObject("path", "myfeibiao");
			mv.addObject("pg", pg);
			return mv;
		}
	// 废标项目
	@RequestMapping(value = "/feibiaoset")
	public String feibiaoset(int id) {
		Declareform declareform = declareformService.selectDeclareformById(id);
		declareform.setStatus(2);
		declareformService.updateById(declareform);
		return "forward:/kekaibiao/1";
	}
}
