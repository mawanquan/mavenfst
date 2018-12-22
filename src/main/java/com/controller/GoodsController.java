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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Admin;
import com.bean.Goods;
import com.bean.GoodsDetail;
import com.bean.GoodsPrice;
import com.bean.GoodsPriceTwo;
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

	// 全查物资
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

	// 名称查物资
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

	// id查询物资
	@RequestMapping("/selectbyid/{id}")
	public String a(HttpServletRequest req, @PathVariable("id") Integer id) {
		Goods gd = gds.selectbyid(id);
		req.setAttribute("list", gd);

		return "/goods/xiugai";
	}

	// 修改物资
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
		for (GoodsPrice goodsPrice : a) {
			List<GoodsDetail> b=goodsPrice.getGoodsdetail();
			req.setAttribute("list1", b);
			for (GoodsDetail goodsDetail : b) {
				System.out.print(goodsDetail.getGoods().getGoodsname());
			}
			System.out.println("\t");
		}
		
		req.setAttribute("list", a);
		
		return "/goods/xunjia";
	}

	// 增加询价
	@RequestMapping("/zengjia")
	public String zengjia(HttpServletRequest req, String goodstitle,
			String adminname,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date lastdate,
			Integer[] goodsname, Integer num,Integer[] nums,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date[] getdates) {

		System.out.println(goodsname);
		Admin a = gds.selectbyadmin(adminname);


		//Goods goods = gds.selectbygoodsname(goodsname);
		// 采购询价
		goodsprice = new GoodsPrice();
		goodsprice.setGoodstitle(goodstitle);
		goodsprice.setUserid(a.getId());
		goodsprice.setLastdate(lastdate);
		goodsprice.setForm(0);
		
		List<GoodsDetail> list = new ArrayList<GoodsDetail>();
		for (int i = 0; i < goodsname.length; i++) {
			System.out.println(goodsname[i]);
			System.out.println(nums[i]);
			System.out.println(getdates[i]);
			Goods goods=gds.selectbyid(goodsname[i]);
			// 物资明细
			goodsdetail = new GoodsDetail();
			goodsdetail.setGoodspriceid(goods.getId());
			goodsdetail.setNum(nums[i]);
			goodsdetail.setGetdate(getdates[i]);
			goodsdetail.setGoods(goods);
			goodsdetail.setGoodsid(goods.getId());
			//goodsdetail.setGoodspriceid(goodspriceid);
			//gds.insertgoodsdetail(goodsdetail);
			list.add(goodsdetail);
		}
		System.out.println(list);
		goodsprice.setGoodsdetail(list);
		gds.insertgp(goodsprice);
		GoodsPrice k = gds.selectbytitle(goodstitle);
		List<GoodsPrice> b = gds.selecta();
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

	// 发布询价
	@RequestMapping("/addxunjia/{id}")
	public String updateform(HttpServletRequest req,
			@PathVariable("id") Integer id) {
		gds.updateform(id);
		List<GoodsPrice> b = gds.selecta();
		req.setAttribute("list", b);
		return "/goods/xunjia";
	}

	// 批量发布
	@ResponseBody
	@RequestMapping("/addmany")
	public String updatemany(String ids) {
		//System.out.println(ids);
		List<Integer> list=new ArrayList<Integer>();
		String[] str=ids.split("&");
		int[] in = new int[str.length];
		for (int i = 0; i < str.length; i++) {
			in[i]=Integer.parseInt(str[i]);
			list.add(in[i]);
		}
        gds.updatemany(list);
		return "ok";
	}

	// 查询已发布询价
	@RequestMapping("/goodsdetail2")
	public String selectxunjia(HttpServletRequest req) {
		List<GoodsPrice> a = gds.selectform();
		req.setAttribute("list", a);
		return "/goods/xunjiachaxun";
	}
	
	
	@RequestMapping("/chaxun/{id}")
	public String chaxun(HttpServletRequest req,@PathVariable("id") Integer id){
	GoodsPrice a=gds.selectid(id);
	List<GoodsDetail> c=gds.selectdetailbyspriceid(a.getId());
	for (GoodsDetail goodsDetail : c) {
		System.out.println(goodsDetail.getGoods().getGoodsname());
	}
	GoodsPriceTwo b=gds.selecttw(a.getId());
	req.setAttribute("list",b);
	req.setAttribute("list1",c);
		return "goods/xiangqing";
	}
}
