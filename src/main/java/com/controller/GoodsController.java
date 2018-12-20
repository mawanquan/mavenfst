package com.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Goods;
import com.bean.GoodsDetail;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.GoodsDetailSer;
@Controller
@RequestMapping("/goods")
public class GoodsController {
	GoodsDetail goodsdetail;
	@Resource(name="goodsDetailSerImp")
	GoodsDetailSer gds;
	//id查询
	Goods goods;
	
	@RequestMapping("/selectbyid")
public String a(Integer id){
		System.out.println("??");
		GoodsDetail gd=gds.selectgoodsbyid(id);
		System.out.println(gd.getGoods().getGoodsname()+gd.getNum());
	return "/goods/goods";
}
	//全查
	@RequestMapping("/selectall/{page}")
	public String b(HttpServletRequest req,@PathVariable("page")Integer page){
		PageHelper.startPage(page, 3);
		List<GoodsDetail> list=gds.selectall();
//		for (GoodsDetail goodsDetail : list) {
//			System.out.println(goodsDetail);
//		} 
		req.setAttribute("list", list);
	    PageInfo page1 = new PageInfo(list);
		req.setAttribute("page1", page1);
		return "/goods/goods"; 
	}  
	//名称查 
	@RequestMapping("/selectbyother")
	public String c(HttpServletRequest req,Integer goodscode, String goodsname,String type){
		
		List<GoodsDetail> list=gds.selectgoodsbyother(goodscode, goodsname, type);
		
		req.setAttribute("list", list);
		return "/goods/goods";		
		}
	//id删除
	@RequestMapping("/deletebyid")
	public String deletebyid(Integer id){
		GoodsDetail gd=gds.selectgoodsbyid(id);
		System.out.println(gd.getGoods().getId());		
		int b=gds.deletebyid2(gd.getGoods().getId());
		int c=gds.deletebyid3(gd.getGoodsprice().getId());
		int a=gds.deletebyid1(id);
		int d=a+b+c;
		System.out.println(d>0);
		if(d>0){
			return "ok";
		}else{
			return "false";
		}
		
		
	} 
	@RequestMapping("/insertgoods")
	public String insertgoods(String goodsname,String unit,String goodscode,Integer num,
			String type,Date getdate){
		System.out.println(type);
		goods.setType(type); 
		goods.setGoodsname(goodsname);
		goods.setGoodscode(goodscode);
		goods.setUnit(unit); 
		System.out.println(goods);
		gds.insertgoods(goods);
		goodsdetail.setGetdate(getdate);
		goodsdetail.setNum(num);
		goodsdetail.setGoods(goods);
		gds.insertgoodsde(goodsdetail);
		System.out.println(goodsdetail);
		return "/goods/goods";
	}
}
