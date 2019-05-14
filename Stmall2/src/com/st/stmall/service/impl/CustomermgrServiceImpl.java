package com.st.stmall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.stmall.dao.CustomermgrMapper;
import com.st.stmall.pojo.Customer;
import com.st.stmall.pojo.Goods;
import com.st.stmall.service.ICustomermgrService;
import com.st.stmall.util.MD5Util;
import com.st.stmall.util.Page;

@Service
public class CustomermgrServiceImpl implements ICustomermgrService {

	@Autowired
	private CustomermgrMapper customermgrMapper;

	@Override
	public Page selectAllCustomermgr(Customer customer, Page page) {
		// 需要知道有几条数据
		Integer count = customermgrMapper.getRows(customer);

		System.out.println(count);
		// 计算有几页
		page.setRows(count);
		page.setWhere(customer);
		// 查询当前页面有哪些数据
		List<Goods> list = customermgrMapper.selectAll(page);
		page.setList(list);
		return page;
	}

	@Override
	public int updatecustomer(Customer customer, String password2) {
		// 两次密码是否一致
		if (!password2.equals(customer.getPassword())) {
			return -100;
		}
		// 判断是否为空字符串
		if (!"".equals(password2)) {
			customer.setPassword(MD5Util.getMD5(customer.getPassword()));
		}
		// 写入数据库
		return customermgrMapper.updatecustomer(customer);
	}

}
