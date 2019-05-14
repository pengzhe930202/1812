package com.st.stmall.dao;

import java.util.HashMap;
import java.util.List;

import com.st.stmall.pojo.Goods;
import com.st.stmall.pojo.Type;
import com.st.stmall.util.Page;

public interface TypeMapper {

	int addtype(Type type);

	Integer getRows(Type type);

	List<Goods> selectAll(Page page);

	int updatetype(Type type);
	
	List<HashMap<String, Object>> getFType();

	List<HashMap<String, Object>> getSType(Integer ptid);

}
