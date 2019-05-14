package com.st.stmall.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.st.stmall.pojo.Goods;
import com.st.stmall.pojo.Type;
import com.st.stmall.service.ITypeService;
import com.st.stmall.util.Page;

@Controller
public class TypeController {
	
	@Autowired
	private ITypeService iTypeService;
	
	@RequestMapping("/Manager/typemgr.action")
	public String typemgr() {
		return "/WEB-INF/Manager/typemgr";
	}
	@RequestMapping("Manager/addtypeview.action")
	public String addtypeview() {
		return "/WEB-INF/Manager/addtype";
	}

	@RequestMapping("/Manager/addtype.action")
	public ModelAndView addtype(Type type) {

		int res = iTypeService.addtype(type);

		ModelAndView mView = new ModelAndView();

		if (res > 0) {
			mView.setViewName("redirect:typemgr.action");
		} else {
			mView.setViewName("redirect:addtypeview.action?error=添加失败");
		}

		return mView;
	}
	
	@RequestMapping("/getAllType.action")
	@ResponseBody
	public Page getAllType(Type type, Page page) {
		System.out.println(page.getCurpage());

		Page resPage =  iTypeService.selectAllType(type,page);
		
		return resPage;
	}
	
	@RequestMapping("Manager/updatetypemgr.action")
	public String updatetypemgr(Integer tid) {
		System.out.println("tid" + tid);
		return "/WEB-INF/Manager/updatetype";
	}
	@RequestMapping("/Manager/updatetype.action")
	public ModelAndView updatetype(Type type, Integer tid) {

		System.out.println("cid2" + tid);
		
		type.setTid(tid);
		
		ModelAndView mv = new ModelAndView();
		
		int res = iTypeService.updatetype(type);

		System.out.println("res" + res);
		if (res > 0) {
			// 修改成功
			mv.setViewName("redirect:typemgr.action");
		} else {
			// 修改失败
			mv.setViewName("redirect:updatetype.action?error=修改失败");
		}
		return mv;
	}
	
	@RequestMapping("/getFType.action")
	@ResponseBody
	public List<HashMap<String, Object>> getFType(){
		//调用Service
		return iTypeService.getFType();
	}
	@RequestMapping("/getSType.action")
	@ResponseBody
	public List<HashMap<String, Object>> getSType(Integer ptid){
		//调用Service
		return iTypeService.getSType(ptid);
	}
}
