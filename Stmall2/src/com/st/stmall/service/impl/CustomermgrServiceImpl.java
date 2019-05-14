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
		// ��Ҫ֪���м�������
		Integer count = customermgrMapper.getRows(customer);

		System.out.println(count);
		// �����м�ҳ
		page.setRows(count);
		page.setWhere(customer);
		// ��ѯ��ǰҳ������Щ����
		List<Goods> list = customermgrMapper.selectAll(page);
		page.setList(list);
		return page;
	}

	@Override
	public int updatecustomer(Customer customer, String password2) {
		// ���������Ƿ�һ��
		if (!password2.equals(customer.getPassword())) {
			return -100;
		}
		// �ж��Ƿ�Ϊ���ַ���
		if (!"".equals(password2)) {
			customer.setPassword(MD5Util.getMD5(customer.getPassword()));
		}
		// д�����ݿ�
		return customermgrMapper.updatecustomer(customer);
	}

}
