package com.st.stmall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.st.stmall.pojo.Customer;
import com.st.stmall.pojo.Details;
import com.st.stmall.pojo.Goods;
import com.st.stmall.pojo.Order;
import com.st.stmall.service.IOrderService;
import com.st.stmall.util.Page;

@Controller
public class OrderController {
	
	@Autowired
	IOrderService iOrderService;
	
	@RequestMapping("/Customer/subOrder.action")
	public ModelAndView subOrder(Order order,HttpSession session) {
		//结算
		
		//取cid
		Customer customer = (Customer) session.getAttribute("customer");
		order.setCid(customer.getCid());
		order.setOaddr(customer.getCaddr());
		order.setOname(customer.getCrealname());
		order.setOphone(customer.getCphone());
		
		ModelAndView mv = new ModelAndView();
		
		try {
			iOrderService.add(order);
			
			mv.setViewName("redirect:myOrder.action");
		}catch (RuntimeException e) {
			// 向客户端返回错误信息
			mv.addObject("error", e.getMessage()); 
			
			mv.setViewName("error");
		}
	
		return mv;
	}
	
	@RequestMapping("/Customer/myOrder.action")
	public ModelAndView myOrder(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		Customer customer = (Customer) session.getAttribute("customer");
		
		List<Order> list = iOrderService.selectByCid(customer.getCid());
		
		mv.addObject("list", list);
		mv.setViewName("WEB-INF/Customer/order");
		
		return mv;
	}
	
	@RequestMapping("/Manager/ordermgr.action")
	public String ordermgr() {
		return "/WEB-INF/Manager/ordermgr";
	}
	
	@RequestMapping("/getAllOrder.action")
	@ResponseBody
	public ModelAndView getAllOrder() {
		ModelAndView mv = new ModelAndView();
		
		List<Order> list = iOrderService.selectAllOrder();
		
		mv.addObject("list", list);
		mv.setViewName("/WEB-INF/Manager/ordermgr2");
		
		return mv;
	}
	
	
}
