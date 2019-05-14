package com.st.stmall.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.MethodOverride;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.st.stmall.pojo.Goods;
import com.st.stmall.service.IGoodsService;

import com.st.stmall.util.Page;

@Controller
public class GoodsController {

	@Autowired
	private IGoodsService iGoodsService;

	@RequestMapping("/Manager/goodsmgr.action")
	public String goodsmgr() {
		return "/WEB-INF/Manager/goodsmgr";
	}

	@RequestMapping("Manager/addgoodsview.action")
	public String addgoodsview() {
		return "/WEB-INF/Manager/addgoods";
	}

	@RequestMapping("/Manager/addgoods.action")
	public ModelAndView addGoods(Goods goods, MultipartFile pic, HttpServletRequest request) {

		// 文件保存到哪里?
		String savePath = request.getSession().getServletContext().getRealPath("/upload");

		// 保存文件名
		String fileName = pic.getOriginalFilename();
		String subfix = fileName.substring(fileName.lastIndexOf("."));
		String saveFile = new Date().getTime() + subfix;

		// 文件如何保存?
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			inputStream = pic.getInputStream();

			outputStream = new FileOutputStream(savePath + "/" + saveFile);

			IOUtils.copy(inputStream, outputStream);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (outputStream != null) {
				try {
					outputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		// 把文件名写入到goods中
		goods.setGpic(saveFile);

		// 调用Service层
		int res = iGoodsService.add(goods);

		ModelAndView mView = new ModelAndView();

		if (res > 0) {
			request.setAttribute("goods", goods);
			mView.setViewName("redirect:goodsmgr.action");
		} else {
			mView.setViewName("redirect:addgoodsview.action?error=添加失败");
		}

		return mView;
	}

	@RequestMapping("/getAllGoods.action")
	@ResponseBody
	public Page getAllGoods(Goods goods, Page page) {
		System.out.println(page.getCurpage());

		Page resPage = iGoodsService.selectAllGoods(goods, page);

		return resPage;
	}

	@RequestMapping("Manager/updategoods.action")
	public String updategoods(Integer gid) {
		System.out.println("gid" + gid);
		return "/WEB-INF/Manager/updategoods";
	}

	@RequestMapping("/Manager/updateg.action")
	public ModelAndView updateg(Goods goods, MultipartFile pic, Integer gid, HttpServletRequest request) {

		System.out.println("gid2" + gid);

		// 文件保存到哪里?
		if (pic.getSize() > 0) {

			String savePath = request.getSession().getServletContext().getRealPath("/upload");

			// 保存文件名
			String fileName = pic.getOriginalFilename();
			String subfix = fileName.substring(fileName.lastIndexOf("."));
			String saveFile = new Date().getTime() + subfix;

			// 文件如何保存?
			InputStream inputStream = null;
			OutputStream outputStream = null;
			try {
				inputStream = pic.getInputStream();

				outputStream = new FileOutputStream(savePath + "/" + saveFile);

				IOUtils.copy(inputStream, outputStream);

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if (inputStream != null) {
					try {
						inputStream.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				if (outputStream != null) {
					try {
						outputStream.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

			// 把文件名写入到goods中
			goods.setGpic(saveFile);
			goods.setGid(gid);
		}
		ModelAndView mv = new ModelAndView();
		int res = iGoodsService.update(goods);
		System.out.println("res" + res);
		if (res > 0) {
			// 修改成功
			mv.setViewName("redirect:goodsmgr.action");
		} else {
			// 修改失败
			mv.setViewName("redirect:updategoods.action?error=修改失败");
		}
		return mv;
	}
//	@RequestMapping("Manager/deletegoods.action")
//	public String deletegoods(Integer gid) {
//		System.out.println("gid" + gid);
//		return "/WEB-INF/Manager/goodsmgr";
//	}
	@RequestMapping("Manager/delete.action")
	public ModelAndView delete(Integer gid) {
		ModelAndView mv = new ModelAndView();
		int res = iGoodsService.delete(gid);
		if (res > 0) {
			mv.setViewName("redirect:delete.action");
		}else {
			mv.setViewName("redirect:goodsmgr.action?error=修改失败");
		}
		return mv;
	}
	
	@RequestMapping("/search.action")
	public ModelAndView search() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/WEB-INF/goods/search");
		
		return mv;
		
	}
	@RequestMapping("/selectAllGoods.action")
	@ResponseBody
	public ModelAndView selectAllGoods(Goods goods) {
		ModelAndView mv = new ModelAndView();
		Integer gid = goods.getGid();
		Goods goods2 = iGoodsService.selectAllGoods(gid);
		mv.addObject("goods",goods2);System.out.println(goods2.getGpic());
		mv.setViewName("/WEB-INF/goods/goods1");
		return mv;
	}
	@RequestMapping("/goodsJSON.action")
	@ResponseBody
	public Goods goodsJSON(Integer gid) {
		Goods goods = iGoodsService.selectAllGoods(gid);
		return goods;
	}
	
}
