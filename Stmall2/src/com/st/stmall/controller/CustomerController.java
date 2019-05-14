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



@Controller	// 控制器
/*
 * @Controller注解的作用与@Service注解的作用基本一样.
 * 都是向Spring容器中加入一个Bean对象
 */
@RequestMapping("/Customer")
public class CustomerController {

	
	@Autowired	// 自动注入/ 自动装配
	ICustomerService iCustomerService;
	
	/*
	 * 1. 登录
	 * 2. 退出
	 * 3. 注册
	 * 4. 修改信息
	 * 
	 */
	
	@RequestMapping("/login.action")
	public ModelAndView login(Customer customer,String code,HttpSession session) {
		
		// 调用Service层
		//Customer resCustomer = iCustomerService.login(customer);
		
		ModelAndView mv = new ModelAndView();
		
		String scode = (String) session.getAttribute("code");
		// 全部转成小写再对比
		scode = scode.toLowerCase();
		code = code.toLowerCase();
		// 验证码错误时, 不登录
		if (!scode.equals(code)) {
				// 登录失败
				mv.addObject("error", "验证码错误!");
				mv.setViewName("login");
		} else {
			// 验证码正确
			Customer resCustomer = iCustomerService.login(customer);
			
			System.out.println(resCustomer);
			if (resCustomer !=null) {
				// 登录成功 重定向
				session.setAttribute("customer", resCustomer);
				mv.setViewName("redirect:../index.jsp");
			} else {
				// 登录失败
				mv.addObject("error", "账号或密码错误!");
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
			// 从response上获取一个输出流
			ServletOutputStream out = response.getOutputStream();
			// 将图片写入到输入流中
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
			//注册成功，跳转到登陆页面
			mv.setViewName("redirect:../login.jsp");
		}else if (res == -100) {
			mv.addObject("error", "账号已存在!");
			mv.setViewName("register");
		}else if (res == -200) {
			mv.addObject("error", "两次密码不一致!");
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
			//修改成功
			mv.setViewName("redirect:../login.jsp");
		}else if (res == -100) {
			// 两次密码是否一致
			mv.addObject("error", "两次密码不一致!");
			mv.setViewName("WEB-INF/Customer/center");
		}
		return mv;
		
	}
}