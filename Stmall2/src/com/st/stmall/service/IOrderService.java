package com.st.stmall.service;

import java.util.List;

import com.st.stmall.pojo.Details;
import com.st.stmall.pojo.Order;
import com.st.stmall.util.Page;

public interface IOrderService {
	
	int add(Order order);

	List<Order> selectByCid(Integer cid);


	List<Order> selectAllOrder();

	Page selectAllDetails(Details details, Page page);

	

}
