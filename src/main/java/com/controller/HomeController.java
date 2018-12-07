package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Suppliers;

@Controller
@RequestMapping("/common")
public class HomeController {

	@RequestMapping("/home")
	public String home() {
		return "home";
	}

	@RequestMapping("/tuichu")
	public String goTuichu(HttpServletRequest req) {
		Suppliers suo = (Suppliers) req.getSession().getAttribute("supplier");
		if (suo != null) {
			req.getSession().removeAttribute("supplier");
			return "redirect:/common/home";
		}
		return "redirect:/common/home";
	}
}
