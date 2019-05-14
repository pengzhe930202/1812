package com.st.stmall.controller;

import java.io.ByteArrayOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.st.stmall.pojo.Customer;
import com.st.stmall.service.ICustomerService;
import com.st.stmall.util.VerifyCode;



@Controller	// ������
/*
 * @Controllerע���������@Serviceע������û���һ��.
 * ������Spring�����м���һ��Bean����
 */
@RequestMapping("/Customer")
public class CustomerController {

	
	@Autowired	// �Զ�ע��/ �Զ�װ��
	ICustomerService iCustomerService;
	
	/*
	 * 1. ��¼
	 * 2. �˳�
	 * 3. ע��
	 * 4. �޸���Ϣ
	 * 
	 */
	
	@RequestMapping("/login.action")
	public ModelAndView login(Customer customer,String code,HttpSession session) {
		
		// ����Service��
		//Customer resCustomer = iCustomerService.login(customer);
		
		ModelAndView mv = new ModelAndView();
		
		String scode = (String) session.getAttribute("code");
		// ȫ��ת��Сд�ٶԱ�
		scode = scode.toLowerCase();
		code = code.toLowerCase();
		// ��֤�����ʱ, ����¼
		if (!scode.equals(code)) {
				// ��¼ʧ��
				mv.addObject("error", "��֤�����!");
				mv.setViewName("login");
		} else {
			// ��֤����ȷ
			Customer resCustomer = iCustomerService.login(customer);
			
			System.out.println(resCustomer);
			if (resCustomer !=null) {
				// ��¼�ɹ� �ض���
				session.setAttribute("customer", resCustomer);
				mv.setViewName("redirect:../index.jsp");
			} else {
				// ��¼ʧ��
				mv.addObject("error", "�˺Ż��������!");
				mv.setViewName("login");
			}		
				
		}
		
		
		return mv;
	}
	@RequestMapping("/getCode.action")
	public void getCode(HttpServletResponse response, HttpSession session) {
		
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		
		String code = VerifyCode.getCodeImg(output);
		
		session.setAttribute("code", code);
		
		try {
			// ��response�ϻ�ȡһ�������
			ServletOutputStream out = response.getOutputStream();
			// ��ͼƬд�뵽��������
			output.writeTo(out);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	@RequestMapping("/logout.action")
	public String logout(Customer customer,HttpSession session) {
		session.removeAttribute("customer");
		return ("redirect:../index.jsp");
	}
	@RequestMapping("/register.action")
	public ModelAndView register(Customer customer,String password2) {
		
		ModelAndView mv = new ModelAndView();
		
		int res = iCustomerService.register(customer,password2);
		
		if (res > 0) {
			//ע��ɹ�����ת����½ҳ��
			mv.setViewName("redirect:../login.jsp");
		}else if (res == -100) {
			mv.addObject("error", "�˺��Ѵ���!");
			mv.setViewName("register");
		}else if (res == -200) {
			mv.addObject("error", "�������벻һ��!");
			mv.setViewName("register");
		}	
		return mv;
	}
	@RequestMapping("/center.action")
	public String center(HttpSession session) {

		return "WEB-INF/Customer/center";
	}
	@RequestMapping("/update.action")
	public ModelAndView update(Customer customer,String password2,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Customer customer2 = (Customer) session.getAttribute("customer");
		customer.setCid(customer2.getCid()); 
		
		int res = iCustomerService.update(customer,password2);
		
		if (res>0) {
			//�޸ĳɹ�
			mv.setViewName("redirect:../login.jsp");
		}else if (res == -100) {
			// ���������Ƿ�һ��
			mv.addObject("error", "�������벻һ��!");
			mv.setViewName("WEB-INF/Customer/center");
		}
		return mv;
		
	}
}