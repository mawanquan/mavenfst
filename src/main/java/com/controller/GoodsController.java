package com.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
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
	@Resource(name="goodsDetailSerImp")
	GoodsDetailSer gds;
	
	Goods goods;
	GoodsPrice goodsprice;
	//全查
	@RequestMapping("/selectall/{page}")
	public String b(HttpServletRequest req,@PathVariable("page")Integer page){
		PageHelper.startPage(page, 3);
		List<Goods> list=gds.selectall();
//		for (GoodsDetail goodsDetail : list) {
//			System.out.println(goodsDetail);
//		} 
		req.setAttribute("list", list);
	    PageInfo page1 = new PageInfo(list);
	    List<Goods> list1=gds.selectall();
	    req.setAttribute("list1", list1);
		req.setAttribute("page1", page1);
		return "/goods/goods"; 
	}  
	//名称查 
	@RequestMapping("/selectbyother")
	public String c(HttpServletRequest req,String goodscode, String goodsname,String type){
		
		List<Goods> list=gds.selectbyothers(goodsname, goodscode, type);
		
		req.setAttribute("list", list);
		return "/goods/goods";		
		}
	//增加物资
	@RequestMapping("/insertgoods")
	public String insertgoods(String goodsname,String goodscode,
			String type,String unit){
		goods=new Goods();
		goods.setGoodsname(goodsname);
		goods.setGoodscode(goodscode);
		goods.setType(type);
		goods.setUnit(unit);
		System.out.println(type);
		gds.insertgoods(goods);
//		List<Goods> a=gds.selectall();
//		for (Goods goods : a) {
//			System.out.println(goods.getGoodsname());
//		}
		return "/goods/goods";

	}

	//id查询
	@RequestMapping("/selectbyid/{id}")
public String a(HttpServletRequest req,@PathVariable("id")Integer id){
		Goods gd=gds.selectbyid(id);
		req.setAttribute("list", gd);
		
	return "/goods/xiugai";
}
	
	//修改
	@RequestMapping("/xiugai")
	public String xuigai(Integer id,String goodsname,String goodscode,
			String type,String unit){
		goods=new Goods();
		goods.setId(id);
		goods.setGoodsname(goodsname);
		goods.setGoodscode(goodscode);
		goods.setType(type);
		goods.setUnit(unit);
		gds.updategoods(goods);
		return "/goods/goods";
	}
	//询价查询
	@RequestMapping("/goodsdetail")
	public String goodsdetail(HttpServletRequest req){

		List<GoodsPrice> a=gds.selecta();
		for (GoodsPrice goodsPrice : a) {
			System.out.println(goodsPrice.getAdmin().getAdminname());
			List<GoodsDetail> b=goodsPrice.getGoodsdetail();
			for (GoodsDetail goodsDetail : b) {
				System.out.println(goodsDetail.getGoods().getGoodsname());
			}
		}
		req.setAttribute("list",a);
		return "/goods/xunjia";
	}
	//增加询价
	@RequestMapping("/zengjia")
	public String zengjia(Integer id,String goodstitle,String adminname,Date lastdate,
			String goodsname,Integer num,Date getdate){
		goodsdetail=new GoodsDetail();
		Goods b=gds.selectbygoodsname(goodsname);
		goodsdetail.setGetdate(getdate);
		goodsdetail.setGoodsid(b.getId());
		goodsdetail.setGoodspriceid(id);
		goodsdetail.setNum(num);
		
        goodsprice=new GoodsPrice(); 
        goodsprice.setGoodstitle(goodstitle);
        goodsprice.setLastdate(lastdate);
		
		return "/goods/zengjiaxunjia";
	}
	

	@RequestMapping("/adminAndGoods")
	public String adminandgoods(HttpServletRequest req){
		List<Goods> a=gds.selectall();
		List<Admin> b=gds.selectall2();
		req.setAttribute("list", a);
		req.setAttribute("list2", b);
		return "/goods/zengjiaxunjia";
	}
}
