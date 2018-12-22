package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Admin;
import com.bean.Answer;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.AnswerService;

@Controller
public class AnswerController {

	@Resource(name = "answerServiceImp")
	AnswerService answerService;// 依赖service层

	/**
	 * 分页查询查询所有的数据
	 */
	@RequestMapping("/selectanswer")
	public String selectanswer(HttpServletRequest req, Integer page) {
		PageHelper.startPage(page, 5);// 第几页，每页条数
		List<Answer> list2 = answerService.selectanswer();// 查询所有
		PageInfo pageInfo2 = new PageInfo(list2);// 就是一个包含了分页数据的对象

		req.setAttribute("list2", list2);
		req.setAttribute("pageInfo", pageInfo2);
		return "/tousu/selectallanswer";
	}

	/**
	 * 根据主键查询一个对象
	 */
	@RequestMapping("/selectbyprimarykeyanswer")
	public String selectanswerbyid(HttpServletRequest req, Integer id) {
		Answer answer = answerService.selectanswerbyid(id);
		req.setAttribute("answer", answer);

		return "/tousu/selectbyprimarykeyanswer";
	}

	/**
	 * 根据主键删除一个对象
	 */
	@RequestMapping("/is/deletebyprimarykeyanswer/{id}.html")
	public String deleteByPrimaryKeyAnswer(HttpServletRequest req, Integer id) {
		int r = answerService.deleteByPrimaryKey(id);
		return "deletebyprimarykeyanswer";
	}

	/**
	 * 根据主键修改一个对象
	 */
	@RequestMapping("/is/updatebyprimarykeyanswer.html")
	public String updateByPrimaryKeyAnswer(Answer answer) {
		int r = answerService.updateByPrimaryKey(answer);
		return "updatebyprimarykeyanswer";
	}

	/**
	 * 增加一个对象
	 */
	@RequestMapping("/insertanswer")
	public String insertAnswer(HttpServletRequest request, Answer answer,
			int dlkfdkid) {

		HttpSession session = request.getSession();
		Admin aw = (Admin) session.getAttribute("user");

		answer.setComplainid(dlkfdkid);
		answer.setAdminid(aw.getId());

		int r = answerService.insert(answer);

		return "redirect:/selectanswer?page=1";

	}

}
