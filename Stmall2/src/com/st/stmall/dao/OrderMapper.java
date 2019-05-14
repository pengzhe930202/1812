package com.st.stmall.dao;

import java.util.List;

import com.st.stmall.pojo.Details;
import com.st.stmall.pojo.Order;
import com.st.stmall.util.Page;

public interface OrderMapper {
	
	int add(Order order);

	List<Order> selectByCid(Integer cid);

	List<Order> selectAllOrder();

	Integer getRows(Details details);

	List<Details> selectAll(Page page);
	



}
