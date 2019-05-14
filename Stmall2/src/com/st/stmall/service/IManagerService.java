package com.st.stmall.service;

import com.st.stmall.pojo.Manager;

public interface IManagerService {
	
	Manager login(Manager manager);

	int update(Manager manager, String mpassword2);
}
