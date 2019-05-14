package com.st.stmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.st.stmall.pojo.Customer;
import com.st.stmall.pojo.Manager;
import com.st.stmall.service.IManagerService;

@Controller
@RequestMapping("/Manager")
public class ManagerController {
	@Autowired
	private IManagerService iManagerService;
	
	@RequestMapping("/login.action")
	public ModelAndView login(Manager manager,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		Manager resManager = iManagerService.login(manager);
		
		if (resManager != null) {
			//登陆成功
			session.setAttribute("manager", resManager);
			mv.setViewName("redirect:index.action");
		}else {
			//登陆失败
			mv.addObject("error", "登陆失败");
			mv.setViewName("mgrlogin");
		}
		return mv;
	}
	@RequestMapping("/index.action")
	public String index() {
		return "/WEB-INF/Manager/index";
	}
	//管理员退出
	@RequestMapping("/logout.action")
	public String logout(Manager manager,HttpSession session) {
		session.removeAttribute("manager");
		return ("redirect:../mgrlogin.jsp");
		//return "mgrlogin";
				
	}
	@RequestMapping("/updatemgr.action")
	public String upddatemgr(HttpSession session) {

		return "WEB-INF/Manager/updatemgr";
	}
	//管理员修改密码
	@RequestMapping("/update.action")
	public ModelAndView update(Manager manager,String mpassword2,HttpSession session) {

		ModelAndView mv = new ModelAndView();
		Manager manager2 = (Manager) session.getAttribute("manager");
		manager.setMid(manager2.getMid());
		
		
		int res = iManagerService.update(manager,mpassword2);
		System.out.println(res);
		if (res > 0) {
			mv.setViewName("redirect:../mgrlogin.jsp");
		}else if (res == -100) {
			//原密码错误
			mv.addObject("error", "密码不一致!");
			mv.setViewName("WEB-INF/Manager/updatemgr");
		}
		return mv;
		
	}
}
