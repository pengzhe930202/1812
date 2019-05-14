package com.st.stmall.dao;

import java.util.List;

import com.st.stmall.pojo.Customer;
import com.st.stmall.pojo.Goods;
import com.st.stmall.util.Page;

public interface CustomermgrMapper {

	Integer getRows(Customer customer);

	List<Goods> selectAll(Page page);

	int updatecustomer(Customer customer);

}
