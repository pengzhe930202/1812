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
		// �ڷ������ݿ�֮ǰ, ����MD5����
		String vpwd = MD5Util.getMD5(customer.getPassword());
		customer.setPassword(vpwd);

		return customerMapper.login(customer);
	}

	@Override
	public int register(Customer customer, String password2) {
		// 1 �Ñ����Ƿ��ظ�
		Customer cusTemp = customerMapper.selectByName(customer.getCname());
		if (cusTemp != null) {
			return -100;
		}
		
		//2���������Ƿ�һ��
		if (!password2.equals(customer.getPassword())) {
			return -200;
		}
		
		//3����
		customer.setPassword(MD5Util.getMD5(customer.getPassword()));
		
		//4д�����ݿ�
		return customerMapper.insert(customer);
	}

	@Override
	public int update(Customer customer, String password2) {
		// ���������Ƿ�һ��
		if (!password2.equals(customer.getPassword())) {
			return -100;
		}
		//�ж��Ƿ�Ϊ���ַ���
		if (!"".equals(password2)) {
			customer.setPassword(MD5Util.getMD5(customer.getPassword()));
		}
		//д�����ݿ�
		return customerMapper.update(customer);
	}

}
