package com.st.stmall.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.st.stmall.pojo.Customer;
import com.st.stmall.pojo.Goods;
import com.st.stmall.service.ICustomermgrService;
import com.st.stmall.util.Page;

@Controller
public class CustomermgrController {
	
	@Autowired
	private ICustomermgrService iCustomermgrService;
	
	@RequestMapping("/Manager/customermgr.action")
	public String customermgr() {
		return "/WEB-INF/Manager/customermgr";
	}
	
	@RequestMapping("/getAllCustomermgr.action")
	@ResponseBody
	public Page getAllCustomermgr(Customer customer, Page page) {
		System.out.println(page.getCurpage());

		Page resPage = iCustomermgrService.selectAllCustomermgr(customer,page);
		return resPage;
	}
	
	@RequestMapping("Manager/updatecustomermgr.action")
	public String updatecustomermgr(Integer cid) {
		System.out.println("cid" + cid);
		return "/WEB-INF/Manager/updatecustomermgr";
	}

	@RequestMapping("/Manager/updatecustomer.action")
	public ModelAndView updatecustomer(Customer customer, Integer cid, String password2) {

		System.out.println("cid2" + cid);
		
		customer.setCid(cid);
		
		ModelAndView mv = new ModelAndView();
		
		int res = iCustomermgrService.updatecustomer(customer,password2);

		System.out.println("res" + res);
		if (res > 0) {
			// 修改成功
			mv.setViewName("redirect:customermgr.action");
		} else {
			// 修改失败
			mv.setViewName("redirect:updatecustomer.action?error=修改失败");
		}
		return mv;
	}
}
