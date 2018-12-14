package com.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Admin;
import com.bean.Goods;
import com.bean.GoodsDetail;
import com.bean.GoodsPrice;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.GoodsDetailSer;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	GoodsDetail goodsdetail;
	@Resource(name = "goodsDetailSerImp")
	GoodsDetailSer gds;

	Goods goods;
	GoodsPrice goodsprice;

	// 全查
	@RequestMapping("/selectall/{page}")
	public String b(HttpServletRequest req, @PathVariable("page") Integer page) {
		PageHelper.startPage(page, 3);
		List<Goods> list = gds.selectall();
		// for (GoodsDetail goodsDetail : list) {
		// System.out.println(goodsDetail);
		// }
		req.setAttribute("list", list);
		PageInfo page1 = new PageInfo(list);
		List<Goods> list1 = gds.selectall();
		req.setAttribute("list1", list1);
		req.setAttribute("page1", page1);
		return "/goods/goods";
	}

	// 名称查
	@RequestMapping("/selectbyother")
	public String c(HttpServletRequest req, String goodscode, String goodsname,
			String type) {

		List<Goods> list = gds.selectbyothers(goodsname, goodscode, type);

		req.setAttribute("list", list);
		return "/goods/goods";
	}

	// 增加物资
	@RequestMapping("/insertgoods")
	public String insertgoods(String goodsname, String goodscode, String type,
			String unit) {
		goods = new Goods();
		goods.setGoodsname(goodsname);
		goods.setGoodscode(goodscode);
		goods.setType(type);
		goods.setUnit(unit);
		gds.insertgoods(goods);
		// List<Goods> a=gds.selectall();
		// for (Goods goods : a) {
		// System.out.println(goods.getGoodsname());
		// }
		return "/goods/goods";

	}

	// id查询
	@RequestMapping("/selectbyid/{id}")
	public String a(HttpServletRequest req, @PathVariable("id") Integer id) {
		Goods gd = gds.selectbyid(id);
		req.setAttribute("list", gd);

		return "/goods/xiugai";
	}

	// 修改
	@RequestMapping("/xiugai")
	public String xuigai(Integer id, String goodsname, String goodscode,
			String type, String unit) {
		goods = new Goods();
		goods.setId(id);
		goods.setGoodsname(goodsname);
		goods.setGoodscode(goodscode);
		goods.setType(type);
		goods.setUnit(unit);
		gds.updategoods(goods);
		return "/goods/goods";
	}

	// 询价查询
	@RequestMapping("/goodsdetail")
	public String goodsdetail(HttpServletRequest req) {

		List<GoodsPrice> a = gds.selecta();
		req.setAttribute("list", a);
		return "/goods/xunjia";
	}
	
	// 增加询价
	@RequestMapping("/zengjia")
	public String zengjia(HttpServletRequest req,String goodstitle, String adminname,
			@DateTimeFormat(pattern="yyyy-MM-dd") Date lastdate, String goodsname, Integer num, @DateTimeFormat(pattern="yyyy-MM-dd") Date getdate) {
		 Admin a=gds.selectbyadmin(adminname);	
		 Goods goods= gds.selectbygoodsname(goodsname);		
		 //采购询价
		 goodsprice=new GoodsPrice();
		 goodsprice.setGoodstitle(goodstitle);
		 goodsprice.setUserid(a.getId());
		 goodsprice.setLastdate(lastdate);
		 goodsprice.setForm(0);
		 List<GoodsDetail> list=new ArrayList<GoodsDetail>();
		 list.add(goodsdetail);
		 goodsprice.setGoodsdetail(list);
		 gds.insertgp(goodsprice);
		 GoodsPrice k=gds.selectbytitle(goodstitle);
		 //物资明细
		 goodsdetail=new GoodsDetail();
		 goodsdetail.setGoodspriceid(k.getId());
		 goodsdetail.setNum(num);
		 goodsdetail.setGetdate(getdate);
		 goodsdetail.setGoods(goods);
		 goodsdetail.setGoodsid(goods.getId());
		 gds.insertgoodsdetail(goodsdetail);
		 List<GoodsPrice> b=gds.selecta();
		 req.setAttribute("list", b);
		return "/goods/xunjia";
	}

	@RequestMapping("/adminAndGoods")
	public String adminandgoods(HttpServletRequest req) {
		List<Goods> a = gds.selectall();
		List<Admin> b = gds.selectall2();
		req.setAttribute("list", a);
		req.setAttribute("list2", b);
		return "/goods/zengjiaxunjia";
	}
	
	
	//发布询价
	@RequestMapping("/addxunjia")
	public String updateform(HttpServletRequest req,Integer id){
		gds.updateform(id, 1);
		 List<GoodsPrice> b=gds.selecta();
		 req.setAttribute("list", b);
		return "/goods/zengjiaxunjia";
	}
	//查询已发布询价
	@RequestMapping("/goodsdetail2")
	public String selectxunjia(HttpServletRequest req){
	List<GoodsPrice> a=gds.selectform();
	req.setAttribute("list", a);
		return "/goods/xunjiachaxun";
	}
}
