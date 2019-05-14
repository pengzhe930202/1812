package com.st.stmall.service;

import java.util.HashMap;
import java.util.List;

import com.st.stmall.pojo.Type;
import com.st.stmall.util.Page;

public interface ITypeService {

	int addtype(Type type);

	Page selectAllType(Type type, Page page);

	int updatetype(Type type);
	
	List<HashMap<String, Object>> getFType();

	List<HashMap<String, Object>> getSType(Integer ptid);
}
