package com.st.stmall.service;

import com.st.stmall.pojo.Customer;
import com.st.stmall.util.Page;

public interface ICustomermgrService {

	Page selectAllCustomermgr(Customer customer, Page page);


	int updatecustomer(Customer customer, String password2);

}
