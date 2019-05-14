package com.st.stmall.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.st.stmall.dao.TypeMapper;
import com.st.stmall.pojo.Customer;
import com.st.stmall.pojo.Goods;
import com.st.stmall.pojo.Type;
import com.st.stmall.service.ITypeService;
import com.st.stmall.util.Page;

@Service
public class TypeServiceImpl implements ITypeService {

	@Autowired
	private TypeMapper typeMapper;

	@Override
	public int addtype(Type type) {
		// TODO Auto-generated method stub
		return typeMapper.addtype(type);
	}

	@Override
	public Page selectAllType(Type type, Page page) {
		// ��Ҫ֪���м�������
		Integer count = typeMapper.getRows(type);

		System.out.println(count);
		// �����м�ҳ
		page.setRows(count);
		page.setWhere(type);
		// ��ѯ��ǰҳ������Щ����
		List<Goods> list = typeMapper.selectAll(page);
		page.setList(list);
		return page;
	}

	@Override
	public int updatetype(Type type) {
		// TODO Auto-generated method stub
		return typeMapper.updatetype(type);
	}

	@Override
	public List<HashMap<String, Object>> getFType() {
		// TODO Auto-generated method stub
		return typeMapper.getFType();
	}

	@Override
	public List<HashMap<String, Object>> getSType(Integer ptid) {
		// TODO Auto-generated method stub
		return typeMapper.getSType(ptid);
	}
	
	
}
