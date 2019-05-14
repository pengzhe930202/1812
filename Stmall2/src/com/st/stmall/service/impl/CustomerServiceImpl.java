package com.st.stmall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.stmall.dao.CustomerMapper;
import com.st.stmall.pojo.Customer;
import com.st.stmall.service.ICustomerService;
import com.st.stmall.util.MD5Util;

@Service
public class CustomerServiceImpl implements ICustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
	@Override
	public Customer login(Customer customer) {
		// 在访问数据库之前, 进行MD5加密
		String vpwd = MD5Util.getMD5(customer.getPassword());
		customer.setPassword(vpwd);

		return customerMapper.login(customer);
	}

	@Override
	public int register(Customer customer, String password2) {
		// 1 用戶名是否重复
		Customer cusTemp = customerMapper.selectByName(customer.getCname());
		if (cusTemp != null) {
			return -100;
		}
		
		//2两次密码是否一致
		if (!password2.equals(customer.getPassword())) {
			return -200;
		}
		
		//3加密
		customer.setPassword(MD5Util.getMD5(customer.getPassword()));
		
		//4写入数据库
		return customerMapper.insert(customer);
	}

	@Override
	public int update(Customer customer, String password2) {
		// 两次密码是否一致
		if (!password2.equals(customer.getPassword())) {
			return -100;
		}
		//判断是否为空字符串
		if (!"".equals(password2)) {
			customer.setPassword(MD5Util.getMD5(customer.getPassword()));
		}
		//写入数据库
		return customerMapper.update(customer);
	}

}
