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
			//��½�ɹ�
			session.setAttribute("manager", resManager);
			mv.setViewName("redirect:index.action");
		}else {
			//��½ʧ��
			mv.addObject("error", "��½ʧ��");
			mv.setViewName("mgrlogin");
		}
		return mv;
	}
	@RequestMapping("/index.action")
	public String index() {
		return "/WEB-INF/Manager/index";
	}
	//����Ա�˳�
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
	//����Ա�޸�����
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
			//ԭ�������
			mv.addObject("error", "���벻һ��!");
			mv.setViewName("WEB-INF/Manager/updatemgr");
		}
		return mv;
		
	}
}
