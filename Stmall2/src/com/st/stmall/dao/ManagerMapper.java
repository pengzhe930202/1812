package com.st.stmall.dao;

import com.st.stmall.pojo.Manager;

public interface ManagerMapper {
	
	Manager login(Manager manager);

	int update(Manager manager);
}
