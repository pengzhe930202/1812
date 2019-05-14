package com.st.stmall.service.impl;

import org.apache.tomcat.jni.Mmap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.stmall.dao.ManagerMapper;
import com.st.stmall.pojo.Manager;
import com.st.stmall.service.IManagerService;
@Service
public class ManagerServiceImpl implements IManagerService {
	@Autowired
	private ManagerMapper managerMapper;
	
	@Override
	public Manager login(Manager manager) {
		// TODO Auto-generated method stub
		return managerMapper.login(manager);
	}

	@Override
	public int update(Manager manager, String mpassword2) {
		//密码是否一致
		if (!mpassword2.equals(manager.getMpassword())) {
			return -100;
		}
		
		//写入数据ku
		return managerMapper.update(manager);
	}

}
